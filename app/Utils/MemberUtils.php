<?php

namespace App\Utils;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class MemberUtils
{
    public static function get_member_type(): int
    {
        return DB::table('users')->where('id', Auth::id())->value('type');
    }
}
