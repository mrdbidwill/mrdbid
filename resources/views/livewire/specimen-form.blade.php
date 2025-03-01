<form wire:submit.prevent="submit">
    <div class="mb-4">
        <label for="specimen_name" class="block text-sm font-medium leading-6 text-black">Specimen Name</label> <input
            type="text" id="specimen_name" wire:model.debounce.500ms="specimen_name" class="consistent-width"
            placeholder="Enter specimen name..." required/>
        @error('specimen_name') <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p> @enderror
    </div>

    <div class="mb-4">
        <label for="common_name" class="block text-sm font-medium leading-6 text-black">Common Name</label> <input
            type="text" id="common_name" wire:model="common_name" class="consistent-width"
            placeholder="Enter common name..."/>
        @error('common_name') <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p> @enderror
    </div>

    <div class="mb-4">
        <label for="specimen_location_now" class="block text-sm font-medium leading-6 text-black">Specimen Location
            Now</label> <select id="specimen_location_now" wire:model="specimen_location_now" class="consistent-width">
            <option value="">Select Location</option>
            @foreach ($specimen_locations as $id => $name)
                <option value="{{ $id }}">{{ $name }}</option>
            @endforeach
        </select>
        @error('specimen_location_now') <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p> @enderror
    </div>

    <div class="mb-4">
        <label for="description" class="block text-sm font-medium leading-6 text-black">Description</label> <textarea
            id="description" wire:model="description" class="consistent-width"
            placeholder="Enter description..."></textarea>
        @error('description') <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p> @enderror
    </div>

    <div class="mb-4">
        <label for="comment" class="block text-sm font-medium leading-6 text-black">Comment</label> <textarea
            id="comment" wire:model="comment" class="consistent-width" placeholder="Enter comment..."></textarea>
        @error('comment') <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p> @enderror
    </div>

    <!-- Location Details -->
    <div class="mb-4">
        <label for="location_found_city" class="block text-sm font-medium leading-6 text-black">City Found</label>
        <input type="text" id="location_found_city" wire:model="location_found_city" class="consistent-width"/>
        @error('location_found_city') <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p> @enderror
    </div>

    <div class="mb-4">
        <label for="location_found_county" class="block text-sm font-medium leading-6 text-black">County Found</label>
        <input type="text" id="location_found_county" wire:model="location_found_county" class="consistent-width"/>
        @error('location_found_county') <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p> @enderror
    </div>

    <!-- Dropdown Fields for Country, State, and Dates -->
    <div class="mb-4">
        <label>Country:</label> <select wire:model="country_id">
            <option value="">Select Country</option>
            @foreach($countries as $id => $name)
                <option value="{{ $id }}">{{ $name }}</option>
            @endforeach
        </select>
        @error('country_id') <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p> @enderror
    </div>

    <div class="mb-4">
        <label>State:</label> <select wire:model="state_id">
            <option value="">Select State</option>
            @foreach($states as $id => $name)
                <option value="{{ $id }}">{{ $name }}</option>
            @endforeach
        </select>
        @error('state_id') <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p> @enderror
    </div>

    <!-- Public/Share Checkboxes -->
    <div class="mb-4">
        <label><input type="checkbox" wire:model="location_public_y_n"/> Public Location?</label>
        @error('location_public_y_n') <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p> @enderror
    </div>

    <div class="mb-4">
        <label><input type="checkbox" wire:model="share_data_y_n"/> Share Data?</label>
        @error('share_data_y_n') <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p> @enderror
    </div>

    <div class="mb-4">
        <label for="day_found">Day:</label> <select wire:model="day_found" id="day_found">
            <option value="">Select Day</option>
            @foreach ($days as $day)
                <option value="{{ $day }}">{{ $day }}</option>
            @endforeach
        </select>
        @error('day_found') <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p> @enderror
    </div>

    <div class="mb-4">
        <label for="month_found">Month:</label> <select wire:model="month_found" id="month_found">
            <option value="">Select Month</option>
            @foreach ($months as $month)
                <option value="{{ $month }}">{{ $month }}</option>
            @endforeach
        </select>
        @error('month_found') <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p> @enderror
    </div>

    <div class="mb-4">
        <label for="year_found">Year:</label> <select wire:model="year_found" id="year_found">
            <option value="">Select Year</option>
            @foreach ($years as $year)
                <option value="{{ $year }}">{{ $year }}</option>
            @endforeach
        </select>
        @error('year_found') <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p> @enderror
    </div>


    <div class="mb-4">
        <label>Fungus Type:</label> <select wire:model="fungus_type">
            <option value="">Select Fungus Type</option>
            @foreach($fungus_types as $id => $name)
                <option value="{{ $id }}">{{ $name }}</option>
            @endforeach
        </select>
        @error('fungus_type') <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p> @enderror
    </div>

    <!-- Submit Button -->
    <button type="submit" class="btn btn-primary">Save Specimen</button>
</form>
