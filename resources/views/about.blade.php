<x-layout>
    <x-slot:heading>
        MRDBID - About Page
    </x-slot:heading>

    <div class="space-y-6 space-x-4">
        <h1>Structure:</h1>

        <p>The first step to add a specimen. The first form has all required fields which are listed next.</p>

        <h2>Basic Specimen Information (all required)</h2>
        <ol class="list-decimal">
            <li> id - the table id is assigned by the system.</li>
            <li> user id - the id assigned to you by the system.</li>
            <li> specimen name - you create this in whatever format you normally use to identify your collection. This
                does
                not have to be a formal scientific name.
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
            books.
            But, in my opinion, even Scates ran into the "plan ahead" problem with the beginning (upper left corner of
            her
            chart) being clear and organized but toward the end of the lower right part of her chart with some ? and
            etc.s
            that would take up quite a bit of space if fully fleshed out.</p>

        <p>A word about colors. I began with the Alabama Mushroom Society's "Latin Colors Used In Many Mushroom Names"
            chart which is labeled latin_colors.jpg on their website. I then sampled across each color away from the
            numbers and names
            imposed on the chart so as to arrive as closely as I could at ONE color. Not perfect, but I came pretty
            close.
            That said, I am done with colors, it get too complicated too quickly. I will NOT do a color picker with
            millions
            of colors to choose from. There is no point to it.</p>
        <blockquote cite="Kerrigan, R. W. (2016). Agaricus of North America (p. 25). The New York Botanical Garden">
            For general purposes I prefer to present a general color description plus, insofar as possible, one or more
            faithful
            color images (realizing that faith in photo reproduction also has its limits--for which a color chart
            specification
            can help compensate).

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


</x-layout>
