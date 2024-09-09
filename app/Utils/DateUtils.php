<?php

namespace App\Utils;

class DateUtils
{
    public static function formatDate(\DateTime $date): string
    {
        // Format date logic
        return $date->format('Y-m-d');
    }

    public static function anotherDateMethod(\DateTime $date): string
    {
        // Another date-related logic
        return $date->format('H:i:s');
    }
}
