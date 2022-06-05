<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
	public function up()
	{
		Schema::create('apps', function (Blueprint $table) {
			$table->id();
			$table->foreignId('user_id')->constrained('users')->onDelete('cascade');
			$table->double('lat', 10, 7);
			$table->double('lon', 10, 7);
			$table->timestamps();
		});
	}

	public function down()
	{
		Schema::dropIfExists('apps');
	}
};
