@props(['href', 'active' => false])

@php
    $classes = $active
        ? 'text-gray-300 bg-blue-700 px-4 py-2 rounded inline-block'
        : 'text-white bg-blue-500 px-4 py-2 rounded inline-block';
@endphp

<a href="{{ $href }}" {{ $attributes->merge(['class' => $classes]) }}>
    {{ $slot }}
</a>




