@php use App\Utils\StringUtils; @endphp
<div>
    @props([
    'characters'
])
    <!-- resources/views/components/display-characters-lookuptable-list.blade.php -->
    @php
        //dd($characters);
    @endphp

    <table class="min-w-full divide-y divide-gray-700">
        @foreach($characters as $character)
            @php
                $display_name = \App\Utils\StringUtils::convert_table_name_for_display($character['name']);
             //dd($characters);

             // Assign background color based on the $loop->index or $loop->iteration.
             $character_bg_class = $loop->iteration % 2 == 0 ? 'bg-gray-100' : 'bg-gray-300'; // Alternates between colors
            @endphp

            @if($character['look_up_y_n'] == 1)
                @php
                $table_name_plural = StringUtils::get_table_name_special_cases($character['name']);  // adds s to table name as needed

                if ($character['display_options'] == 6 )
                {
                    $table_name_plural = 'colors';
                }

                if ($character['display_options'] == 7 )
                {
                    $table_name_plural = 'tastes';
                }

                if ($character['display_options'] == 8 )
                {
                    $table_name_plural = 'odors';
                }

                if ($character['display_options'] == 15 )
                {
                    $table_name_plural = 'abundances';
                }

                if ($character['display_options'] == 17 )
                {
                    $table_name_plural = 'genus';
                }

                $lookup_table_data = DB::table( $table_name_plural )->get();
               // dd($lookup_table_data);
                @endphp
                @foreach($lookup_table_data as $lookup_table_row)
                    @if( $table_name_plural == 'colors' ||  $table_name_plural == 'genus' )
                           {{-- skip do nothing--}}
                    @else
                        <tr class="{{ $character_bg_class }}">
                        <td>
                            {{ $table_name_plural }}:
                            @php  //dd($lookup_table_row); @endphp
                            <b>{{ $lookup_table_row->name ?? 'Unknown Name' }}</b>
                        </td>
                    </tr>
                    @endif
                @endforeach
            @else
                <tr class="{{ $character_bg_class }}">
                    <td>
                        <b>{{ $display_name }} Not lookup</b>
                    </td>
                </tr>
            @endif
        @endforeach
    </table>
</div>
