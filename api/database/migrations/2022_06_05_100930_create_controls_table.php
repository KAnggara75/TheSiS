<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
	public function up()
	{
		Schema::create('controls', function (Blueprint $table) {
			$table->id();
			$table->foreignId('board_id')->constrained('boards')->onDelete('cascade');
			$table->integer('alarm')->default(0);
			$table->integer('mesin')->default(0);
			$table->integer('listrik')->default(0);
			$table->integer('notif')->default(0);
			$table->timestamps();
		});
	}

	public function down()
	{
		Schema::dropIfExists('controls');
	}
};
