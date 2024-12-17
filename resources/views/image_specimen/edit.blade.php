@extends('layouts.app')

@section('content')
    @php
        //dd($imageSpecimen);
    @endphp
    <x-specimens-nav-bar></x-specimens-nav-bar>

    @if (Session::has('message'))
        <div class="text-3xl text-red-700">{{ Session::get('message') }}</div>
    @endif
    <div class="mt-6 flex items-center justify-between gap-x-6"></div>

    <p>This is views/images_specimen/edit.blade.php</p>

    <div class="mt-6 flex items-center justify-between gap-x-6 p-4">
        @php
            $image_address = url('storage/uploaded_images/'.$imageSpecimen->file_address);
        @endphp

        <img src="<?php echo $image_address; ?>" alt="<?php echo $image_address; ?>">
    </div>

    <form method="POST" action="{{ route('image_specimen.update', $imageSpecimen->id) }}">
        @csrf
        @method('PATCH')  <!--or PUT? -->

        <table
            class="w-full table-auto bg-indigo-100 border-separate border border-4-rounded rounded-lg outline-slate-100 outline-4">
            <!-- begin edit image_specimen table -->
            <tr>
                <td class="border-4 border-blue-300 p-2 text-black text-center">
                    What part of specimen?

                    @php
                        $specimen_data = DB::table( 'parts' )->get();
                        //dd($specimen_data);
                    @endphp
                    <table>
                        @foreach($specimen_data as $item)

                            <tr>
                                <td>
                                    <div class="form-group">
                                        <div class="radio-wrapper">
                                            @if( $item->id == 1)
                                                <input class="radio-button" type="radio" id="parts" name="parts" value="{{$item->id}}"
                                                       required checked>
                                            @elseif($item->id ==$imageSpecimen['parts'])
                                                <input  class="radio-button"  type="radio" id="parts" name="parts" value="{{$item->id}}"
                                                        required checked>
                                            @else
                                                <input  class="radio-button"  type="radio" id="parts" name="parts" value="{{$item->id}}"
                                                        required>
                                            @endif
                                            <label for="parts">{{$item->id}}. {{$item->name}}</label> <b>-</b> {{$item->description}}
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        @endforeach
                    </table>

                    @error('parts')
                    <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                    @enderror
                </td>
            </tr>


            <tr>
                <td class="border-4 border-blue-300 p-2 text-black text-center">
                    <label for="description" class="block text-sm font-medium leading-6 text-gray-900">Description</label>

                    <textarea  name="description" rows="12" style="width: 100%;">{{ old('description', $imageSpecimen->description) }}</textarea>

                    @error('description')
                    <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                    @enderror
                </td>
            </tr>


            <tr>
                <td class="border-4 border-blue-300 p-2 text-black text-center">




                    <div>
                        <button type="submit"
                                class="rounded-md bg-indigo-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">
                            Update
                        </button>
                    </div>

                </td>
            </tr>
        </table>
    </form>

    <table class="w-full table-auto bg-indigo-100 border-separate border border-4-rounded rounded-lg outline-slate-100 outline-4">
        <tr>
            <td class="border-4 border-blue-300 p-2 text-black text-center">

                <div class="mt-6 flex items-center justify-between gap-x-6">
                    <div class="flex items-center">
                        <button form="delete-form" class="text-red-500 text-sm font-bold">Delete</button>
                    </div>

                    <div class="flex items-center gap-x-6">
                        <a href="/specimens/{{ $imageSpecimen->specimen_id }}" class="text-sm font-semibold leading-6 text-gray-900">Cancel</a>
                    </div>
                </div>

                <form method="POST" action="/image_specimen/{{ $imageSpecimen->id }}" id="delete-form" class="hidden">
                    @csrf
                    @method('DELETE')
                </form>
            </td>
        </tr>
    </table>

@endsection

