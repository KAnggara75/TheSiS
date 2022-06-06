<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;


class UserFactory extends Factory
{
	public function definition()
	{
		$random = Str::random(8);
		return [
			'name' => $this->faker->name(),
			'email' => $this->faker->unique()->safeEmail(),
			'password' => bcrypt('llllllll'),
			'token' => $random,
			'status' => random_int(0, 2),
		];
	}
}
