<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Mission extends Model
{
    use HasFactory;

    protected $fillable = [
        'code',
        'status_id',
        'type',
        'amount',
        'order',
        'due_date',
        'user_id',
        'from_branch_id',
        'to_branch_id',
        'seg_img',
        'otp',
    ];


    public function tobranch()
    {
        return $this->belongsTo(Branch::class, 'to_branch_id');
    }

    public function frombranch()
    {
        return $this->belongsTo(Branch::class, 'from_branch_id');
    }

    public function shipment()
    {
        return $this->hasMany(Shipment::class, 'mission_id','id');
    }
}
