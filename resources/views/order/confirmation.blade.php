@extends('layouts')

@section('contents')
    <div class="flex p-4 bg-blue-200">
        <h1 class="text-center font-semibold">Payment Confimation</h1>

        @if(!empty($data)) 
        <div class="flex items-center justify-center">
            <h4 class="py-4 font-semibold text-gray-500">Payment successfull</h4>
        </div>
        @endif
    </div>
@endsection