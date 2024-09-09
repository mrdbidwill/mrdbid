<?php

namespace App\Utils;

class DatabaseUtils
{
    public static function anotherDatabaseMethod(string $someName): string
    {
        // Another database-related logic
        return $someName;
    }

    public function exportDatabase(string $dbName): void
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
        $backupPath = 'storage/app/export/mrdbid_'.date('Y-m-d').'/';

        if (! file_exists($backupPath)) {
            mkdir($backupPath, 0777, true);
        }
        $backupFile = $backupPath."$dbName.sql";

        // Command to dump the database
        $command = "mysqldump --user=$user --password=$password --host=$host $ignoreTables $dbName > $backupFile";
        exec($command, $output, $result);

        if ($result === 0) {
            echo "Database export successful!\n";
        } else {
            echo "Database export failed!\n";
        }
    }
}
