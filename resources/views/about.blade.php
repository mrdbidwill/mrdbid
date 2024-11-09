@extends('layouts.app')

@section('content')

    <x-slot:heading>
        MRDBID - About Page
    </x-slot:heading>

    <div class="mt-6 space-y-4">
        <h2 class="text-5xl font-normal leading-normal mt-0 mb-2 text-pink-800">What's in a name?</h2>

        <p>The database will assign each specimen a unique numerical id to keep track of each specimen. You don't need
            to worry about that.</p>

        <p>While you can create whatever <b>Specimen Name</b> and <b>Common Name</b> you like, it should be easier as
            you add many specimens to follow some type of naming convention. It is recommended to keep the Specimen Name
            relatively short and meaningful to you. For the specimen name, something along the line of myinitials plus
            date plus short and descriptive, such as wrj_01_01_1999_first would work. And then the common name may be
            "Oyster looking on oak tree in park". The genus and species when you get that far will be from a current
            (??) list of names you can select.</p>
        <p>The specimen name can <b>not</b> be changed once set. Some people just use initials_1, initials_2,
            initials_3, etc.</p>

        <p>The rest of the basics should be things you know as you collect this specimen.</p>

        <h2 class="text-5xl font-normal leading-normal mt-0 mb-2 text-pink-800">Radio list or Drop-down or text box
            (area)?</h2>

        <p>Yes. No. Maybe. A work in progress.This site relies on lookup tables a lot. For example, what are you choices
            for a certain character? <b>Cap Surface Texture</b> has 24 options, which as of right now, subject to
            change, are:<br><br>

            'Smooth', 'No defining features found on the surface.'<br> 'Uneven', 'A bumpy surface.'<br> 'Rugose', 'A
            wrinkled or rough surface.'<br> 'Rugulose', 'A slightly wrinkled surface.'<br> 'Rivulose', 'A thinly
            wrinkled surface of branching wavy or crooked lines.'<br> 'Scrobiculate', 'A pitted or furrowed
            surface.'<br> 'Warty', 'Remnants of the universal veil remain on the surface in small patches.'<br>
            'Virgate', 'A streaked surface.'<br> 'Hygrophanous', 'A surface that is transparent when wet and opaque when
            dry.'<br> 'Sericeous', 'A silky surface.'<br> 'Fibrillose', 'A surface covered in thread-like
            filaments.'<br> 'Squamose', 'A surface covered with scales.'<br> 'Squarrose', 'A ragged surface covered with
            small scales.'<br> 'Pruinose', 'A surface covered with a white powdery frostlike substance.'<br>
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
            surface covered with long bristle-like hairs.', '', 7, 1, '2024-06-02 05:05:27', '2024-06-02 05:05:27');<br>
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

    <br>
    <hr>
    <br>
    <hr>
    <br>
    <hr>
    <br>
    <hr>
    <br>

    <div class="space-y-6 space-x-4">
        <h1>Structure:</h1>

        <p>The first step to add a specimen. The first form has all required fields which are listed next.</p>

        <h2>Basic Specimen Information (all required)</h2>
        <ol class="list-decimal">
            <li> id - the table id is assigned by the system.</li>
            <li> user id - the id assigned to you by the system.</li>
            <li> specimen name - you create this in whatever format you normally use to identify your collection. This
                does not have to be a formal scientific name.
            </li>
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
            <li> who entered this information? ( this is you for your specimens )</li>
        </ol>

        <p>All of the above is required.</p>

        <p>All of below is optional. These are the characters you <u>may</u> assign to each specimen. It is a work in
            progress. I started with Scates' 1982 "Easy Guide to Mushroom Descriptions" and added more from various
            books. But, in my opinion, even Scates ran into the "plan ahead" problem with the beginning (upper left
            corner of her chart) being clear and organized but toward the end of the lower right part of her chart with
            some ? and etc.s that would take up quite a bit of space if fully fleshed out.</p>

        <p>A word about colors. I began with the Alabama Mushroom Society's "Latin Colors Used In Many Mushroom Names"
            chart which is labeled latin_colors.jpg on their website. I then sampled across each color away from the
            numbers and names imposed on the chart so as to arrive as closely as I could at ONE color. Not perfect, but
            I came pretty close. That said, I am done with colors, it get too complicated too quickly. I will NOT do a
            color picker with millions of colors to choose from. There is no point to it.</p>

        <p>Kerrigan's quote below sums it up for me.</p>

        <blockquote class="border-amber-950 border-2 bg-amber-300  p-4"
                    cite="Kerrigan, R. W. (2016). Agaricus of North America (p. 25). The New York Botanical Garden">
            For general purposes I prefer to present a general color description plus, insofar as possible, one or more
            faithful color images (realizing that faith in photo reproduction also has its limits--for which a color
            chart specification can help compensate).

            Kerrigan, R. W. (2016). Agaricus of North America (p. 25). The New York Botanical Garden
        </blockquote>


        <h2>Optional Specimen Information ( characters - none required ) - as of August 13, 2024</h2>

        <ol class="list-decimal">
            <li>id</li>
            <li>AVAILABLE</li>
            <li>specimen_age</li>
            <li>odor</li>
            <li>taste</li>
            <li>toxic</li>
            <li>habit</li>
            <li>cap_width_mm</li>
            <li>cap_height_mm</li>
            <li>cap_shape</li>
            <li>cap_shape_top_view</li>
            <li>cap_color</li>
            <li>cap_color_disc</li>
            <li>cap_color_margin</li>
            <li>cap_color_background</li>
            <li>cap_color_fibrils</li>
            <li>cap_color_bruised</li>
            <li>cap_color_wet</li>
            <li>cap_color_dry</li>
            <li>cap_surface_dryness</li>
            <li>cap_surface_texture</li>
            <li>cap_margin_shape</li>
            <li>cap_margin_type</li>
            <li>cap_hairy_y_n</li>
            <li>cap_context_flesh_color_moist</li>
            <li>cap_context_flesh_color_dry</li>
            <li>cap_context_flesh_color_cuticle</li>
            <li>cap_context_flesh_thickness_disc_mm</li>
            <li>cap_context_flesh_thickness_margin_mm</li>
            <li>cap_context_flesh_texture</li>
            <li>cap_context_flesh_latex_color</li>
            <li>cap_context_flesh_latex_color_exposed</li>
            <li>cap_context_flesh_latex_taste</li>
            <li>cap_context_flesh_latex_abundance</li>
            <li>gill_attachment</li>
            <li>gill_breadth</li>
            <li>gill_thickness</li>
            <li>gill_spacing</li>
            <li>gill_color_young</li>
            <li>gill_color_mature</li>
            <li>gill_edge</li>
            <li>gill_misc_waxy_y_n</li>
            <li>gill_misc_arid_dry_y_n</li>
            <li>gill_misc_deliquescent_y_n</li>
            <li>stem_location</li>
            <li>stem_height_mm</li>
            <li>stem_diameter_top_mm</li>
            <li>stem_diameter_mid_mm</li>
            <li>stem_diameter_low_mm</li>
            <li>stem_shape</li>
            <li>stem_color</li>
            <li>stem_color_change</li>
            <li>stem_color_base</li>
            <li>stem_color_apex</li>
            <li>stem_color_interior</li>
            <li>stem_color_exterior</li>
            <li>stem_color_bruise</li>
            <li>stem_surface</li>
            <li>stem_texture</li>
            <li>stem_interior</li>
            <li>part_in_veil_ann_ri_posit</li>
            <li>veil_annulus</li>
            <li>partial_inner_veil_color</li>
            <li>partial_inner_veil_texture</li>
            <li>partial_inner_veil_fate</li>
            <li>partial_inner_veil_annular_ring</li>
            <li>partial_inner_veil_appearance</li>
            <li>universal_outer_veil_description</li>
            <li>universal_outer_veil_volva</li>
            <li>bulb_type</li>
            <li>mycelium_color</li>
            <li>mycelium_texture</li>
            <li>spore_color</li>
            <li>spore_range_low_um</li>
            <li>spore_range_high_um</li>
            <li>habitat</li>
            <li>soil_type</li>
            <li>soil_temp</li>
            <li>air_temp</li>
            <li>plant_association</li>
            <li>rhizomorph_color</li>
            <li>rhizomorph_texture</li>
            <li>chem_reaction</li>
            <li>weight_before_dry_grams</li>
            <li>weight_after_dry_grams</li>
            <li>elevation</li>
            <li>soil_ph</li>
            <li>stipe_latex_color_exposed</li>
            <li>stipe_latex_taste</li>
            <li>stipe_latex_abundance</li>
            <li>Mycobank_name</li>
            <li>inaturalist_num</li>
            <li>mushroom_observer_num</li>
            <li>location_found_latitude</li>
            <li>location_found_longitude</li>
            <li>project_belong_to</li>
            <li>microscope_slides_inc_y_n</li>
            <li>preservation_method</li>
            <li>genus</li>
            <li>species</li>
            <li>annulus_position</li>
            <li>univ_out_veil_appear</li>
            <li>univ_out_veil_texture</li>
            <li>univ_out_veil_fate</li>

        </ol>
    </div>

@endsection


