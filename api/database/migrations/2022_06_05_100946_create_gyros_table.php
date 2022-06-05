<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
	public function up()
	{
		Schema::create('gyros', function (Blueprint $table) {
			$table->id();
			$table->foreignId('board_id')->constrained('boards')->onDelete('cascade');
			$table->integer('x');
			$table->integer('y');
			$table->integer('z');
			$table->timestamps();
		});
	}

	public function down()
	{
		Schema::dropIfExists('gyros');
	}
};
