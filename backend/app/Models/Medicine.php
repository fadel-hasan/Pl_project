<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Medicine extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'scientific_name',
        'manufacturer_name',
        'category_id',
        'company_id',
        'quantity',
        'price',
        'expire_date'
    ];

    public function company(){
        return $this->belongsTo(Company::class);
    }

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function preferredMedicines()
    {
        return $this->belongsToMany(User::class, 'preferred_medicines');
    }
}
