<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Gyro;
use App\Models\Board;
use App\Models\Control;
use App\Models\Location;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class APIController extends Controller
{
	public function index()
	{
		return abort(403, 'Unauthorized action.');
	}

	public function login(Request $req)
	{
		$user = User::where('email', '=', $req->email)->first();

		if (!$user) {
			return response()->json("Wrong Email or Password", 401, [], JSON_NUMERIC_CHECK);
		}

		if (Hash::check($req->pass, $user->password)) {
			$data = [
				'name' => $user->name,
				'email' => $user->email,
				'token' => $user->token,
				'status' => $user->status,
			];

			return response()->json(
				$data,
				200,
				[],
				JSON_NUMERIC_CHECK
			);
		} else {
			return response()->json("Wrong Email or Password", 401, [], JSON_NUMERIC_CHECK);
		}
	}

	public function board(Request $request)
	{
		$token = $request->header('Authorization');
		$user = User::select('id')->where('token', '=', $token)->first();
		if (!$user) {
			return response()->json("Unauthorized", 401, [], JSON_NUMERIC_CHECK);
		}

		$board = Board::where('user_id', '=', $user->id)->first();
		if (!$board) {
			return response()->json("Board Not Found", 404, [], JSON_NUMERIC_CHECK);
		}

		$control = Control::select('id', 'alarm', 'mesin', 'listrik', 'notif')->where('board_id', '=', $board->id)->first();
		if (!$control) {
			return response()->json("Control Not Found", 404, [], JSON_NUMERIC_CHECK);
		}

		$gyro = Gyro::select('id', 'x', 'y', 'z')->where('board_id', '=', $board->id)->take(10)->get();
		if (!$gyro) {
			return response()->json("Gyro Not Found", 404, [], JSON_NUMERIC_CHECK);
		}

		$location = Location::select('id', 'lat', 'lon', 'updated_at')->where('board_id', '=', $board->id)->take(10)->get();
		if (!$location) {
			return response()->json("Location Not Found", 404, [], JSON_NUMERIC_CHECK);
		}

		$data = [
			'id' => $board->id,
			'name' => $board->board,
			'control' => [
				'alarm' => $control->alarm,
				'mesin' => $control->mesin,
				'notif' => $control->notif,
				'listrik' => $control->listrik,
			],
			'gyro' => $gyro,
			'location' => $location,
		];

		return response()->json($data, 200, [], JSON_NUMERIC_CHECK);
	}
}
