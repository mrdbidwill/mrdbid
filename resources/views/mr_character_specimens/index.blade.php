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

                            <p class="text-orange-600">If want to add characters to a specimen,  click on "Back To Specimens" Button above, then click on the specimen you want to manage and look for the "Manage characters for this specimen" button link.</p>


                            <p class="mt-2 text-xl text-black">When you create a specimen, you enter the <b>required</b>
                                <u>basic</u> characters that you should have for every specimen. Facts like time, place and a general impression. After the initial entry, those
                                are done for the time being. As always, the basic characters can be edited, if needed. This basic information is <u>required</u> to create a specimen.
                            </p>

                            <p class="mt-2 text-xl text-black">The following characters for any specimen are <b>all
                                    optional</b>. While it is obvious that a specimen with no characters is not very
                                useful, which ones you enter <u>and when</u> are up to you.</p>

                            <p class="mt-2 text-xl text-black">Also, note that while no image is required, the premise of this website is that the original form of the specimen can be preserved in picture in order to be used for present selection and future support of your selection. Also for correction or change if future review requires it.</p>

                            <p class="mt-2 text-xl text-black">One of the goals or maybe a by product of the MRDBID
                                process will be the creation of a <b>standard set of characters.</b> If you do not see the
                                character you need, email a well defined explanation, including the source, and it can
                                be added. </p>

                            <p class="mt-2 text-xl text-black">MRDBID is not trying to be any type of "gatekeeper" of
                                character knowledge. Keep in mind that the database is set up to allow for searching
                                comparisons of specimens. "Slightly hairy" and "somewhat hairy" and "not very hairy"
                                seem to say something similar, but are 3 different rows in a database to attempt to match
                                up.</p>

                            <p class="mt-2 text-xl text-black">I added a cap_color_2 and cap_color_3 because I can see
                                that may be helpful for that <u>one</u> main "cap color" character. It will get unwieldy
                                quickly if I did that to many characters. Any suggestions in this area are appreciated.</p>

                            <p class="mt-2 text-xl text-black">Then again, "unwieldy" is relative also. I do not have a limit on the number of helpful
                                characters that knowledgeable people want to add as useful identification tools. This is what computers are good at.</p>

                            <p class="mt-2 text-xl text-black">Below is a list of characters. Many characters have a prefilled list of possible options. These options are stored in what I call "lookup tables". For example, the character "specimen_age" currently has five options, including "Button", "Young", "Mature", "Past Prime", and "Not Entered". The number beside each option is the source, where I originally got the information.</p>

                            <p class="mt-2 text-xl text-black">If you propose a new character, please include a list of  with any correspondence proposing new character(s). A csv format would be great, but send what you got and I will try to work with it.</p>

                            <p class="mt-2 text-xl text-black">Measurement characters (height, width, weight, etc.) do not need a lookup table. Units are mm for macro and nm for micro. Since the measure is for this one specimen, it will not have a range of high to low. This may seem at odds with some of the "key" type identification guides, but they are using a composite of more than one specimen usually.</p>

                            <p class="mt-2 text-xl text-black">There is a lot of work to be done with descriptions, comments, and proper source attribution. I use what I find myself, unless there is a clear formal source from expert.</p>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@php
    // - The `toArray()` method converts the collection and all included models and relations into arrays. This will show the database fields, relations, and everything that is accessible.
   //  dd($mr_characters->toArray());  // mr_characters contains the lookup table names - not data
@endphp
        <div class="mt-8 flow-root">
            <div class="-mx-4 -my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
                <div class="inline-block min-w-full py-2 align-middle sm:px-6 lg:px-8">
                    <x-display-characters-lookup-table-list :mr_characters="$mr_characters"/>
                </div>
            </div>
        </div>

@endsection


