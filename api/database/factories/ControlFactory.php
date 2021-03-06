<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class ControlFactory extends Factory
{
	public function definition()
	{
		return [
			'board_id' => 1,
			'alarm'    => random_int(0, 1),
			'mesin'    => random_int(0, 1),
			'listrik'  => random_int(0, 1),
			'notif'    => random_int(0, 1),
		];
	}
}
