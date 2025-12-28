<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Branch extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'email',
        'responsible_mobile',
        'country_id',
        'state_id',
        'area_id',
        'address',
        'type',
        'is_archived',
        'created_by',
        'updated_by',
    ];
    // Branch.php
    public function missions()
    {
        return $this->hasMany(Mission::class, 'to_branch_id');
    }

    // App\Models\Branch.php
    public function country()
    {
        return $this->belongsTo(Country::class, 'country_id', 'id');
    }

    // App\Models\Branch.php
    public function state()
    {
        return $this->belongsTo(State::class, 'state_id', 'id');
    }
}
