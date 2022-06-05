<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
	public function up()
	{
		Schema::create('boards', function (Blueprint $table) {
			$table->id();
			$table->string('board');
			$table->foreignId('user_id')->constrained('users')->onDelete('cascade');
			$table->timestamps();
		});
	}

	public function down()
	{
		Schema::dropIfExists('boards');
	}
};
