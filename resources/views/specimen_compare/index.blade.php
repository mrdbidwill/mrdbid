@php
    use App\Models\ImageSpecimen;  use App\Utils\ImageUtils;use Illuminate\Support\Facades\DB ;
    //dd($specimens);
@endphp
<x-layout>

    <p>This is views/specimen_compare/index.blade.php.</p>

    @if (Session::has('message'))
        <div class="text-3xl text-red-700">{{ Session::get('message') }}</div>
    @endif
    
</x-layout>
