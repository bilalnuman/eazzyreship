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
        Schema::create('shipments', function (Blueprint $table) {
            $table->id();
            $table->string('code')->unique()->nullable();
            $table->integer('status_id')->default(1);
            $table->tinyInteger('type');
            $table->date('shipping_date')->nullable();
            $table->dateTime('collection_time')->nullable();
            $table->integer('client_status')->default(1);
            $table->integer('client_id')->unsigned()->nullable();
            $table->string('receiver_name')->nullable();
            $table->text('receiver_mobile')->nullable();
            $table->string('receiver_address')->nullable();           
            $table->integer('from_branch_id')->unsigned();
            $table->integer('to_branch_id')->unsigned();
            $table->string('carrier')->nullable();
            $table->string('carrier_doc')->nullable();
            $table->tinyInteger('payment_type')->nullable();
            $table->tinyInteger('paid')->default(0);
            $table->text('payment_integration_id')->nullable();
            $table->string('payment_method_id')->nullable();
            $table->double('tax')->default(0);
            $table->double('insurance')->default(0);
            $table->double('discount')->default(0);
            $table->double('hazmat')->default(0);
            $table->double('imo')->default(0);
            $table->double('handling')->default(0);
            $table->double('sed')->default(0);
            $table->dateTime('delivery_time')->nullable();
            $table->double('shipping_cost')->default(0);
            $table->double('return_cost')->default(0);
            $table->double('total_weight')->default(0);
            $table->double('total_volumetric')->default(0);
            $table->integer('amount_to_be_collected')->default(0);
            $table->integer('employee_user_id')->unsigned()->nullable();
            $table->text('attachments_before_shipping')->nullable();
            $table->text('attachments_after_shipping')->nullable();
            $table->integer('mission_id')->nullable();
            $table->string('order_id')->unique()->nullable();
            $table->string('otp')->nullable();
            $table->string('barcode')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('shipments');
    }
};
