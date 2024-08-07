<x-layout>
    <x-slot:heading>
        Character Listings
    </x-slot:heading>


    <div class="bg-gray-100">
        <div class="mx-auto max-w-7xl">
            <div class="bg-gray-100 py-10">
                <div class="px-4 sm:px-6 lg:px-8">
                    <div class="sm:flex sm:items-center">
                        <div class="sm:flex-auto">
                            <h1 class="text-base font-semibold leading-6 text-black">Characters
                                (characters/index.blade.php)</h1>
                            <p class="mt-2 text-sm text-black">Use this list to add characters to your specimen.</p>
                        </div>
                    </div>
                    <div class="mt-8 flow-root">
                        <div class="-mx-4 -my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
                            <div class="inline-block min-w-full py-2 align-middle sm:px-6 lg:px-8">

                                <!-- start form here -->
                                <form method="POST" action="/characters.update/">
                                    @csrf

                                    <table class="min-w-full divide-y divide-gray-700">
                                        <thead>
                                        <tr>
                                            <th scope="col"
                                                class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-black sm:pl-0">
                                                ID
                                            </th>
                                            <th scope="col"
                                                class="px-3 py-3.5 text-left text-sm font-semibold text-black">
                                                Name
                                            </th>
                                        </tr>
                                        </thead>


                                        <tbody class="divide-y divide-gray-800">


                                        @foreach ($characters as $character)
                                            <tr>
                                                <td>
                                                    @php
                                                        if( $character['look_up_y_n'] == 1)
                                                        {
                                                            if( ( $character['name'] ==  'cap_surface_dryness')  || ( $character['name'] ==  'genus' ) || ( $character['name'] ==  'species' ))
                                                            {
                                                               $data = DB::table( $character['name'] )->get();
                                                            }
                                                            else
                                                            {
                                                                // do switch here for colors taste odor etc
                                                                //$data = DB::table( $character['name'].'s' )->get();
                                                            }

                                                          //dd($data);

                                                        }
                                                    @endphp

                                                    @switch($character['display_options'])
                                                        @case(1)
                                                            <!--  Do not display  -->
                                                            <p>{{$character['name']}}: Do not display</p>
                                                            @break

                                                        @case(2)
                                                        @case(3)
                                                        @case(4)
                                                        @case(5)
                                                            <!--  text box string  -->
                                                            <label for="{{$character['id']}}">{{$character['name']}}
                                                                : </label>

                                                            <input id="{{ $character['id'] }}"
                                                                   type="text"
                                                                   value="{{ old($character['name']) }}"
                                                                   class="@error('{{ $character->id }}') is-invalid @enderror">


                                                            @error('$character->name')
                                                            <div class="alert alert-danger">{{ $message }}</div>
                                                            @enderror

                                                            @break

                                                        @case(6)
                                                            <!--  color -->
                                                            <p>{{$character['name']}}: color</p>
                                                            @php
                                                                $data = DB::table( 'colors' )->get();
                                                            @endphp

                                                            @break

                                                        @case(7)
                                                            <!--  taste -->
                                                            <p>{{$character['name']}}: taste</p>
                                                            @php
                                                                $data = DB::table( 'tastes' )->get();
                                                            @endphp
                                                            @break

                                                        @case(8)
                                                            <!-- odor -->
                                                            <p>{{$character['name']}}: odor</p>
                                                            @php
                                                                $data = DB::table( 'odors' )->get();
                                                            @endphp
                                                            @break

                                                        @case(9)
                                                            <!--  radio -->
                                                            <p>{{$character['name']}}: radio</p>
                                                            @break

                                                        @case(10)
                                                            <!--  dropdown -->
                                                            <p>{{$character['name']}}: dropdown</p>
                                                            @break

                                                        @case(11)
                                                            <!--  state -->
                                                            <p>{{$character['name']}}: state</p>
                                                            @break

                                                        @case(12)
                                                            <!-- country -->
                                                            <p>{{$character['name']}}: country</p>
                                                            @break

                                                        @case(13)
                                                            <!--  texture -->
                                                            <p>{{$character['name']}}: texture</p>
                                                            @break
                                                        @default
                                                            <!--       Default case... -->
                                                            <p>{{$character['name']}}: Default case</p>
                                                    @endswitch


                                                    <!--
                                                <td class="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-medium text-black sm:pl-0">{{ $character['id'] }}</td>
                                                <td class="whitespace-nowrap px-3 py-4 text-sm text-black">{{ $character['name'] }}</td>
                                                -->
                                                </td>
                                            </tr>
                                        @endforeach


                                        </tbody>

                                    </table>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</x-layout>
