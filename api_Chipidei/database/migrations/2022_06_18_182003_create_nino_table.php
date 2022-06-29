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
            $table->string('rut_nino')->primary(); //rut sin dig verificador
            $table->string('nom_nino');
            $table ->string('apell_nino');
            $table ->string('foto_nino');
            $table->dateTime('fecha_nac_nino');
            $table->dateTime('fecha_adm_nino');
            $table ->string('nom_padre_nino');
            $table ->string('nom_madre_nino');
            $table ->string('tel_nino');
            $table ->string('direccion_nino'); 

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
