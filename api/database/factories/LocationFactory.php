<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class LocationFactory extends Factory
{
	public function definition()
	{
		return [
			'board_id' => 1,
			'lat' => 1.6714782,
			'lon' => 101.4225598,
		];
	}
}
