<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Payment extends Model
{
    use HasFactory;

    protected $fillable = [
        'seller_id',
        'shipment_id',
        'amount',
        'payment_details',
        'payment_method',
        'txn_code',
        'payment_date'
    ];

    // Relación con el envío (Shipment)
    public function shipment()
    {
        return $this->belongsTo(Shipment::class, 'shipment_id', 'id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'seller_id', 'id');
    }
}
