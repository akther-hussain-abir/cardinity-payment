<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
   /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'amount', 'order_items'
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'created_at' => 'datetime',
        'updated-at' => 'datetime',
    ];
}
