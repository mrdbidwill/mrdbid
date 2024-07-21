@props(['active' => false])   <!-- declare the prop here - assign default value of false is not passed in  - use below as variable  -->

<a class="{{ $active ? 'bg-white text-black': 'text-gray-500 hover:bg-gray-200 hover:text-black'}} rounded-md px-3 py-2 text-sm font-medium"
   aria-current="{{ $active ? 'page': 'false' }}"
    {{ $attributes }}
>{{ $slot }}</a>
