@extends('layouts.app')

@section('content')

    <x-specimens-nav-bar></x-specimens-nav-bar>

    {{-- Load the Livewire Form --}}
    <livewire:specimen-form/>

@endsection
