<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
	public function index()
	{
		return abort(403, 'Unauthorized action.');
	}

	public function login(Request $req)
	{
		$user = User::where('email', '=', $req->email)->first();
		if (!$user) {
			return response()->json("User Not Found", 200);
		}
		if (Hash::check($req->pass, $user->password)) {
			$data = [
				'name' => $user->name,
				'email' => $user->email,
				'status' => $user->status,
			];
			return response()->json($data, 200, [], JSON_NUMERIC_CHECK);
		} else {
			return response()->json(['name' => 'Guest', 'email' => $req->email, 'status' => 0], 401);
		}
	}

	public function logout(Request $request)
	{
		return response()->json("OK", 201, [], JSON_NUMERIC_CHECK);
	}
}
