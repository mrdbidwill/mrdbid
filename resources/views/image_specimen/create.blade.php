@extends('layouts.app')

@section('content')

    <x-specimens-nav-bar></x-specimens-nav-bar>

    @if (Session::has('message'))
        <div class="text-3xl text-red-700">
            {{ Session::get('message') }}
        </div>
    @endif

    @if (Session::has('success'))
        <div class="alert alert-success">
            {{ Session::get('success') }}
        </div>
    @endif

    @if (Session::has('error'))
        <div class="alert alert-danger">
            {{ Session::get('error') }}
        </div>
    @endif

    @if (Session::has('warning'))
        <div class="alert alert-warning">
            {{ Session::get('warning') }}
        </div>
    @endif

    @if ($errors->any())
        <div class="alert alert-danger">
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif


    <div class="space-y-12">
        <div class="border-b border-gray-900/10 pb-12">
            <div class="mt-6 gap-y-4">
                <form method="POST" action="{{ route('image_specimen.store') }}" enctype="multipart/form-data">
                    @csrf
                    <div>
                        <label for="images" class="block text-sm font-medium leading-6 text-gray-900">Select images for this specimen:</label>
                        <div class="mt-2">
                            <div class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                                <input type="file" name="images[]" id="images" class="block flex-1 border-0 bg-transparent py-1.5 px-3 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6" multiple required>
                            </div>
                            @error('images')
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
                                       placeholder="Short description of the image:" value="">
                            </div>

                            @error('description')
                            <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                            @enderror
                        </div>
                    </div>

                    <div class="sm:col-span-4">
                        <br><br>
                        <p>Lens is optional, but people like to know how you took a great picture. I thought about a lookup table of all the different lens, but it would get out of control quickly. I understand some lens descriptions get quite long, so it is up to you. I would hope if you use the same or a few lens, your browser will remember form input, but can't guarantee that.</p>
                        <label for="lens"
                               class="block text-sm font-medium leading-6 text-gray-900">Lens</label>
                        <div class="mt-2">
                            <div
                                class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                                <input type="text" name="lens" id="lens"
                                       class="block flex-1 border-0 bg-transparent py-1.5 px-3 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
                                       placeholder="What lens did you use:" value="">
                            </div>

                            @error('lens')
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


