<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class GyroFactory extends Factory
{
	public function definition()
	{
		return [
			'board_id' => 1,
			'x' => random_int(0, 1023),
			'y' => random_int(0, 1023),
			'z' => random_int(0, 1023),
		];
	}
}
