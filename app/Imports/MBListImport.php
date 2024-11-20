<?php

namespace App\Imports;

use App\Models\MBList;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithBatchInserts;
use Maatwebsite\Excel\Concerns\WithChunkReading;

class MBListImport implements ToModel, WithBatchInserts, WithChunkReading
{
    public function model(array $row)
    {
        return new MBList([
            // Map your columns here
            'column1' => $row[0],
            'column2' => $row[1],
            // etc.
        ]);
    }

    public function batchSize(): int
    {
        return 1000;
    }

    public function chunkSize(): int
    {
        return 1000;
    }
}
