@extends('layouts.app')
@section('title', $viewData['title'])
@section('subtitle', $viewData['subtitle'])
@section('content')
    <div class="container">
        <div class="row">
            <div class="col-1">
                <h1>{{$viewData['title']}}</h1>
                <h2>{{$viewData['subtitle']}}</h2>
                <table class="table table-auto table-striped table-bordered table-hover table-sm table-responsive">
                    <thead>
                    <tr class="even:bg-gray-200 odd:bg-gray-100">
                        <th>ID</th>
                        <th>Name</th>
                        <th>Owner</th>
                        <th>Comments</th>
                        <th>Common Name</th>
                        <th>Month</th>
                        <th>Day</th>
                        <th>Year</th>
                        <th>County</th>
                        <th>City</th>
                        <th>State</th>
                        <th>Country</th>
                        <th>Annulus Position</th>
                        <th>Cap Context Flesh Texture</th>
                        <th>Entered By</th>
                        <th>Created</th>
                        <th>Updated</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach( $viewData['specimens'] as $s )
                        <tr class="even:bg-gray-200 odd:bg-gray-100">
                            <td>{{$s->id }}</td>
                            <td>{{$s->specimen_name}}</td>
                            <td>{{$s->specimen_owner}}</td>
                            <td>{{$s->comments}}</td>
                            <td>{{$s->common_name}}</td>
                            <td>{{$s->date_month_found}}</td>
                            <td>{{$s->date_day_found}}</td>
                            <td>{{$s->date_year_found}}</td>
                            <td>{{$s->location_found_county}}</td>
                            <td>{{$s->location_found_city}}</td>
                            <td>{{$s->state}}</td>
                            <td>{{$s->country}}</td>
                            <td>{{$s->annulus_position }}</td>
                            <td>{{$s->cap_context_flesh_texture_returned}}</td>
                            <td>{{$s->entered_by}}</td>
                            <td>{{$s->created_at}}</td>
                            <td>{{$s->updated_at}}</td>
                        </tr>
                    @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
@endsection
