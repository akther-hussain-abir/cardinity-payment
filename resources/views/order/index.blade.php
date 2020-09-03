@extends('layouts')

@section('contents')
    <div class="flex">
        <div class="w-2/3 flex flex-auto bg-blue-100 p-3 mb-2">        
            <product-component></product-component>        
        </div>

        <div class="w-1/3 flex flex-auto bg-gray-100 p-3 mb-2">            
            <div class="flex w-full">
                <Cart></Cart>                                
            </div>
        </div>
    </div>
@endsection

