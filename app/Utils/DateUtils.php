<?php

namespace App\Utils;

class DateUtils
{
    public static function formatDate(\DateTime $date): string
    {
        // Format date logic
        return $date->format('Y-m-d');
    }

    /**
     * Check if the given date is valid.
     */
    public static function isValidDate(int $month, int $day, int $year): bool
    {
        // Check if the date is valid using PHP's built-in checkdate function
        return checkdate($month, $day, $year);
    }

    /**
     * Get month name by month number.
     */
    public static function getMonthName(int $month): string
    {
        $months = [
            1 => 'January',
            2 => 'February',
            3 => 'March',
            4 => 'April',
            5 => 'May',
            6 => 'June',
            7 => 'July',
            8 => 'August',
            9 => 'September',
            10 => 'October',
            11 => 'November',
            12 => 'December',
        ];

        return $months[$month] ?? 'Invalid month';
    }

    /**
     * Get all month names.
     */
    public static function getAllMonths(): array
    {
        return [
            1 => 'January',
            2 => 'February',
            3 => 'March',
            4 => 'April',
            5 => 'May',
            6 => 'June',
            7 => 'July',
            8 => 'August',
            9 => 'September',
            10 => 'October',
            11 => 'November',
            12 => 'December',
        ];
    }
}
