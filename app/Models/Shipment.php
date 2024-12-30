<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Shipment extends Model
{
    use HasFactory;

    protected $fillable = [
        'code',
        'status_id',
        'type',
        'shipping_date',
        'collection_time',
        'client_status',
        'client_id',
        'receiver_name',
        'receiver_mobile',
        'receiver_address',
        'from_branch_id',
        'to_branch_id',
        'payment_type',
        'paid',
        'payment_integration_id',
        'payment_method_id',
        'tax',
        'insurance',
        'delivery_time',
        'shipping_cost',
        'return_cost',
        'total_weight',
        'amount_to_be_collected',
        'employee_user_id',
        'attachments_before_shipping',
        'attachments_after_shipping',
        'mission_id',
        'order_id',
        'otp',
        'barcode'
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array
     */
    protected $casts = [
        'shipping_date' => 'date',
        'collection_time' => 'datetime',
        'tax' => 'float',
        'insurance' => 'float',
        'shipping_cost' => 'float',
        'return_cost' => 'float',
        'total_weight' => 'float',
        'amount_to_be_collected' => 'float',
        'paid' => 'boolean',
    ];
    /**
     * Relationships
     */
    // Relationship to To Branch

    // Relationship to ClientShipmentLog
    public function shipmentLogs()
    {
        return $this->hasMany(Client_shipment_log::class);
    }

    // Relationship to PackageShipments
    public function packages()
    {
        return $this->hasMany(Package_shipment::class, 'shipment_id');
    }

    public function fromBranch()
    {
        return $this->belongsTo(Branch::class, 'from_branch_id', 'id');
    }

    public function toBranch()
    {
        return $this->belongsTo(Branch::class, 'to_branch_id', 'id');
    }

    public function client()
    {
        return $this->belongsTo(Client::class, 'client_id', 'id');
    }

    public function receiver()
    {
        return $this->belongsTo(Receiver::class, 'receiver_name', 'id');
    }
    public function status()
    {
        return $this->belongsTo(Status::class, 'status_id', 'id');
    }
    public function mission()
    {
        return $this->belongsTo(Mission::class, 'mission_id', 'id');
    }

}
