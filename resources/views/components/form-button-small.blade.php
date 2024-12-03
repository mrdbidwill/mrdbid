<button {{ $attributes->merge(['class' => 'rounded bg-indigo-600 px-2 py-1 text-xs font-semibold text-white shadow-sm hover:bg-indigo-500 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-600', 'type' => 'submit']) }}>
    {{ $slot }}
    <span class="text-gray-300 ml-1">{{ $fieldName }}</span>
</button>
