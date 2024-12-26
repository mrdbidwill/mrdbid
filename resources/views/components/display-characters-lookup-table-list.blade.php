@php use App\Utils\StringUtils; @endphp
<div>
    @props([
    'characters'
])
    <!-- resources/views/components/display-characters-lookup-table-list.blade.php -->
    @php
        //dd($characters);
    @endphp

    <table class="min-w-full divide-y divide-gray-700">
        @foreach($characters as $character)
            @php
                $display_name = \App\Utils\StringUtils::convert_table_name_for_display($character['name']);

                // Assign background color based on the $loop->iteration.
                $character_bg_class = $loop->iteration % 2 == 0 ? 'bg-gray-100' : 'bg-gray-300';
            @endphp

            @if($character['look_up_y_n'] == 1)
                @php
                    $table_name_plural = StringUtils::get_table_name_special_cases($character['name']); // Adds "s" if needed

                    // Handle specific display option cases
                    if ($character['display_options'] == 6) $table_name_plural = 'colors';
                    if ($character['display_options'] == 7) $table_name_plural = 'tastes';
                    if ($character['display_options'] == 8) $table_name_plural = 'odors';
                    if ($character['display_options'] == 15) $table_name_plural = 'abundances';
                    if ($character['display_options'] == 17) $table_name_plural = 'genus';

                    $lookup_table_data = DB::table($table_name_plural)->get();
                @endphp
                @foreach($lookup_table_data as $lookup_table_row)
                    @if($table_name_plural == 'colors' || $table_name_plural == 'genus')
                        {{-- Skip: do nothing --}}
                    @else
                        <tr class="{{ $character_bg_class }}">
                            <td class="flex justify-between items-center">
                            <span>
                                {{ $table_name_plural }}: <b>{{ $lookup_table_row->name ?? 'Unknown Name' }}</b>
                            </span>
                                @if($loop->iteration % 5 === 0)
                                    <a href="#top" class="text-orange-600 font-bold">Top</a>
                                @endif
                            </td>
                        </tr>
                    @endif
                @endforeach
            @else
                <tr class="{{ $character_bg_class }}">
                    <td class="flex justify-between items-center">
                    <span>
                        <b>{{ $display_name }}</b>
                    </span>
                        @if($loop->iteration % 5 === 0)
                            <a href="#top" class="text-orange-600 font-bold">Top</a>
                        @endif
                    </td>
                </tr>
            @endif

        @endforeach
    </table>
</div>
