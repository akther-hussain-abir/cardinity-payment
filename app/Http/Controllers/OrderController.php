<?php

namespace App\Http\Controllers;

use App\Order;
use App\Payment;
use Illuminate\Http\Request;
use App\Services\CardinityService;

class OrderController extends Controller
{
    protected $cardinityService;

    public function __construct(CardinityService $cardinityService)
    {
        $this->cardinityService = $cardinityService;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return View('order.index');
    }

    /**
     * Checkout process to save cart data and process for make payment
     *
     * @return \Illuminate\Http\Response
     */
    public function checkout(Request $request)
    {                
        return View('order.checkout');
    }

    /**
     * create order to process payment
     *
     * @return \Illuminate\Http\Response
     */
    public function place_order(Request $request)
    {                
        $orderItems = $request->items;
        $subTotal = $request->subtotal;    
        
        $payload = Order::create([
            'amount' => $subTotal,
            'order_items' => json_encode($orderItems)
        ]);

        return response()->json([ 'status' => 'success', 'msg' => 'Order created', 'data' => $payload]);
    }


    /**
     * create payment with customer details
     *
     * @return \Illuminate\Http\Response
     */
    public function process_payment(Request $request)
    {                 
        $orderId = $request->order_id;
        $order = Order::findOrFail($orderId);

        $paymentResponse = $this->cardinityService->create_payment($request->all(), $order);

        /**
         *  id: 'b19ed5d5-2946-4eca-85e9-ed013aaa1152',
            amount: '50.00',
            currency: 'EUR',
            created: '2020-09-03T14:51:44.735Z',
            type: 'purchase',
            live: false,
            description: 'Payment from NodeJS',
            status: 'pending',
            country: 'LT',
            order_id: 'NodeJS1',
            payment_method: 'card',
            payment_instrument: {
                card_brand: 'MasterCard',
                pan: '5454',
                exp_year: 2222,
                exp_month: 2,
                holder: 'John Doe'
            },
            authorization_information: { url: 'https://acs.cardinity.com', data: '3d-pass' }
         */
        $paymentdata = Payment::create([
            'order_id' => $orderId,
            'payment_body' => json_encode($paymentResponse),
            'payment_id' => $paymentResponse->id
        ]);
        
        
        return response()->json([ 'status' => 'success', 'msg' => 'Payment created', 'data' => $paymentdata]);
    }

    /**
     * customer verification page redirection
     */
    public function carnity_3d_payment(Request $request) {

        $md = $request->payment_id;
        $data = $request->data;
        $url  = $request->url;
        $termUrl = 'order/payment-confirmation';

        return View('order.cardinity3d', compact(['data', 'url', 'termUrl', 'md' ]));
    }

    public function payment_confirmation(Request $request) {

        $data = $request->all();

        return View('order.confirmation', compact('data'));

    }

}
