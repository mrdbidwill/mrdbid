@props([
'colors',
'color_character_names',
'list_of_set_characters',
'specimen_id'
])

<form method="POST" action="/character_specimens" id="color_character">
    @csrf
    <x-display-color-character-select-table :colors="$colors" :color_character_names="$color_character_names"
                                            :list_of_set_characters="$list_of_set_characters"
                                            :specimen_id="$specimen_id"/>

    <x-display-character-specimens-form :color_character_names="$color_character_names"
                                        :list_of_set_characters="$list_of_set_characters" :specimen_id="$specimen_id"/>


    <input type="hidden" name="specimen_id" value="{{ $specimen_id }}">

    <button type="submit" class="bg-blue-300 rounded p-1 border border-slate-400 hover:bg-blue-500 hover:text-white">
        Submit
    </button>
</form>
