<?php

use Illuminate\Support\Facades\Route;


Route::get('/', function() {
    return redirect('order');
});

Route::group(['prefix' => 'order'], function() {
    Route::get('/', 'OrderController@index')->name('order-now');
    Route::get('checkout', 'OrderController@checkout')->name('checkout');

    Route::get('confirmation/{id}', 'OrderController@confirmation')->name('payment-confirmation');
});

