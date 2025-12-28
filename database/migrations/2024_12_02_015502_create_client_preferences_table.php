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
        Schema::create('client_preferences', function (Blueprint $table) {
            $table->id();
            $table->integer('client_id')->unsigned();
            $table->double('pickup_cost')->default(0);
            $table->double('supply_cost')->default(0);
            $table->double('def_mile_cost')->nullable();
            $table->double('def_shipping_cost')->nullable();
            $table->double('def_tax')->nullable();
            $table->double('def_insurance')->nullable();
            $table->double('def_return_mile_cost')->nullable();
            $table->double('def_return_cost')->nullable();
            $table->double('def_shipping_cost_gram')->default(0);
            $table->double('def_mile_cost_gram')->default(0);
            $table->double('def_tax_gram')->default(0);
            $table->double('def_insurance_gram')->default(0);
            $table->double('def_return_cost_gram')->default(0);
            $table->double('def_return_mile_cost_gram')->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('client_preferences');
    }
};
