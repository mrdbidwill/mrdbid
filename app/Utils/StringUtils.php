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

    public static function anotherStringMethod(string $input): string
    {
        // Another string-related logic
        return $input;
    }
}
