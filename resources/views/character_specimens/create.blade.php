@php
    use App\Models\CharacterSpecimen;
    $specimen_id = $request->specimen_id;
    //dd($specimen_id);
@endphp@extends('layouts.app')

@section('content')

    <x-specimens-nav-bar></x-specimens-nav-bar>


    <div class="bg-gray-100">    <!--  bg-gray-100 no effect?-->
        <div class="mx-auto max-w-7xl">
            <div class="bg-gray-300 py-10"> <!-- bg-gray-300 works-->
                <div class="px-4 sm:px-6 lg:px-8">
                    <div class="sm:flex sm:items-center">
                        <div class="sm:flex-auto">
                            <h1 class="text-base font-semibold leading-6 text-black">Character-Specimens</h1>
                            @if ($errors->any())
                                <div class="text-red-600 text-3xl">
                                    <ul>
                                        @foreach ($errors->all() as $error)
                                            <li>{{ $error }}</li>
                                        @endforeach
                                    </ul>
                                </div>
                            @endif
                            <p class="mt-2 text-sm text-black">Use this list to add characters to your specimen.</p>
                        </div>
                    </div>
                    <div class="mt-8 flow-root">
                        <div class="-mx-4 -my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
                            <div class="inline-block min-w-full py-2 align-middle sm:px-6 lg:px-8">


                                <table class="min-w-full divide-y divide-gray-700">
                                    <thead>
                                    <tr>
                                        <th scope="col"
                                            class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-black sm:pl-0">
                                            ID
                                        </th>
                                        <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-black">
                                            Name
                                        </th>
                                    </tr>
                                    </thead>

                                    @php  $color_character_names = array(); @endphp
                                    <tbody class="divide-y divide-gray-800">


                                    <x-display-character-by-display-option-switch :specimenId="$specimenId"/>

                                    </tbody>

                                </table>

                                @php
                                    $colors =  DB::table('colors')->get();
                                    //dd($colors);
                                @endphp
                                <table>
                                    <thead>
                                    <tr>
                                        <th colspan="10">Colors from AMS Color Chart
                                        </th>

                                    </tr>
                                    </thead>
                                    <tbody>

                                    <tr>
                                        @for ($i = 1; $i < 51; $i++)
                                            @php $array_num = $i - 1; @endphp
                                            @if($i % 10 == 1 && $i != 1)</tr>
                                    <tr>@endif
                                        <td>{{$i}}. <img
                                                src="{{url('storage/images/AMS_colors/banner_50x50/banner_'.$i.'.jpg ')}}"
                                                alt="{{$colors[$array_num]->latin_name}}"> <input type="radio"
                                                                                                  id="{{$i}}"
                                                                                                  name="{{$colors[$array_num]->latin_name }}"
                                                                                                  value="{{$i}}"> <label
                                                for="{{$i}}">{{$colors[$array_num]->latin_name}}</label>
                                        </td>
                                        @endfor

                                    </tr>
                                    </tbody>
                                </table>


                                <table class="min-w-full divide-y divide-gray-700">
                                    <thead>
                                    <tr>
                                        <th scope="col" colspan="10"
                                            class="px-3 py-3.5 text-left text-sm font-semibold text-black">Color
                                            Character Names
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody class="divide-y divide-gray-800">
                                    <tr class="divide-y divide-gray-800">
                                        @php
                                            //dd($color_character_names);
                                               $num_color_character_names = count($color_character_names);
                                               //dd($color_character_names);
                                        @endphp


                                        @for ($ct = 0; $ct <$num_color_character_names; $ct++)
                                            @php
                                                if($ct % 3 == 1 && $ct != 1)
                                                {
                                                echo '</tr><tr>';
                                                    }
                                            @endphp
                                            <td class="whitespace-nowrap px-3 py-4 text-sm text-black">
                                                {{ $ct  }}  {{$color_character_names[$ct] }}</td>

                                        @endfor
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection


