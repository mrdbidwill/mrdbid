@extends('layouts.app')

@section('content')

    <div class="container">
        <x-admin-dashboard-nav-bar></x-admin-dashboard-nav-bar>
        <p class="mt-2 text-xl text-black">(resources/views/admin/dashboard.blade.php)</p>
        <div class="flex justify-center items-center h-full">
            <h1 class="text-green-500 text-4xl">Admin Dashboard</h1>
        </div>

        <p class="mt-2 text-xl text-black">Use your admin power for good.</p>

        <p class="mt-2 text-xl text-black"><strong>Please be absolutely certain that the changes you are making will be in the table,
                column, row, etc. <u>that you intend to change</u>.</strong></p>

        <p class="mt-2 text-xl text-black">Also understand that specimens may already have these characters assigned to
            them as they are written.</p>

        <p class="mt-2 text-xl text-black">Do not make any significant changes in characters that would change the
            meaning to specimens that already have <u>this current character</u> <b>accurately assigned</b>.</p>

        <p class="mt-2 text-xl text-black">Updated clarifications on descriptions, comments, and sources are examples of
            beneficial edits.</p>

        <p class="mt-2 text-xl text-black">Anything beyond that may call for the creation of a new character and
            possibly a lookup table to support it. Which does not mean it should not be done. It just calls for a
            different process than is offered on this page. Email MRDBID to suggest such an addition, if you believe one
            is needed.</p>

        <p class="mt-2 text-xl text-black">The Admin options available are all in the menu buttons above.</p>

    </div>
@endsection


