<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Package_shipment extends Model
{
    use HasFactory;

    protected $fillable = [
        'package_id',
        'shipment_id',
        'description',
        'weight',
        'length',
        'width',
        'height',
        'qty',
    ];
    
    public function package()
    {
        return $this->belongsTo(Package::class, 'package_id', 'id');
    }
    
}
