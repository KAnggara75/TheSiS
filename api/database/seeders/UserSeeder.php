<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;

class UserSeeder extends Seeder
{
	public function run()
	{
		User::create([
			'status' => 1,
			'name' => "Admin",
			'email' => "a@b.c",
			'token' => "F3HUqc56",
			'password' => bcrypt('llllllll'),
		]);
	}
}
