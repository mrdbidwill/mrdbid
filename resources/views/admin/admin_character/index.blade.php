@php
    use App\Utils\DatabaseUtils;
@endphp@extends('layouts.app')

@section('content')

    <x-admin-dashboard-nav-bar></x-admin-dashboard-nav-bar>
    <div class="bg-gray-100">
        <div class="mx-auto max-w-7xl">
            <div class="bg-gray-100 py-8">
                <div class="px-4 sm:px-6 lg:px-8">
                    <div class="sm:flex sm:items-center">
                        <div class="sm:flex-auto">
                            <h1 class="text-base font-semibold leading-6 text-black">Edit Character Table:
                                (admin_character/index.blade.php)</h1>
                            <h2 class="text-sm font-semibold leading-5 text-red-600">Admin! Admin! Admin! Admin!
                                Admin!</h2>
                            <p class="text-black">These are the characters in the "characters" table down below. They
                                are currently available to be added as a specimen's character list. None are required.
                                Use as needed. Add new ones with a verifiable source. If a look up table is needed, a
                                list will be needed to create it.</p>

                            <p>Call EXPORT Database here:</p>
                            {{--@php
                                $export = new DatabaseUtils;
                                $export->admin_export_database('mrdbid');
                                @endphp  --}}

                            <p class="text-black">Helpful characters should be added. Less helpful characters won't be
                                used, so the list will eventually police itself.</p>

                            <p class="text-black">For example, the following SQL code was used to create the
                                "annulus_positions" <b>look up </b>table. Many lookup tables use an identical format.
                                Others have special needs and are different.</p>

                            <pre class="black">
    CREATE TABLE `annulus_positions` (
    `id` bigint UNSIGNED NOT NULL,
    `name` varchar(240) COLLATE utf8mb4_unicode_ci NOT NULL,
    `description` text COLLATE utf8mb4_unicode_ci,
    `comments` text COLLATE utf8mb4_unicode_ci,
    `source` int NOT NULL,
    `entered_by` int NOT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
    </pre>

                            <pre class="text-black">INSERT INTO `annulus_positions` (`id`, `name`, `description`,
    `comments`, `source`, `entered_by`, `created_at`, `updated_at`) VALUES
    (1, 'Not Entered', '', '', 23, 1, '2024-06-02 00:05:27', '2024-06-02 00:05:27'),
    (2, 'Superior', 'Near the cap', '', 7, 1, '2024-06-02 00:05:27', '2024-06-02 00:05:27'),
    (3, 'Apical', 'upper half', '', 7, 1, '2024-06-02 00:05:27', '2024-06-02 00:05:27'),
    (4, 'Median', 'in the middle', '', 7, 1, '2024-06-02 00:05:27', '2024-06-02 00:05:27'),
    (5, 'Inferior', 'Lower half', '', 7, 1, '2024-06-02 00:05:27', '2024-06-02 00:05:27'),
    (6, 'Basal', 'Near the base', '', 7, 1, '2024-06-02 00:05:27', '2024-06-02
    00:05:27');</pre>


                        </div>
                    </div>
                    <div class="mt-8 flow-root">
                        <div class="-mx-4 -my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
                            <div class="inline-block min-w-full py-2 align-middle sm:px-6 lg:px-8">
                                <table class="min-w-full divide-y divide-gray-700">
                                    <thead>
                                    <tr>
                                        <th scope="col"
                                            class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-white sm:pl-0">
                                            ID
                                        </th>
                                        <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-white">
                                            Name
                                        </th>
                                        <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-white">
                                            Display Options
                                        </th>
                                        <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-white">
                                            Is this a lookup table?
                                        </th>
                                        <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-white">
                                            Parts
                                        </th>
                                        <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-white">
                                            Source:
                                        </th>
                                        <th scope="col" class="relative py-3.5 pl-3 pr-4 sm:pr-0">
                                            <span class="sr-only">Edit</span>
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody class="divide-y divide-gray-800">

                                    @php
                                        //dd($character_tables);
                                    @endphp
                                    @foreach ($character_tables as $character_table)
                                        <tr>
                                            <td class="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-medium text-black sm:pl-0">{{ $character_table['id'] }}</td>
                                            <td class="whitespace-nowrap px-3 py-4 text-sm text-black">{{ $character_table['name'] }}</td>
                                            <td class="whitespace-nowrap px-3 py-4 text-sm text-black">{{ $character_table['display_options'] }}</td>
                                            <td class="whitespace-nowrap px-3 py-4 text-sm text-black">{{ $character_table['look_up_y_n'] }}</td>
                                            <td class="whitespace-nowrap px-3 py-4 text-sm text-black">{{ $character_table['parts'] }}</td>
                                            <td class="whitespace-nowrap px-3 py-4 text-sm text-black">{{ $character_table['source'] }}</td>

                                            <td class="relative whitespace-nowrap py-4 pl-3 pr-4 text-right text-sm font-medium sm:pr-0">
                                                <a href = "{{ route('admin.characters.edit', $character_table->id ) }}" class="px-4 py-2 bg-blue-500 text-black rounded-lg">Edit</a>
                                            </td>
                                        </tr>
                                    @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection


