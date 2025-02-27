@php
    //   use App\Models\ImageSpecimen;
    //   use App\Models\Specimen;
    //   use App\Utils\ImageUtils;
    //   use Illuminate\Support\Facades\DB ;
       //dd($specimens);
@endphp@extends('layouts.app')

@section('content')

    {{-- Show file address if in development environment --}}
    <x-specimens-nav-bar></x-specimens-nav-bar>

    @if (config('app.env') === 'local')
        <p class="text-gray-500 mt-4">File Address: /resources/views/specimens/index.blade.php</p>
    @endif


    @if (Session::has('message'))
        <div class="text-3xl text-red-700">{{ Session::get('message') }}</div>
    @endif

    <!-- <p>resources/views/specimens/index.blade.php</p>  -->


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
                        ID: {{ $specimen->id }}  {{ $specimen->specimen_name }}</a> Images
                    ({{ $specimen->images_specimens_count }}) Groups ({{ $specimen->groups_count }}) Clusters
                    ({{ $specimen->clusters_count }})


                    @if (!empty($specimen->common_name))
                        Common Name: {{ $specimen->common_name }}
                    @endif

                    @if (!empty($specimen->description))
                        Description: {{ $specimen->description }}
                    @endif

                    @if (!empty($specimen->comment))
                        Comments: {{ $specimen->comment }}
                    @endif
                </li>
            @endforeach
        </ul>

        <!-- Pagination links -->
        {{ $specimens->onEachSide(3)->links() }}
    </div>

@endsection


