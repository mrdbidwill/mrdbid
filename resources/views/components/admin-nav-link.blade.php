@props(['href', 'active' => false])

@php
    $classes = $active
        ? 'text-gray-300 bg-red-700 px-4 py-2 rounded inline-block'
        : 'text-white bg-orange-500 px-4 py-2 rounded inline-block hover:bg-pink-200 hover:text-black';
@endphp

<a href="{{ $href }}" {{ $attributes->merge(['class' => $classes]) }}>
    {{ $slot }}
</a>


