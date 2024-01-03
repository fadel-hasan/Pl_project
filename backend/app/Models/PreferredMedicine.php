<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PreferredMedicine extends Model
{
    use HasFactory;


    protected $fillable = [
        'user_id',
        'medicine_id'
    ];

    protected $table = 'preferred_medicines';


    
}
