<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Package extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'cost'
    ];

    public function package_shipments()
    {
        return $this->hasMany(Package_shipment::class);
    }
}
