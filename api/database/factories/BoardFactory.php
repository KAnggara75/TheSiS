<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class BoardFactory extends Factory
{
	public function definition()
	{
		return [
			'board' => $this->faker->name(),
			'user_id' => random_int(1, 10),
		];
	}
}
