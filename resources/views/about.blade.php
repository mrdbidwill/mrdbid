@php use App\Models\MrCharacter; @endphp@extends('layouts.app')
@section('content')
    <div id="top">


        @if (config('app.env') === 'local')
            <p class="text-gray-500 mt-4">File Address: /resources/views/about.blade.php</p>
        @endif
        <p class="py-2 text-sm text-orange-600 dark:text-orange-500"><b>Privacy Notice: MRDBID.com has not added any
                tracking other than basic analytics provided by our hosting service. There are no Google analytics,
                social media associations, or marketing tracking addons.</b></p>
    </div>
    <p>This page is only information. The forms to add specimens and characters are elsewhere. You have to register and
        login to see the Specimens link and be able to actually do anything.</p>

    <p class="text-orange-600">If want to add characters to a specimen, go to that specimen and look for the "Manage
        characters for this specimen" button link.</p>

    <div class="mt-2 space-y-2">
        <h2 class="text-5xl font-normal leading-normal mt-0 mb-2 text-pink-800">What's in a name?</h2>

        <p>The database will assign each specimen a unique numerical id to keep track of each specimen. You don't need
            to worry about that.</p>

        <p>While you can create whatever <b>Specimen Name</b> and <b>Common Name</b> you like, it should be easier as
            you add many specimens to follow some type of naming convention. Something along the line of myinitials plus
            date plus short and descriptive, such as wrj_5_24_2023_metallic_bronze_side_yard. And then the common name
            may be "Oyster looking on oak tree in park". The genus and species when you get that far will be from a
            current list of names you can select.</p>

        <p>The rest of the basics should be things you know as you collect this specimen.</p>

        <h2 class="text-5xl font-normal leading-normal mt-0 mb-2 text-pink-800">Radio list or Drop-down or text box
            (area)?</h2>

        <p>Yes. No. Maybe. A work in progress.This site relies on lookup tables <u>a lot</u>. For example, what are you
            choices for a certain character? <b>Cap Surface Texture</b> has 24 options, which as of right now, subject
            to change, are:<br><br>

            'Smooth', 'No defining features found on the surface.'<br> 'Uneven', 'A bumpy surface.'<br> 'Rugose', 'A
            wrinkled or rough surface.'<br> 'Rugulose', 'A slightly wrinkled surface.'<br> 'Rivulose', 'A thinly
            wrinkled surface of branching wavy or crooked lines.'<br> 'Scrobiculate', 'A pitted or furrowed
            surface.'<br> 'Warty', 'Remnants of the universal veil remain on the surface in small patches.'<br>
            'Virgate', 'A streaked surface.'<br> 'Hygrophanous', 'A surface that is transparent when wet and opaque when
            dry.'<br> 'Sericeous', 'A silky surface.'<br> 'Fibrillose', 'A surface covered in thread-like
            filaments.'<br> 'Squamose', 'A surface covered with scales.'<br> 'Squarrose', 'A ragged surface covered with
            small scales.'<br> 'Pruinose', 'A surface covered with a white powdery frost like substance.'<br>
            'Pulverulent', 'A surface covered with fine dust or powder.'<br> 'Granulose', 'A surface covered in
            salt-like granulates.'<br> 'Furfuraceous', 'A surface covered in flaky bran-like particles;
            dandruff-like.'<br> 'Zonate', 'A surface containing zones or bands that are distinguished by texture or
            color.'<br> 'Areolate', 'A cracked surface resembling dried-mud or paint.'<br> 'Rimose', 'A surface covered
            in cracks and crevices.'<br> 'Laccate', 'A waxy or lacquered surface texture.'<br> 'Viscid -', 'A sticky
            glue-like surface texture.'<br> 'Glutinous', 'A slimy surface.'<br> 'Glabrous - Hairy', 'Hairy - a bald
            surface.'<br> 'Velvety - Hairy', 'Hairy - A surface covered with very fine and soft hairs.'<br> 'Pubescent -
            Hairy', 'Hairy - A surface cover with fuzz or fine hairs.'<br> 'Canescent - Hairy', 'Hairy - A surface
            covered in dense white or gray down-like hairs. Giving a frosted appearance.'<br> 'Floccose - Hairy', 'Hairy
            - A surface covered in Wooly or cotton-like hairs.'<br> 'Tomentose - Hairy', 'Hairy - A surface covered
            densely with matted hairs.'<br> 'Hispid - Hairy', 'Hairy - A surface covered with straight bristle-like
            hairs.'<br> 'Hirsute - Hairy', 'Hairy - A surface covered with slightly stiff and shaggy hairs.'<br>
            'Villose - Hairy', 'Hairy - A surface covered with long soft hairs.'<br> 'Strigose - Hairy', 'Hairy - A
            surface covered with long bristle-like hairs.<br>
        </p>

        <p>Some of these character descriptions don't exactly roll off the tongue easily and a drop down list may be a
            lot to look through. So, for now a long looking radio list may prove more user friendly for the initial
            input?</p>

        <h2 class="text-5xl font-normal leading-normal mt-0 mb-2 text-pink-800">What exactly are the "accepted" and/or
            "standardized" and/or "scientific" character names, anyway?</h2>

        <p>That is a great question. Hopefully, the process will find or create the answer.</p>

        <p>I started with Scates 1982 chart and went from there. I have read of group (s)? that are or have been working
            on this, but have not found the currently accepted list yet.</p>
    </div>

    <div class="flex items-center justify-center space-x-2">
        <x-site-nav-bar-one-line-no-logo/>
        <a href="#top" class="text-orange-600 font-bold">Top</a>
    </div>

    <div class="space-y-2 space-x-2">
        <h1>Structure:</h1>

        <p>The first step is to add a specimen. The first form has all required fields which are listed next.</p>

        <h2>Basic Specimen Information (all required)</h2>
        <ol class="list-decimal">
            <li> id - the table id is assigned by the system.</li>
            <li> user id - the id assigned to you by the system.</li>
            <li> specimen name - you create this in whatever format you normally use to identify your collection. This
                does not have to be a formal scientific name.
            </li>
            <li> common name - whatever helps you</li>
            <li> description - something that tells about this specimen.</li>
            <li> comment - other helpful notes to add facts to the specimen.</li>
            <li> specimen location now - where is this specimen located right now?</li>
            <li> city nearest to where you found it.</li>
            <li> county you found it in.</li>
            <li> state</li>
            <li> country</li>
            <li> do you want this location shared with others?</li>
            <li> do you want this data shared with others?</li>
            <li> day month year specimen found</li>
            <li> fungus type, such as gills, pores, teeth, etc.</li>
            <li> who entered this information? ( this is you for your specimens )</li>
        </ol>

        <p><b>All of the above is required.</b></p>

        <p><b>All of below is optional.</b> These are the characters you <u>may</u> assign to each specimen. It is a
            work in progress. I started with Scates' 1982 "Easy Guide to Mushroom Descriptions" and added more from
            various books. But, in my opinion, even Scates ran into the "plan ahead" problem with the beginning (upper
            left corner of her chart) being clear and organized but toward the end of the lower right part of her chart
            with some ? and etc.s that would take up quite a bit of space if fully fleshed out.</p>

        <p>Computers help with this problem. A form can get long and longer, but nothing relevant has to be left out of
            the selection process.</p>

        <p>A word about colors. I began with the Alabama Mushroom Society's "Latin Colors Used In Many Mushroom Names"
            chart which is labeled latin_colors.jpg on their website. I then sampled across each color away from the
            numbers and names imposed on the chart so as to arrive as closely as I could at ONE color. Not perfect, but
            I came pretty close. That said, <u>I am done with colors</u>, it get too complicated too quickly. I will NOT
            do a color picker with millions of colors to choose from. There is no point to it.</p>

        <p>Kerrigan's quote below sums it up for me.</p>

        <blockquote class="border-amber-950 border-2 bg-amber-300  p-4"
                    cite="Kerrigan, R. W. (2016). Agaricus of North America (p. 25). The New York Botanical Garden">
            For general purposes I prefer to present a general color description plus, insofar as possible, one or more
            faithful color images (realizing that faith in photo reproduction also has its limits--for which a color
            chart specification can help compensate).

            Kerrigan, R. W. (2016). Agaricus of North America (p. 25). The New York Botanical Garden
        </blockquote>


        <h2>Specimen Characters</h2>

        <p>None are <u>required</u>, but obviously the more that are accurately entered, the better the chance for a
            reliable identification. At some point, I hope to match up good images with dna results, but not there yet.
        </p>
        <p>And... <b>This is a big "And."</b> A really big goal of this process is to identify and examine existing
            characters. If you can add anything to this process, please do.</p>

        <p>The data trail for this goes through the "characters" table, but first there must be a "data source" stored
            in the "data_sources" table. There is a reference column in the data_sources table to make it easier to find
            your reference with a page number, or "middle of page" or "in chart". Any registered user can create a new
            data source. Once created, anyone else can use that data source for their specimens.</p>

        @php
            $mr_characters = MrCharacter::all();
        @endphp

        <div class="flex items-center justify-center space-x-2">
            <x-site-nav-bar-one-line-no-logo/>
            <a href="#top" class="text-orange-600 font-bold">Top</a>
        </div>

        <x-display-characters-lookup-table-list
            :mr_characters="$mr_characters"></x-display-characters-lookup-table-list>
    </div>

@endsection


