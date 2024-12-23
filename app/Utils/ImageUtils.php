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
        ?>

        <div class="space-y-4">    <!-- app\Utils\ImageUtils.php line 21 -->
        <div class="flex items-center space-x-4">

            <table class="table-auto size-full  bg-indigo-100 border-separate border  border-4-rounded rounded-lg outline-slate-100 outline-4"> <!-- images table ImageUtils line 25 -->

        <tr>
            <td colspan="5" class="border border-slate-400 p-2">
                Click on thumbnail to view larger image. Click again to return to thumbnail.
            </td>
        </tr>
        <tr>
            <td colspan="5" class="border border-slate-600 p-2">
                <div class="flex flex-wrap">
        <?php
        foreach ($images_specimens as $images_specimen) {
            $image_address_thumbnail = url('storage/uploaded_images/thumbnail/thumb_'.$images_specimen->file_address);
            $parts = DB::table('parts')
                ->where('id', '=', $images_specimen->parts)
                ->first();
            // dd($parts);
            $image_address_full_size = url('storage/uploaded_images/'.$images_specimen->file_address);
            ?>

            <div class="p-1 m-2 border-gray-400 border-2">
                            <img class="thumbnail"
                                src="<?php echo $image_address_thumbnail; ?>"
                                alt="<?php echo $image_address_thumbnail; ?>"
                                data-thumbnail="<?php echo $image_address_thumbnail; ?>"
                                data-fullsize="<?php echo $image_address_full_size; ?>"
                                onclick="toggleImage(this)">
                       <!--    <?php echo $parts->name; ?> <?php echo $images_specimen->description; ?>   -->
                <div class="flex space-x-4">
                    <a href="/image_specimens/<?php echo $images_specimen->id; ?>/edit"
                       class="w-18 h-6 flex items-center justify-center rounded-full  text-black hover:bg-green-300  no-underline"
                       title="Edit">
                        <b>Edit</b>
                    </a>
                    <a href="/image_specimens/<?php echo $images_specimen->id; ?>"
                       class="w-18 h-6 flex items-center justify-center rounded-full  text-black hover:bg-green-300  no-underline"
                       title="Info">&#9432;</a>   <!-- &#9432; is the info symbol -->
                </div>
            </div>
            <?php
        }
        ?>
        </div>

       </td>
        </tr>
        </table>  <!-- close images table -->
        </div>
        </div>
<?php
    }
}
