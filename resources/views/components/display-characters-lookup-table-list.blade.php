@php
    use App\Utils\StringUtils;
    static $global_counter = 0;
@endphp
<div>
    @props([
    'mr_characters'
])
    <!-- resources/views/components/display-mr_characters-lookup-table-list.blade.php -->
    @php
        //dd($mr_characters);
     //echo "<p>Why no print?</p>";
    @endphp

    <table class="min-w-full divide-y divide-gray-700">
        @foreach($mr_characters as $mr_character)
            @php
                $display_name = StringUtils::convert_table_name_for_display($mr_character['name']);

                // Assign background color based on the $loop->iteration.
                $character_bg_class = $loop->iteration % 2 == 0 ? 'bg-gray-100' : 'bg-gray-300';
            @endphp

            @if($mr_character['look_up_y_n'] == 1)
                @php
                    $table_name_plural = StringUtils::get_table_name_special_cases($mr_character['name']); // Adds "s" if needed

                    // Handle specific display option cases
                    if ($mr_character['display_options'] == 6)  $table_name_plural = 'colors';
                    if ($mr_character['display_options'] == 7)  $table_name_plural = 'tastes';
                    if ($mr_character['display_options'] == 8)  $table_name_plural = 'odors';
                    if ($mr_character['display_options'] == 15) $table_name_plural = 'abundances';


                    $lookup_table_data = DB::table($table_name_plural)->get();
                @endphp
                @foreach($lookup_table_data as $lookup_table_row)
                    @if($table_name_plural == 'colors')
                        {{-- Skip: do nothing --}}
                    @else
                        <tr class="{{ $character_bg_class }}">
                            <td class="flex justify-between items-center">
                            <span>
                                @php
                                    //dd($lookup_table_data);
                                @endphp
                                {{ $table_name_plural }}: <b>{{ $lookup_table_row->name ?? 'Unknown Name' }}</b> {{  $lookup_table_row->description  }}  {{  $lookup_table_row->comments }}  {{  $lookup_table_row->source }}
                                @php $global_counter++; @endphp
                            </span>
                                @if($global_counter % 20 === 0)
                                    <x-site-nav-bar-one-line-no-logo/>  <a href="#top"
                                                                           class="text-orange-600 font-bold">Top</a>
                                @endif
                            </td>
                        </tr>
                    @endif
                @endforeach
            @else
                <tr class="{{ $character_bg_class }}">
                    <td class="flex justify-between items-center">
                    <span>
                        <b>{{ $display_name }}</b> {{  $mr_character['description'] }}  {{  $mr_character['comments'] }}  ( {{  $mr_character['source'] }} is source of this character name)
                        @php $global_counter++; @endphp
                    </span>
                        @if($global_counter % 20 === 0)
                            <x-site-nav-bar-one-line-no-logo/>  <a href="#top" class="text-orange-600 font-bold">Top</a>
                        @endif
                    </td>
                </tr>
            @endif
        @endforeach

    </table>
</div>
