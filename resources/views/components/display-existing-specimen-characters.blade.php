@php
    use Illuminate\Support\Facades\DB;
    use App\Utils\StringUtils;
    use App\Models\Lookup\Character;
    use App\Models\CharacterSpecimen;
    use Illuminate\Http\Request;

       $specimen_id = request()->input('specimen_id');

        // Store the default connection
        $defaultConnection = DB::getDefaultConnection();
               // Instantiate the model
        $characterSpecimen = new CharacterSpecimen();
        $set_characters = $characterSpecimen->getSetCharacters($specimen_id);

        //dd($set_characters);

        /*
         * At this point this is all I have - but need final
         * sorting by characters table name alphabetically
         "id" => 12
        "character_id" => 99
        "specimen_id" => 2
        "character_value" => "56581"
        "entered_by" => 1
        "created_at" => "2024-10-29 10:53:42"
        "updated_at" => "2024-10-29 10:53:42"
        */

        // Fetch all characters whose IDs are present in $set_characters
        $character_ids = $set_characters->pluck('character_id')->all();
        $characters = Character::whereIn('id', $character_ids)->get()->keyBy('id');

        // Sort the set_characters by the name of characters
        $set_characters = $set_characters->sortBy(function($set_character) use ($characters) {
        return $characters[$set_character->character_id]->name ?? '';
        })->values();
@endphp
<table class="table-auto w-full">
    @foreach ($set_characters as $set_character)
        @php
            $character_id = $set_character->character_id;
            $character = $characters[$character_id] ?? null;
            $display_option = $character ? $character->display_options : '';
            $processed_table_name = StringUtils::get_table_name_special_cases($character->name);
            $display_name = StringUtils::convert_table_name_for_display($character->name);
        @endphp

        <tr class="{{ $loop->odd ? 'bg-amber-100' : 'bg-green-100' }}">
            <td class="border border-collapse border-gray-400 p-2">
                @switch($display_option)
                    @case(1)
                        <!-- ID - Do not display  -->
                        @break
                    @case(2)
                        <!--  text box number mm is measure  NO Lookup table -->
                        {{ $display_name }}: {{$set_character->character_value}} mm
                        @break
                    @case(3)
                        <!--  text box number um is measure   NO Lookup table -->
                        {{ $display_name }}: {{$set_character->character_value}} &#181; (micron)
                        @break
                    @case(4)
                        <!--  text box string   NO Lookup table -->
                        {{ $display_name }}: {{$set_character->character_value}}
                        @break
                    @case(5)
                        <!--  text box number general format for temperatures ph  etc    NO Lookup table -->
                        {{ $display_name }}: {{$set_character->character_value}}
                        @break
                    @case(6)
                        <!-- colors -->
                        @php
                            $data = DB::table('colors')->where('id', $set_character->character_value)->first();
                            $imagePath = asset('storage/images/AMS_colors/banner_50x50/banner_' . $set_character->character_value . '.jpg');
                        @endphp
                        {{ $display_name }}:
                        <small>Latin Name:</small> <b>{{ $data->latin_name }}</b>
                        <small>Common Name:</small> <b>{{ $data->common_name }}</b>
                        <small>Closest Websafe Color:</small> <b>{{ $data->closest_websafe_color }}</b>
                        <small>Source: Alabama Mushroom Society</small>
                        <img src="{{$imagePath}}" alt="{{ $data->latin_name }}" width="50" height="50"
                             class="inline-block mt-2">
                        @break
                    @case(7)
                        <!--  taste ALL taste characters use the tastes table-->
                        @php
                            $table_name = 'tastes';
                            $data = DB::table($table_name)->where('id', $set_character->character_value)->first();
                        @endphp
                        {{ $display_name }}:
                        {{$data->name}} {{$data->description}} {{$data->comments }} {{$data->source}}
                        @break
                    @case(8)
                        <!-- odor ALL odor characters use the odors table-->
                        @php
                            $table_name = 'odors';
                            $data = DB::table($table_name)->where('id', $set_character->character_value)->first();
                        @endphp
                        {{ $display_name }}:
                        {{$data->name}} {{$data->description}} {{$data->comments }} {{$data->source}}
                        @break
                    @case(9)
                        <!--  radio USE LOOKUP TABLE -->
                        @php
                            $data = DB::table($processed_table_name)->where('id', $set_character->character_value)->first();
                            $data_source = DB::table('data_sources')->where('id', $data->source)->first();
                        @endphp
                        {{ $display_name }}:
                        {{$data->name}} {{$data->description}} {{$data->comments }}
                        <span class="text-xs font-bold">Source: {{$data_source->title}}</span>
                        @break
                    @case(10)
                        <!--  dropdown -->
                        @php
                            $table_name = $character->name;
                            $data = DB::table($table_name)->where('id', $set_character->character_value)->first();
                        @endphp
                        {{ $display_name }}:
                        {{$data->name}} {{$data->description}} {{$data->comments }} {{$data->source}}
                        @break
                    @case(11)
                        <!--  state -->
                        @php
                            $table_name = $character->name;
                            $data = DB::table($table_name)->where('id', $set_character->character_value)->first();
                        @endphp
                        {{ $display_name }}:
                        {{$data->name}} {{$data->description}} {{$data->comments }} {{$data->source}}
                        @break
                    @case(12)
                        <!-- country -->
                        @php
                            $table_name = $character->name;
                            $data = DB::table($table_name)->where('id', $set_character->character_value)->first();
                        @endphp
                        {{ $display_name }}:
                        {{$data->name}} {{$data->description}} {{$data->comments }} {{$data->source}}
                        @break
                    @case(13)
                        <!--  texture -->
                        @php
                            $table_name = 'textures';
                            $data = DB::table($table_name)->where('id', $set_character->character_value)->first();
                        @endphp
                        {{ $display_name }}:
                        {{$data->name}} {{$data->description}} {{$data->comments }} {{$data->source}}
                        @break
                    @case(14)
                        <!-- yes_no  -->
                        @php
                            $table_name = $character->name;
                            $data = DB::table($table_name)->where('id', $set_character->character_value)->first();
                        @endphp
                        {{ $display_name }}:
                        {{$data->name}} {{$data->description}} {{$data->comments }} {{$data->source}}
                        @break
                    @case(15)
                        <!--  abundance -->
                        @php
                            $table_name = 'abundances';
                            $data = DB::table($table_name)->where('id', $set_character->character_value)->first();
                        @endphp
                        {{ $display_name }}:
                        {{$data->name}} {{$data->description}} {{$data->comments }} {{$data->source}}
                        @break
                    @case(16)
                        <!--  text box number grams measurement -->
                        @php
                            $table_name = $character->name;
                            $data = DB::table($table_name)->where('id', $set_character->character_value)->first();
                        @endphp
                        {{ $display_name }}:
                        {{$data->name}} {{$data->description}} {{$data->comments }} {{$data->source}}
                        @break
                    @case(17)
                        <!--  genus and species autocomplete -->
                        @php
                            $result = DB::connection('MBList.php')->table('list')
                                ->where('id', $set_character->character_value)
                                ->select( 'Taxon_name', 'Authors__abbreviated_', 'Year_of_effective_publication', 'Name_status')
                                ->first();
                        @endphp
                        {{ $display_name }}:
                        {{ $result->Taxon_name }} {{ $result->Authors__abbreviated_ }} {{ $result->Year_of_effective_publication }} {{ $result->Name_status }}
                        @break
                    @default
                        <!--  default -->
                        <p><b>{{ $processed_table_name }} Default case</b></p>
                @endswitch

                @if($loop->iteration % 5 === 0)
                    <div class="text-right text-orange-600 font-bold"><a href="#top">Top</a></div>
                @endif
            </td>
        </tr>
    @endforeach
</table>
