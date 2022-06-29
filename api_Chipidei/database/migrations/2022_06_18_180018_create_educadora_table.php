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
        Schema::create('educadora', function (Blueprint $table) {
            $table->string('cod_educadora')->primary(); //rut sin dig verificador
            $table -> string('nom_educadora');
            $table -> string('apell_educadora');
            $table -> dateTime('fecha_nac_educadora');
            //fecha de admision
            //numero
            //direccion
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
        Schema::dropIfExists('educadora');
    }
};
