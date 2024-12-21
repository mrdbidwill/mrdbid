@extends('layouts.app')

@section('content')

    <x-specimens-nav-bar/>


    {{-- Show file address if in development environment --}}
    @if (config('app.env') === 'local')
        <p class="text-gray-500 mt-4">File Address: /resources/views/character_specimens/index.blade.php</p>
    @endif

    <x-notification message="{{ Session::get('message') }}"/>


    <div class="bg-gray-100">    <!--  bg-gray-100 no effect?-->
        <div class="mx-auto max-w-7xl">
            <div class="bg-gray-300 py-10"> <!-- bg-gray-300 works-->
                <div class="px-4 sm:px-6 lg:px-8">
                    <div class="sm:flex sm:items-center">
                        <div class="sm:flex-auto">
                            <h1 class="text-base font-semibold leading-6 text-black">Character-Specimens</h1>

                            <p class="mt-2 text-xl text-black">When you create a specimen, you enter the <b>required</b>
                                basic characters that you should have for every specimen. After the initial entry, those
                                are done for the time being. As always, the basic characters can be edited, if needed.
                            </p>

                            <p class="mt-2 text-xl text-black">The characters for any specimen are <b>all
                                    optional</b>. While it is obvious that a specimen with no characters is not very
                                useful, which ones you enter <u>and when</u> are up to you.</p>

                            <p class="mt-2 text-xl text-black">One of the goals or maybe a by product of the MRDBID
                                process will be the creation of a standard set of characters. If you do not see the
                                character you need, email a well defined explanation, including the source, and it can
                                be added. </p>

                            <p class="mt-2 text-xl text-black">MRDBID is not trying to be any type of "gatekeeper" of
                                character knowledge. Keep in mind that the database is set up to allow for searching
                                comparisons of specimens. "Slightly hairy" and "somewhat hairy" and "not very hairy"
                                seem to say the same thing, but are 3 different rows in a database to attempt to match
                                up.</p>

                            <p class="mt-2 text-xl text-black">I added a cap_color_2 and cap_color_3 because I can see
                                that may be helpful for that <u>one</u> main "cap color" character. It will get unwieldy
                                quickly if I did that to many characters.</p>

                            <p class="mt-2 text-xl text-black">Then again, "unwieldy" is relative also. I do not have a limit on the number of helpful
                                characters that knowledgeable people want to add as useful identification tools.</p>

                            <p class="mt-2 text-xl text-black">Below is a list of characters. Due to the (ongoing)
                                design of this website and the desire to streamline the process of managing specimens,
                                additions to each specimen are now done when you are looking at the specimen data. Below
                                is just informational. However, the list below should remain up to date.</p>

                            <p class="mt-2 text-xl text-black">Also note how many characters have a prefilled list of
                                possible options. These options are stored in what I call "lookup tables". If you
                                propose a new character and it has these type options particular to that table, please
                                include them with any correspondence proposing new character(s). A csv format would be
                                great. If you don't know what that is, send what you got and I will try to work with
                                it.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

        <div class="mt-8 flow-root">
            <div class="-mx-4 -my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
                <div class="inline-block min-w-full py-2 align-middle sm:px-6 lg:px-8">
                    <x-display-characters-lookuptable-list :characters="$characters"/>
                </div>
            </div>
        </div>

@endsection


