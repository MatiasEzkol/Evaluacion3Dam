<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\database\eloquent\SoftDeletes;

class Nino extends Model
{
    use HasFactory, SoftDeletes;
    protected $table = 'nino';
    protected $primaryKey= 'cod_nino';
    public $incrementing= 'false';
    protected $keyType= 'string';

    // public function nivel(){
    //     return $this->belongsTo(nivel::class);
    // }
}
