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
        Schema::create('holiday_leaves', function (Blueprint $table) {
            $table->id();
            $table->date('holiday_date')->nullable();
            $table->string('holiday_name')->nullable();
            $table->integer('status')->comment('1 for active, 0 for inactive')->nullable();
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('holiday_leaves');
    }
};
