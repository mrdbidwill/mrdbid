@php
    use App\Models\ImageSpecimen;  use App\Models\Specimen;use App\Utils\ImageUtils;use Illuminate\Support\Facades\DB ;
    //dd($specimens);
@endphp@extends('layouts.app')

@section('content')

        {{-- Show file address if in development environment --}}
    <x-specimens-nav-bar></x-specimens-nav-bar>@if (config('app.env') === 'local')
        <p class="text-gray-500 mt-4">File Address: /resources/views/</p>
    @endif


<!--
 <form action="{{ url('/compares') }}" method="POST">
    @csrf
    <label for="specimen_ids">Select Specimens:</label>
    <select name="specimen_ids[]" id="specimen_ids" multiple>
        @foreach($specimens as $specimen)
            <option value="{{ $specimen->id }}">{{ $specimen->name }}</option>
        @endforeach
    </select>
    <button type="submit">Compare</button>
</form>
    -->
    <@endsection
