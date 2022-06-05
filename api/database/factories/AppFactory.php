<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class AppFactory extends Factory
{
	public function definition()
	{
		return [
			'user_id' => random_int(1, 5),
			'lat' => 1.6714782,
			'lon' => 101.4225598,
		];
	}
}
