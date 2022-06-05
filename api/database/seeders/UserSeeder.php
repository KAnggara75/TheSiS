<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;

class UserSeeder extends Seeder
{
	public function run()
	{
		User::create([
			'name' => "Admin",
			'email' => "a@b.c",
			'password' => bcrypt('llllllll'),
			'status' => 1,
		]);
	}
}
