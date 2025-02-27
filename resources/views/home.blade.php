@extends('layouts.app')
@section('content')
    <main class="mt-6 space-y-4">

        @if (config('app.env') === 'local')
            <p class="text-gray-500 mt-4">File Address: /resources/views/home.blade.php</p>
        @endif

        <h1 class="text-4xl text-black dark:text-white">Welcome to MRDBID</h1>

        <p class="mt-2 text-xl text-black">In the beginning, there was only a plan to eliminate the paper clutter. Where
            am I on identifying this mushroom? Where are my notes? Why can't I recall the mushrooms I have observed in
            the past? Dare I say easily? And, so this project began.</p>

        <p class="mt-2 text-xl text-black">This website is a tool for storing and organizing <u>data</u> for mushrooms
            that you observed and/or collected. Hopefully, it will provide a process that simplifies storing and
            retrieving <u>your</u> mushroom specimen <b>data</b> in order to compare it to other mushrooms that you and
            others have observed. Once your initial information is stored in the database, you can edit it as needed and
            add more character details as you discover them.</p>

        <p class="mt-2 text-xl text-black">The fact you observed a mushroom means you have some visual, time and
            location data. That is enough to start. You name this specimen "something" that is meaningful to <b>you,</b>
            like "me_1" or "me_2", etc. with comment "brown mushroom - backyard". Or include the date, such as
            me_11_24_2024_ganoderma or do whatever works for you.</p>

        <p class="mt-2 text-xl text-black">There you go. A beginning. Any clear photo with <b class="text-orange-700">measurements</b>
            is a plus. <u>Use coins if a ruler is not handy</u>.</p>

        <div class="bg-gray-100 p-4">
            <h3 class="text-xl text-orange-700">Measurements:</h3>

            <p class="text-sm">Richard W. Kerrigan's <i><b>AGARICUS</b> of NORTH AMERICA</i>, middle of page 22, "To
                estimate the size of specimens in the field, or to preserve scale information in photographs, it is
                useful to know the sizes of ordinary coins issued by the relevant nation. In the United States:"</p>

            <div class="flex items-center space-x-4 space-y-2">
                <table class="table-auto size-full">
                    <tr class="border-t-2 border-b-2 border-black">
                        <th class="text-center">Coin</th>
                        <th class="text-center">Value</th>
                        <th class="text-center">Diameter</th>
                    </tr>
                    <tr>
                        <td class="text-center">Penny</td>
                        <td class="text-center">$0.01</td>
                        <td class="text-center">19.1 mm</td>
                    </tr>
                    <tr>
                        <td class="text-center">Nickel</td>
                        <td class="text-center">$0.05</td>
                        <td class="text-center">21.2 mm</td>
                    </tr>
                    <tr>
                        <td class="text-center">Dime</td>
                        <td class="text-center">$0.10</td>
                        <td class="text-center">17.9 mm</td>
                    </tr>
                    <tr class="border-b-2 border-black">
                        <td class="text-center">Quarter</td>
                        <td class="text-center">$0.25</td>
                        <td class="text-center">24.3 mm</td>
                    </tr>
                </table>
            </div>
        </div>
        <p class="mt-2 text-xl text-black">If you did not retrieve a specimen, when you get to the option of selecting
            where a specimen is currently located (preserved and stored), you can select "Observation Only - No specimen
            collected". </p>

        <p class="mt-2 text-xl text-black">If nothing more, now you know when and where you saw "it." This time next
            year, you may see it again, same place?</p>

        <p class="mt-2 text-xl text-black">This is not a "key" identification process, like <a
                href="https://www.mushroomexpert.com">https://www.mushroomexpert.com</a>. You can use MushroomExpert.Com
            and/or other identification experts to match up <b>your</b> specimen <u>data</u> that is stored here. In the
            future, perhaps enough positive identifications will result in a match within the mrdbid.com
            <b>database.</b></p>
        <p class="mt-2 text-xl text-black">Again, a specimen need not be collected to be entered here. These entries
            will be recorded as an "observation", not a "specimen".</p>


        <p class="mt-2 text-xl text-black">PS The "Trees" link began from photographs of the informational signs at
            Blakely State Park, Baldwin County, Alabama. It is the beginning of a tool for identifying the trees
            associated with mushrooms. Note: "Trees" was in, then out, but is in the long term plan.</p>

        <p class="mt-2 text-xl text-black"><b>About Images:</b> I am not a photographer, an artist, or a scientist. My
            goal in observing or collecting specimens is to provide documentation of its facts that can be preserved for
            any future study. Good photographs with <b class="text-orange-700">measurements</b> make that possible.</p>

        <p class="mt-2 text-xl text-black">This website's upload process will reduce some pictures in size, if needed.
            Otherwise, any editing, cropping, etc. should be done before uploading.</p>

        <p class="mt-2 text-xl text-black">As part of the specimen collection process, my intention is to take the best
            picture I can <u>from the beginning</u> following a plan like outlined in the "Citizen Science How To Take
            Scientifically Useful Observations" link below.</p>

        <p class="mt-2 text-xl text-black">The most useful pictures will clearly document mushroom characters and <b
                class="text-orange-700">measurements</b>, along with surroundings (trees, etc.). If this is successfully
            done, anyone looking at the collection of pictures can confirm the data at any future date.</p>

        <p class="mt-2 text-xl text-black">This website is <b>not</b> a "field guide". You need to collect pictures and
            information where mushrooms are found, then transfer the data one time here for your records.</p>

        <h2>Where to begin?</h2>

        <p class="mt-2 text-xl text-black">If you do not know where to start, click on this link: <a
                href="https://alabamamushroomsociety.org/Citizen-Science">Citizen Science How To Take Scientifically
                Useful Observations</a></p>

        <!-- sez it can not resolve - but it works -->
        <p class="mt-4 text-black dark:text-white text-lg"><img
                src="{{ asset( 'storage/images/AMS_Field_Data_Sheet_400x298.png') }}" alt="AMS Field Data Sheet"></p>

        <!-- /storage/app/public/specimen_images/AMS_Field_Data_Sheet_400x298.png does not work -->

        <p class="mt-2 text-xl text-black">After completing the form <u>in the field</u>, take a picture of it with your
            specimen. Notice the <b class="text-orange-700">measurements</b> on the form. Then, once home and when you
            get around to it, add the data and the pictures you took of the specimen, including this form, to your
            specimen list. You then have it to refer to online wherever you are, and update as needed while you identify
            your specimen.</p>

        <p class="mt-2 text-xl text-black">You will get better with practice. Yes, a microscope helps and is not that
            difficult to learn to use, along with various chemicals to test reactions.</p>

        <p class="mt-2 text-xl text-black">Live and learn. <b class="text-orange-700">And measure.</b></p>
    </main>

    <footer class="py-16 text-center text-sm text-black dark:text-white/70">
        <p class="py-2 text-sm text-orange-600 dark:text-orange-500"><b>Privacy Notice: MRDBID.com has not added any
                tracking other than basic analytics provided by our hosting service. There are no Google analytics,
                social media associations, or marketing tracking addons.</b></p>
    </footer>
@endsection

