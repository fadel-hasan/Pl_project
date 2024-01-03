<?php

namespace App\Models;

use App\Models\Medicine;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Category extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'desc'
    ];


    protected $table = 'category';
    
    public function medicines()
    {
        return $this->hasMany(Medicine::class); // Assuming a one-to-many relationship
    }
}
