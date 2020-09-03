<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    
    protected $fillable = ['name', 'slug', 'image_urls', 'price_type', 'max_price', 'min_price', 'min_discounted_price'];
    
    
}
