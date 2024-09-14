<?php

namespace App\Utils;

use Illuminate\Support\Facades\DB;

class ImageUtils
{
    public static function displaySpecimenImages(int $specimen_id): void
    {

        $image_count = 1;

        $images_specimens = DB::table('image_specimens')->where('specimen_id', '=', $specimen_id)->get();
        // dd($images_specimens);
        if ($images_specimens->isEmpty()) {
            echo '<p>No images found for this specimen.</p>';

            return;
        }
        echo "<div class=\"space-y-4\">    <!-- app\Utils\ImageUtils.php line 21 -->\n
        <div class=\"flex items-center space-x-4\">\n

            <table class=\"table-auto size-full  bg-indigo-100 border-separate border border-slate-900 border-4-rounded rounded-lg outline-slate-100 outline-4\"> <!-- images table ImageUtils line 25 -->\n

        <tr>\n
            <td colspan=\"5\" class=\"border border-slate-400 p-2\">\n
                Specimen: $specimen_id Click on thumbnail to view larger image. Click again to return to
                thumbnail.
            </td>\n
        </tr>\n
        <tr>\n
            <td colspan=\"5\" class=\"border border-slate-400 p-2\">\n
                <div class=\"flex flex-wrap\">\n";

        foreach ($images_specimens as $images_specimen) {
            $image_address_thumbnail = url('storage/uploaded_images/thumbnail/thumb_'.$images_specimen->file_address);
            $parts = DB::table('parts')
                ->where('id', '=', $images_specimen->parts)
                ->first();
            // dd($parts);
            $image_address_full_size = url('storage/uploaded_images/'.$images_specimen->file_address);

            echo "<div class=\"w-1of5 p-1\">\n
                            <img
                                class=\"h-100 w-100\"
                                src=\"$image_address_thumbnail\"
                                alt=\"$image_address_thumbnail\"
                                data-thumbnail=\"$image_address_thumbnail\"
                                data-fullsize=\"$image_address_full_size\"
                                onclick=\"toggleImage(this)\">
                            $parts->name: $images_specimen->description
                        </div>\n";
        }

        echo "</div>\n</td>\n
        </tr>\n
        </table>  <!-- close images table -->\n
        </div>\n
        </div>\n";
    }
}
