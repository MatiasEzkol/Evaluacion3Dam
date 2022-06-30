<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\database\eloquent\SoftDeletes;

class Educadora extends Model
{
    use HasFactory, SoftDeletes;
    protected $table = 'educadora';
    protected $primaryKey= 'rut_educadora';
    public $incrementing= 'false';
    protected $keyType= 'string';

    public function nivel(){
        return $this->belongsTo(nivel::class);
    }
}
