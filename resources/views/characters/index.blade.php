@php use Illuminate\Support\Facades\DB;@endphp
<x-layout>
    <x-slot:heading>
        Character Listings
    </x-slot:heading>

    <div class="space-y-4">
        @foreach ($characters as $character)

            @php
                $display = DB::table('display_options')
                ->where('id', '=', $character->display_options)
                ->first();
                // dd($display);

                if($character->look_up_y_n == 1)
                {
                    $look_up = 'Yes - Lookup';
                }
                else
                {
                    $look_up = 'No - NOT Lookup';
                }
                // dd($look_up);

                  $part = DB::table('parts')
                ->where('id', '=', $character->part)
                ->first();
                // dd($part);

                $source = DB::table('data_sources')
                ->where('id', '=', $character->source)
                ->first();
                 // dd($source);

                $by = DB::table('users')
                ->where('id', '=', $character->entered_by)
                ->first();
                 // dd($by);


            @endphp

            <a href="/characters/{{ $character->id }}" class=" px-4 py-6 border border-gray-200 rounded-lg">
                <div class="font-bold text-blue-500 text-sm">{{ $character->name }}</div>
            </a> {{ $display->name }}
            - {{ $look_up }} -
            {{ $part->name }}
            - {{ $source->title }}
            - {{ $by->name }}
        @endforeach
        <div>
            {{ $characters->links() }}
        </div>
    </div>
</x-layout>
