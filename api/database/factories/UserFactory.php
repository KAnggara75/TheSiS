<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class UserFactory extends Factory
{
	public function definition()
	{
		return [
			'name' => $this->faker->name(),
			'email' => $this->faker->unique()->safeEmail(),
			'password' => bcrypt('llllllll'),
			'status' => random_int(0, 2),
		];
	}
}
