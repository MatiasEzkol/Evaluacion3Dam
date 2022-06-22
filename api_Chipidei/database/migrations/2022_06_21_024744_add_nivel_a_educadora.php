<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('educadora', function (Blueprint $table) {
            $table->string('nivel_educadora');
            $table->foreign('nivel_educadora')->references('cod_nivel')->on('nivel');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('educadora', function (Blueprint $table) {
            //
        });
    }
};
