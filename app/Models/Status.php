<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Status extends Model
{
    //
    public function clientShipmentLogs()
    {
        return $this->hasMany(Client_shipment_log::class, 'to', 'id');
    }
}
