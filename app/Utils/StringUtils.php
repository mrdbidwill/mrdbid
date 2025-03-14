<?php

namespace App\Utils;

class StringUtils
{
    public static function convert_table_name_for_display(string $input): string
    {
        // Replace underscore with space then uppercase first letter of each word
        $display_string = str_replace('_', ' ', $input);

        return ucwords($display_string);
    }

    public static function get_table_name_special_cases(string $characterName): string
    {
        // Laravel convention? will make plural names that end in letter s gets confusing sometimes
        $specialCases = ['cap_surface_dryness', 'genus', 'gill_thickness', 'species', 'veil_annulus'];  // table names already ending in letter s

        return in_array($characterName, $specialCases) ? $characterName : $characterName.'s';
    }
}
