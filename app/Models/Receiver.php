<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Receiver extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'country_code',
        'receiver_address',
        'receiver_mobile',
        'branch_id',
    ];
}
