<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>MRDBID Home Page</title>


    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.bunny.net">
    <link href="https://fonts.bunny.net/css?family=figtree:400,600&display=swap" rel="stylesheet"/>

    <!-- Styles -->
    @vite(['resources/css/app.css', 'resources/js/app.js'])
    <style>

    </style>
</head>
<body class="font-sans antialiased dark:bg-black dark:text-white/50">
<div class="bg-gray-50 text-black dark:bg-black dark:text-white/50">

    <div
        class="relative min-h-screen flex flex-col items-center justify-center selection:bg-[#FF2D20] selection:text-white">
        <div class="relative w-full max-w-2xl px-6 py-8 lg:max-w-7xl">
            <a href="{{ url('/') }}">
                <x-application-logo/>
            </a>
            <!--  </div>  move this div down to  put logo same level as links -->
            <header class="-mx-3 flex flex-1 justify-end">

                <nav class="-mx-3 flex flex-initial">

                    <a href="{{ route('about') }}"
                       class="rounded-md px-3 py-2 text-black ring-1 ring-transparent transition hover:text-blue-700/70 focus:outline-none focus-visible:ring-[#FF2D20] dark:text-white dark:hover:text-white/80 dark:focus-visible:ring-blue-500">About</a>

                    <a href="{{ route('contact') }}"
                       class="rounded-md px-3 py-2 text-black ring-1 ring-transparent transition hover:text-blue-700/70 focus:outline-none focus-visible:ring-[#FF2D20] dark:text-white dark:hover:text-white/80 dark:focus-visible:ring-blue-500">Contact</a>

                    <a href="{{ route('books.index') }}"
                       class="rounded-md px-3 py-2 text-black ring-1 ring-transparent transition hover:text-blue-700/70 focus:outline-none focus-visible:ring-[#FF2D20] dark:text-white dark:hover:text-white/80 dark:focus-visible:ring-blue-500">Books</a>


                    @auth
                        <a href="{{ url('/specimens') }}"
                           class="rounded-md px-3 py-2 text-black ring-1 ring-transparent transition hover:text-blue-700/70 focus:outline-none focus-visible:ring-[#FF2D20] dark:text-white dark:hover:text-white/80 dark:focus-visible:ring-blue-500">Specimens</a>

                        <x-nav-link href="{{ route('profile.edit') }}"
                                    :active="request()->is('profile.edit')">{{auth()->user()->name}}
                        </x-nav-link>

                        <form method="POST" action="{{ route('logout') }}">
                            @csrf
                            <x-nav-link href="{{ route('logout') }}"
                                        onclick="event.preventDefault();  this.closest('form').submit();">
                                {{ __('Log Out') }}
                            </x-nav-link>
                        </form>
                    @endauth

                    @guest
                        <!--  if not logged in  -->
                        @if (Route::has('login'))
                            <a href="{{ route('login') }}"
                               class="rounded-md px-3 py-2 text-black ring-1 ring-transparent transition hover:text-blue-700/70 focus:outline-none focus-visible:ring-[#FF2D20] dark:text-white dark:hover:text-white/80 dark:focus-visible:ring-blue-600">Login</a>
                        @endif

                        @if (Route::has('register'))
                            <a href="{{ route('register') }}"
                               class="rounded-md px-3 py-2 text-black ring-1 ring-transparent transition hover:text-blue-700/70 focus:outline-none focus-visible:ring-[#FF2D20] dark:text-white dark:hover:text-white/80 dark:focus-visible:ring-blue-600">Register</a>
                        @endif
                    @endguest

                </nav>

            </header>

            <main class="mt-6 space-y-4">

                <p>This website is a tool for storing and organizing <u>data</u> for mushrooms
                    that you
                    observed and/or collected. Hopefully, it will provide a process that simplifies storing and
                    retrieving <u>your</u> mushroom specimen <b>data</b> in order to compare it to other
                    mushrooms that you and others have observed. Once your initial information is stored in the
                    database, you can edit it as needed and add more character details as you discover
                    them.</p>

                <p>The fact you observed a mushroom means you have some visual, time and location
                    data. That is
                    enough to start. You name this specimen "something" that is meaningful to <b>you,</b> like
                    "myinitials_1" or "myinitials_2", etc. with comment "brown mushroom - backyard". Or include the
                    date, whatever works for you. </p>

                <p>There you
                    go. A beginning. Any clear photo with <b class="text-orange-700">measurements</b> is a plus. <u>If a
                        ruler is not handy, use coins</u>.</p>


                <div class="bg-gray-200 p-4">
                    <h3 class="text-xl text-orange-700">Measurements:</h3>

                    <p class="text-sm">Richard W. Kerrigan's <i><b>AGARICUS</b> of NORTH AMERICA</i>, middle of
                        page
                        22, "To estimate the
                        size of
                        specimens in the field, or to preserve scale information in photographs, it is useful to know
                        the
                        sizes of ordinary coins issued by the relevant nation. In the United States:"</p>

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
                <p>If you did not retrieve a specimen, when you get to the option of selecting where a specimen
                    is currently located (preserved and stored), you can select "Observation Only - No specimen
                    collected". </p>

                <p>If nothing more, now you know when and where you saw "it". This time next year, you may see
                    it again, same place?</p>

                <p>This is not a "key" identification process, like <a href="https://www.mushroomexpert.com">https://www.mushroomexpert.com</a>.
                    You can use MushroomExpert.Com and/or other identification experts to match up <b>your</b>
                    specimen <u>data</u> that is stored here. In the future, perhaps enough positive
                    identifications will result in a match within the mrdbid.com <b>database.</b></p>

                <p>Again, a specimen need not be collected to be entered here. These entries will be recorded as
                    an "observation", not a "specimen".</p>


                <p>PS The "Trees" link began from photographs of the informational signs at Blakely State Park,
                    Baldwin County, Alabama. It is the beginning of a tool for identifying the trees associated
                    with mushrooms.</p>

                <p><b>About Images:</b> I am not a photographer, an artist, or a scientist. My goal in observing
                    or collecting specimens is to provide documentation of its facts that can be preserved for
                    any future study. Good photographs with <b class="text-orange-700">measurements</b> make that
                    possible.</p>

                <p>This website's upload process will reduce some pictures in size, if needed. Otherwise, any
                    editing, cropping, etc. should be done before uploading.</p>

                <p>As part of the specimen collection process, my intention is to take the best picture I can
                    <u>from the beginning</u> following a plan like outlined in the "Citizen Science How To Take
                    Scientifically Useful Observations" link below.</p>

                <p>The most useful pictures will clearly document mushroom characters and <b class="text-orange-700">measurements</b>,
                    along
                    with surroundings (trees, etc.). If this is successfully done, anyone looking at the
                    collection of pictures can confirm the data at any future date.</p>

                <p>This website is <b>not</b> a "field guide". You need to collect pictures and information
                    where mushrooms are found, then transfer the data one time here for your records.</p>

                <h2>Where to begin?</h2>

                <p>If you do not know where to start, click on this link: <a
                        href="https://alabamamushroomsociety.org/Citizen-Science">Citizen Science How To Take
                        Scientifically Useful Observations</a></p>

                <!-- sez it can not resolve - but it works -->
                <p class="mt-4 text-black dark:text-white text-lg"><img
                        src="{{ asset( '/storage/images/AMS_Field_Data_Sheet_400x298.png') }}"
                        alt="AMS Field Data Sheet"></p>

                <!-- /storage/app/public/specimen_images/AMS_Field_Data_Sheet_400x298.png does not work -->

                <p>After completing the form <u>in the field</u>, take a picture of it with your specimen. Notice the <b
                        class="text-orange-700">measurements</b> on the form. Then, once home and when
                    you get around to it, add the data and the pictures you took of the specimen, including this
                    form, to your specimen list. You then have it to refer to online wherever you are, and
                    update as needed while you identify your specimen.</p>

                <p>You will get better with practice. Yes, a microscope helps and is not that difficult to learn to use,
                    along with various chemicals to test reactions.</p>

                <p>Live and learn. <b class="text-orange-700">And measure.</b></p>
            </main>

            <footer class="py-16 text-center text-sm text-black dark:text-white/70">
                Laravel v{{ Illuminate\Foundation\Application::VERSION }} (PHP v{{ PHP_VERSION }})
            </footer>
        </div>
    </div>
</div>
</body>
</html>
