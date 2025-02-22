<?php

namespace App\Utils;

class DatabaseUtils
{
    public function admin_export_database(string $dbName): string
    {
        //dd($dbName);
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
            'migrations',
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
        //dd($backupFile);

        $insert_only_string = $this->processExportFileDataOnly($backupFile);
        //dd($insert_only_string);
        $insert_only_path = $backupPath.$dbName.'_INSERT_INTO.sql';

        file_put_contents($insert_only_path, $insert_only_string);

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

    public function processExportFileDataOnly($file_name): string
    {
        // Define the regular expression pattern to match lines that do not start with INSERT INTO
        $pattern = '/^(?!INSERT INTO\b).*$/m';

        // Read the file content
        $file_content = file_get_contents($file_name);

        // Remove the unwanted parts using preg_replace
        $filtered_content = preg_replace($pattern, '', $file_content);

        // Remove extra newlines
        $result = preg_replace('/\n+/', "\n", $filtered_content);

        return $result;

    }
}
