<?php

namespace App\Models;


use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ShipmentAttachment extends Model
{
    use HasFactory;

    protected $fillable = ['shipment_id', 'file_path'];

    public function shipment()
    {
        return $this->belongsTo(Shipment::class);
    }
}
