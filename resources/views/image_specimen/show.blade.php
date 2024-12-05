@php
    use App\Models\ImageSpecimen;  use App\Models\Specimen;use App\Utils\ImageUtils;use Illuminate\Support\Facades\DB ;
    //dd($image_specimens);
@endphp

@extends('layouts.app')

@section('content')

    <x-specimens-nav-bar></x-specimens-nav-bar>

    @if(session('success'))
        <div x-data="{ show: true }" x-init="setTimeout(() => show = false, 5000)" x-show="show"
             x-transition:enter="transition ease-out duration-300" x-transition:enter-start="opacity-0"
             x-transition:enter-end="opacity-100" x-transition:leave="transition ease-in duration-500"
             x-transition:leave-start="opacity-100" x-transition:leave-end="opacity-0"
             class="custom-success text-orange-600">
            <strong>Success!</strong> {{ session('success') }}
        </div>
    @endif

    @if(session('error'))
        <div class="alert alert-danger">
            {{ session('error') }}
        </div>
    @endif

    <!-- if no specimens are found, display message -->
    @if ($image_specimen->count() == 0)
        <p class="text-red-500">No images found.</p>
    @endif

    <p>resources/views/image_specimen/show.blade.php</p>

    @php
        $image_specimen_id = $image_specimen->id;
    @endphp

    <table
        class="w-full table-auto bg-indigo-100 border-separate border border-4-rounded rounded-lg outline-slate-100 outline-4">

<tr>

            <td class="p-2">
{{ $image_specimen['id'] }}

            </td>
        </tr>


        <tr>
            <td class="border-4 border-blue-300 p-2 text-black text-center">
Image Info
            </td>
        </tr>

        <tr>
            <td class="border-4 border-blue-300 p-2">
                Specimen ID: {{ $image_specimen->id }}
            </td>
        </tr>

        <tr>
            <td class="border-4 border-blue-300 p-2">
Available
            </td>
        </tr>

        <tr>
            <td class="border-4 border-blue-300 p-2">
Available
            </td>
        </tr>

        <tr>
            <td class="border-4 border-blue-300 p-2">
Available
            </td>
        </tr>



        <tr>
            <td class="border-4 border-blue-300 p-2 text-fuchsia-700 text-center">
                End image_specimen info.
            </td>
        </tr> <!-- end image_specimen info table line image_specimens/index.blade.php -->
    </table>
@endsection


