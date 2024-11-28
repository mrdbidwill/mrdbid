@extends('layouts.app')

@section('content')

    <x-specimens-nav-bar></x-specimens-nav-bar>

    @if (Session::has('message'))
        <div class="text-3xl text-red-700">{{ Session::get('message') }}</div>
    @endif


    <div class="space-y-12">
        <div class="border-b border-gray-900/10 pb-12">
            <div class="mt-6 gap-y-4">
                <form method="POST" action="{{ route('custom_image_specimen.store') }}" enctype="multipart/form-data">
                    @csrf
                    <div>
                        <label for="image_name" class="block text-sm font-medium leading-6 text-gray-900">Select image
                            for this specimen:</label>
                        <div class="mt-2">
                            <div
                                class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                                <input type="file" name="image_name" id="image_name"
                                       class="block flex-1 border-0 bg-transparent py-1.5 px-3 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
                                       value="" required>
                            </div>


                            @error('image_name')
                            <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                            @enderror
                        </div>
                    </div>


                    <div class="sm:col-span-4">
                        What part of specimen?
                        <div class="mt-2">
                            @php
                                $specimen_data = DB::table( 'parts' )->get();
                                //dd($specimen_data);
                            @endphp
                            <table>
                                @foreach($specimen_data as $item)

                                    <tr>
                                        <td>
                                            @if( $item->id == 1)
                                                <input type="radio" id="parts" name="parts" value="{{$item->id}}"
                                                       required checked>
                                            @else
                                                <input type="radio" id="parts" name="parts" value="{{$item->id}}"
                                                       required>
                                            @endif
                                            <label for="parts">{{$item->id}}. {{$item->name}}</label> <b>-</b> {{$item->description}}
                                        </td>
                                    </tr>
                                @endforeach
                            </table>

                            @error('parts')
                            <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                            @enderror
                        </div>
                    </div>


                    <div class="sm:col-span-4">
                        <label for="description"
                               class="block text-sm font-medium leading-6 text-gray-900">Description</label>
                        <div class="mt-2">
                            <div
                                class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                                <input type="text" name="description" id="description"
                                       class="block flex-1 border-0 bg-transparent py-1.5 px-3 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
                                       placeholder="Short description of the image:" value="" required>
                            </div>

                            @error('description')
                            <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                            @enderror
                        </div>
                    </div>

                    <div class="mx-auto mt-6">
                        <div>
                            <!--  Add the hidden input field to store the specimen_id  -->
                            <input type="hidden" name="specimen_id" value="{{$specimen_id}}">
                            <x-primary-button>Submit</x-primary-button>
                        </div>

                    </div>
                </form>
            </div>
        </div>
    </div>

@endsection


