<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\database\eloquent\SoftDeletes;

class Nivel extends Model
{
    use HasFactory, SoftDeletes;
    protected $table = 'nivel';
    protected $primaryKey= 'cod_nivel';
    public $incrementing= 'false';
    protected $keyType= 'string';
}
