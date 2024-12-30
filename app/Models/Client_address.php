<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Client_address extends Model
{
    protected $fillable = [
        'address',
        'country_id',
        'state_id',
        'client_id'
    ]; 
    
    public function client()
    {
        return $this->belongsTo(Client::class);
    }
}
