<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Client_shipment_log extends Model
{
    use HasFactory;

    protected $fillable = [
        'from',
        'to',
        'created_by',
        'shipment_id',
    ];

    public function status()
    {
        return $this->belongsTo(Status::class, 'to', 'id');
    }
}
