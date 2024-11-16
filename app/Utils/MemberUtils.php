<?php

namespace App\Utils;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class MemberUtils
{
    public static function get_member_type(): int
    {
        $member_type = 0;
        $member_type = DB::table('users')->where('id', Auth::id())->value('type');

        if ($member_type == null ) {$member_type = 0; }

        return $member_type;
    }
}
