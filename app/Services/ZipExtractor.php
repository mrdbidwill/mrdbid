<?php

namespace App\Services;

use Exception;
use ZipArchive;

class ZipExtractor
{
    public function extract($zipFilePath, $extractToPath)
    {
        $zip = new ZipArchive;
        if ($zip->open($zipFilePath) === true) {
            $zip->extractTo($extractToPath);
            $zip->close();

            return true;
        } else {
            throw new Exception('Failed to open the ZIP file.');
        }
    }
}
