<tr>
    <td class="border-4 border-blue-300 p-2 text-black text-center">

        <div class="mt-6 flex items-center justify-between gap-x-6">
            <!-- Delete button -->
            <div class="flex items-center">
                <button
                    form="delete-form"
                    type="submit"
                    class="text-red-500 text-sm font-bold"
                    onclick="return confirm('Are you sure you want to delete {{ $deleteItem }}?')">
                    Delete {{ $deleteItem }}
                </button>
            </div>

            <!-- Cancel button -->
            <div class="flex items-center gap-x-6">
                <a href="{{ $cancelUrl }}" class="text-sm font-semibold leading-6 text-gray-900">Cancel</a>
            </div>
        </div>

        <!-- Delete form -->
        <form method="POST" action="{{ $deleteAction }}" id="delete-form" class="hidden">
            @csrf
            @method('DELETE')
        </form>
    </td>
</tr>
