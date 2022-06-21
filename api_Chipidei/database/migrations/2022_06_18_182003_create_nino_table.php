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
        Schema::create('nino', function (Blueprint $table) {
            $table->string('cod_nino');
            $table->string('nom_nino');
            $table ->string('apell_nino');
            $table ->string('foto_nino');
            $table->dateTime('fecha_nac_nino');
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('nino');
    }
};
