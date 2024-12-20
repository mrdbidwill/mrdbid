@extends('layouts.app')

@section('content')

    <x-specimens-nav-bar/>

    <p>resources/views/specimen_groups/show.blade.php</p>

    <p>
        {{ $specimen_group->name }}  {{ $specimen_group->description }} </p>

@endsection


