<?php

namespace Database\Seeders;

use App\Models\App;
use App\Models\User;
use App\Models\Gyro;
use App\Models\Board;
use App\Models\Control;
use App\Models\Location;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
	public function run()
	{
		$this->call([
			UserSeeder::class,
		]);
		User::factory(10)->create();
		Board::factory(5)->create();
		App::factory(10)->create();
		Control::factory(10)->create();
		Gyro::factory(100)->create();
		Location::factory(100)->create();
	}
}
