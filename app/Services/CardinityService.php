<?php

namespace App\Services;

use Cardinity\Client;
use Cardinity\Method\Payment;
use Cardinity\Exception;

class CardinityService
{
    protected $client;

    public function __construct()
    {
        if (env('CARDINITY_KEY') == '' || env('CARDINITY_SECRET') == '') {
            return redirect()->back()->with('error', 'No Payment Settings Configured Properly.');
        }

        $this->client = Client::create([
            'consumerKey' => env('CARDINITY_KEY'),
            'consumerSecret' => env('CARDINITY_SECRET'),
        ]);
    }

    public function create_payment($data, $order) {

        $paymentBody = $this->paymentBodyCreate($data);

        try {
            $payment = $this->client->call($paymentBody);            
            $status = $payment->getStatus();

            if($status == 'approved') {
                return $payment;
            }

            if($status == 'pending') {
                // Retrieve information for 3D-Secure authorization
                $url = $payment->getAuthorizationInformation()->getUrl();
                $data = $payment->getAuthorizationInformation()->getData();
            }

        } catch (Exception\Declined $exception) {        
            $payment = $exception->getResult();
            $status = $payment->getStatus(); // value will be 'declined'
            $errors = $exception->getErrors(); // list of errors occured
        } catch (Exception\ValidationFailed $exception) {        
            $payment = $exception->getResult();
            $status = $payment->getStatus(); // value will be 'declined'
            $errors = $exception->getErrors(); // list of errors occured
        }


    }


    public function completePayment($paymentId, $payerId)
    {
        $payment = Payment::get($paymentId, $this->payPal);
        $execute = new PaymentExecution();
        $execute->setPayerId($payerId);

        try {
            $result = $payment->execute($execute, $this->payPal);
        } catch (PayPalConnectionException $exception) {
            $data = json_decode($exception->getData());
            $_SESSION['message'] = 'Error, '. $data->message;
            // implement your own logic here to show errors from paypal
            exit;
        }

        if ($result->state === 'approved') {
            $transactions = $result->getTransactions();
            $transaction = $transactions[0];
            $invoiceId = $transaction->invoice_number;

            $relatedResources = $transactions[0]->getRelatedResources();
            $sale = $relatedResources[0]->getSale();
            $saleId = $sale->getId();

            $transactionData = ['salesId' => $saleId, 'invoiceId' => $invoiceId];

            return $transactionData;
        } else {
            echo "<h3>".$result->state."</h3>";
            var_dump($result);
            exit(1);
        }
    }


    public function paymentBodyCreate($data) {

        $amount = floatval($data['amount']);
        $amount = number_format($amount, 2, '.', '');
    
        $method = new Payment\Create([
            'amount' => $amount,
            'currency' => 'EUR',
            'settle' => false,
            'description' => 'Order Payment Process Body',
            'order_id' => strval($data['order_id']),
            'country' => 'LT',
            'payment_method' => Payment\Create::CARD,
            'payment_instrument' => [
                'pan' => strval($data['card_details']['cardNumber']),
                'exp_year' => intval($data['card_details']['cardYear']),
                'exp_month' => intval($data['card_details']['cardMonth']),
                'cvc' => strval($data['card_details']['cardCvv']),
                'holder' => $data['card_details']['cardName']
            ],
        ]);

        return $method;

    }
}