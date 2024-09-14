<?php

namespace App\Utils;

class DatabaseUtils
{
    public static function anotherDatabaseMethod(string $someName): string
    {
        // Another database-related logic
        return $someName;
    }

    public function exportDatabase(string $dbName): string
    {
        // Database credentials
        $user = 'root';
        $password = 'moon1Dog';
        $host = 'localhost';

        // Tables to exclude
        $excludeTables = [
            'cache',
            'cache_locks',
            'failed_jobs',
            'jobs',
            'job_batches',
            'password_reset_tokens',
            'sessions',
            'users',  // Add other tables as needed
        ];

        // Construct the ignore-table parameters for mysqldump
        $ignoreTables = '';
        foreach ($excludeTables as $table) {
            $ignoreTables .= "--ignore-table=$dbName.$table ";
        }

        // Backup path
        $backupPath = 'storage/export/mrdbid_'.date('Y-m-d').'/';

        if (! file_exists($backupPath)) {
            mkdir($backupPath, 0777, true);
        }
        $backupFile = $backupPath."$dbName.sql";

        // Command to dump the database
        $command = "mysqldump --user=$user --password=$password --host=$host $ignoreTables $dbName > $backupFile";
        exec($command, $output, $result);

        $this->downloadExportFile($backupFile);

        if ($result === 0) {
            return 'Database export successful!';
        } else {
            return "Database export failed! Error code: $result";
        }
    }

    public function downloadExportFile($filename)
    {
        //$file_path = storage_path('app/public/'.$filename);
        $file_path = $filename;

        if (file_exists($file_path)) {
            return response()->download($file_path);
        } else {
            abort(404, 'File not found.');
        }
    }

    public function processExportFileDataOnly($filename): string
    {
        // use regex to remove all but data that can be inserted into table
        $dataOnly = preg_replace('/^.*INSERT INTO/', 'INSERT INTO', $filename);

        return preg_replace('/;.*$/', ';', $dataOnly);

    }
}
