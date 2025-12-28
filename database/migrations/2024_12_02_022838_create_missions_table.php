<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('missions', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('code')->nullable();
            $table->integer('status_id')->nullable()->default('1');
            $table->integer('type')->default('1');
            $table->double('amount')->default('0');
            $table->unsignedInteger('order')->default('0');
            $table->string('due_date')->nullable();
            $table->integer('user_id')->nullable()->unsigned();;
            $table->integer('from_branch_id')->nullable();
            $table->integer('to_branch_id')->nullable();
            $table->string('seg_img')->nullable();
            $table->string('otp')->nullable();
            $table->timestamps();
        });
    }


    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('missions');
    }
};
