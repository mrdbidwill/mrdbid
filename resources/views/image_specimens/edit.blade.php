@extends('layouts.app')

@section('content')
    @php
        //dd($imageSpecimen);
    @endphp
        {{-- Show file address if in development environment --}}
    <x-specimens-nav-bar></x-specimens-nav-bar>@if (config('app.env') === 'local')
        <p class="text-gray-500 mt-4">File Address: /resources/views/image_specimens/edit.blade.php</p>
    @endif


    @if (Session::has('message'))
        <div class="text-3xl text-red-700">{{ Session::get('message') }}</div>
    @endif
    <div class="mt-6 flex items-center justify-between gap-x-6"></div>

    <p>This is views/images_specimen/edit.blade.php</p>

    <table class="w-full table-auto bg-indigo-100 border-separate border border-4-rounded rounded-lg outline-slate-100 outline-4">
        <x-action-buttons
            :cancelUrl="route('specimens.show', $imageSpecimen->specimen_id)"
            :deleteAction="route('image_specimens.destroy', $imageSpecimen->id)"
            deleteItem="This Image"/>
    </table>

    <div class="mt-6 flex items-center justify-between gap-x-6 p-4">
        @php
            $image_address = url('storage/uploaded_images/'.$imageSpecimen->file_address);
        @endphp

        <img src="<?php echo $image_address; ?>" alt="<?php echo $image_address; ?>">
    </div>

    <table class="w-full table-auto bg-indigo-100 border-separate border border-4-rounded rounded-lg outline-slate-100 outline-4">
        <x-action-buttons
            :cancelUrl="route('specimens.show', $imageSpecimen->specimen_id)"
            :deleteAction="route('image_specimens.destroy', $imageSpecimen->id)"
            deleteItem="This Image"/>
    </table>

    <form method="POST" action="{{ route('image_specimens.update', $imageSpecimen->id) }}">
        @csrf
        @method('PATCH')  <!--or PUT? -->

        <table class="w-full table-auto bg-indigo-100 border-separate border border-4-rounded rounded-lg outline-slate-100 outline-4">
            <!-- begin edit image_specimens table -->
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
    <x-action-buttons
        :cancelUrl="route('specimens.show', $imageSpecimen->specimen_id)"
        :deleteAction="route('image_specimens.destroy', $imageSpecimen->id)"
         deleteItem="This Image"/>
    </table>

@endsection

