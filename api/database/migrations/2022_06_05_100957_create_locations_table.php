<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
	public function up()
	{
		Schema::create('locations', function (Blueprint $table) {
			$table->id();
			$table->foreignId('board_id')->constrained('boards')->onDelete('cascade');
			$table->double('lat', 10, 7);
			$table->double('lon', 10, 7);
			$table->timestamps();
		});
	}

	public function down()
	{
		Schema::dropIfExists('locations');
	}
};
