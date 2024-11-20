@props(['active' => false])@php
    $isAdmin = request()->routeIs('admin_dashboard');
@endphp

<nav>

<!-- resources/views/admin/dashboard.blade.php -->

    <title>Admin Dashboard</title>

<h1>Admin Dashboard</h1>
<ul>
    <!-- Link to Admin Specimens Index -->
    <li><a href="{{ route('admin.specimens.index') }}">Admin: View All Specimens</a></li>

    <!-- Link to Admin Create Specimen -->
    <li><a href="{{ route('admin.specimens.create') }}">Admin: Create New Specimen</a></li>

    <!-- Link to Admin Specimen Show Example -->
    <li><a href="{{ route('admin.specimens.show', ['specimen' => 1]) }}">Admin: View Specimen #1</a></li>

    <!-- Link to Admin Specimen Edit Example -->
    <li><a href="{{ route('admin.specimens.edit', ['specimen' => 1]) }}">Admin: Edit Specimen #1</a></li>

    <!-- Link to Admin Characters Index -->
    <li><a href="{{ route('admin.characters.index') }}">Admin: View All Characters</a></li>

    <!-- Link to Admin Create Character -->
    <li><a href="{{ route('admin.characters.create') }}">Admin: Create New Character</a></li>

    <!-- Link to Admin Character Show Example -->
    <li><a href="{{ route('admin.characters.show', ['character' => 1]) }}">Admin: View Character #1</a></li>

    <!-- Link to Admin Character Edit Example -->
    <li><a href="{{ route('admin.characters.edit', ['character' => 1]) }}">Admin: Edit Character #1</a></li>

    <li><a href="{{ route('admin.mblist.upload.form') }}">Manage MBList</a></li>
</ul>
</nav>
