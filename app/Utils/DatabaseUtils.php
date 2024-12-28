<?php

namespace App\Utils;

class DatabaseUtils
{
    public function admin_export_database(string $dbName): string
    {
        //dd($dbName);
        // Database credentials
        $user = config('database.connections.mysql.username');
        $password = config('database.connections.mysql.password');
        $host = config('database.connections.mysql.host');

        // dd($dbName, $user, $password, $host);  // All good

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
        // $backupPath = storage_path('export/mrdbid_'.date('Y-m-d').'/');
        $backupPath = 'storage/export/mrdbid_'.date('Y-m-d').'/';   // gives error

        if (! file_exists($backupPath)) {
            if (! mkdir($backupPath, 0777, true) && ! is_dir($backupPath)) {
                throw new \RuntimeException(sprintf('Directory "%s" was not created', $backupPath));
            }
        }

        $backupFile = $backupPath."$dbName.sql";

        //dd($backupFile);  // Good

        $password = escapeshellarg($password);
        // Command to dump the database
        $command = "/usr/bin/mysqldump --user=$user --password=$password --host=$host $ignoreTables $dbName > $backupFile";
        // Execute the mysqldump command
        exec($command, $output, $dumpResult);

        if ($dumpResult !== 0) {
            return "Database export failed (Dump Error)! Error code: $dumpResult";
        }

        //dd($command, $output, $dumpResult);  //  Up to here - complete files created and saved

        $downloadResult = $this->downloadExportFile($backupFile);
        if (! $downloadResult) {
            return 'Database export failed (Download Error)! Unable to download the file.';
        }

        $insert_only_string = $this->processExportFileDataOnly($backupFile);
        // dd($insert_only_string); // Good
        $insert_only_path = $backupPath.$dbName.'_INSERT_INTO.sql';

        $writeResult = file_put_contents($insert_only_path, $insert_only_string);

        if ($writeResult === false) {
            return 'Database export failed (Write Error)! Unable to write INSERT INTO file.';
        }

        // If everything is successful
        return 'Database export successful!';
    }

    public function downloadExportFile($file_name)
    {

        if (file_exists($file_name)) {
            //dd(response()->download($file_name));
            return response()->download($file_name);
        } else {
            abort(404, 'File not found.');
        }
    }

    public function processExportFileDataOnly($file_name): string
    {
        // dd($file_name);  // OK  storage/export/mrdbid_2024-12-28/mrdbid_db.sql

        // Define the regular expression pattern to match lines that do not start with INSERT INTO
        $pattern = '/^(?!INSERT INTO\b).*$/m';

        // dd($pattern);  // OK  /^(?!INSERT INTO\b).*$/m

        // Read the file content
        $file_content = file_get_contents($file_name);

        // dd($file_content);  // OK

        // Remove the unwanted parts using preg_replace
        $filtered_content = preg_replace($pattern, '', $file_content);

        // Remove extra newlines
        $result = preg_replace('/\n+/', "\n", $filtered_content);

        //dd($result);

        return $result;

    }
}
