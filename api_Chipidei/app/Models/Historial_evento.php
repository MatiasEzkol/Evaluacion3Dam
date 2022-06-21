<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\database\eloquent\SoftDeletes;

class Historial_evento extends Model
{
    use HasFactory, SoftDeletes;
    protected $table = 'historial_evento';
    protected $primaryKey= 'cod_evento';
    public $incrementing= 'false';
    protected $keyType= 'string';

    // public function nino(){
    //     return $this->belongsTo(nino::class);
    // }
}
