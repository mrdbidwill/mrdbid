@php
    use App\Models\ImageSpecimen;  use App\Models\Specimen;use App\Utils\ImageUtils;use Illuminate\Support\Facades\DB ;
    //dd($specimens);
@endphp@extends('layouts.app')

@section('content')

    <x-specimens-nav-bar></x-specimens-nav-bar>
    <p>This is views/specimens/index.blade.php.</p>

    @if (Session::has('message'))
        <div class="text-3xl text-red-700">{{ Session::get('message') }}</div>
    @endif

    <!-- if no specimens are found, display message -->
    @if ($specimens->count() == 0)
        <p class="text-red-500">No specimens found.</p>
    @endif
    <div class="container">
        <h1>Specimens</h1>

        <ul>
            @foreach ($specimens as $specimen)
                @php
                    //dd($specimen);
                @endphp
                <li>
                    <a href="{{ route('specimens.show', $specimen->id) }}" style="font-size: 1.2em; color: #e3342f;">
                        ID: {{ $specimen->id }}  {{ $specimen->name }} </a> Common Name: {{ $specimen->common_name }}
                    Description: {{ $specimen->description }} Comments: {{ $specimen->comment }}
                </li>
            @endforeach
        </ul>

        <!-- Pagination links -->
        {{ $specimens->links() }}
    </div>

@endsection


