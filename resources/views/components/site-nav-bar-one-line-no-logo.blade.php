@props(['active' => false])
<div class="bg-green-200">
    <!-- Standard navigation links -->
    <div class="hidden md:flex space-x-4">
        <x-nav-link href="/" :active="request()->is('/')">Home</x-nav-link>
        <x-nav-link href="/contact" :active="request()->is('contact')">Contact</x-nav-link>
        <x-nav-link href="/about" :active="request()->is('about')">About</x-nav-link>
        <x-nav-link href="/books" :active="request()->is('books')">Books</x-nav-link>

        @auth
            <x-nav-link href="/trees" :active="request()->is('trees')">Trees</x-nav-link>
            <x-nav-link href="/articles" :active="request()->is('articles')">Articles</x-nav-link>
            <x-nav-link href="{{ route('specimens.index') }}" :active="request()->is('specimens.index')">
                Specimens
            </x-nav-link>
        @endauth
    </div><!-- End Standard navigation links -->

    <!-- Hamburger menu for mobile -->
    <div class="md:hidden flex items-center">
        <button type="button" class="text-gray-700 hover:text-white focus:outline-none"
                aria-label="Toggle navigation menu" onclick="toggleMenu('site-menu')">
            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                 xmlns="http://www.w3.org/2000/svg">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                      d="M4 6h16M4 12h16M4 18h16"></path>
            </svg>
        </button>
    </div><!-- End Hamburger menu for mobile -->

    <!-- Mobile navigation links -->
    <div id="site-menu" class="w-full md:hidden flex flex-col space-y-2 mt-4">
        <x-nav-link href="/" :active="request()->is('/')">Home</x-nav-link>
        <x-nav-link href="/articles" :active="request()->is('articles')">Articles</x-nav-link>
        <x-nav-link href="/contact" :active="request()->is('contact')">Contact</x-nav-link>
        <x-nav-link href="/about" :active="request()->is('about')">About</x-nav-link>
        <x-nav-link href="/books" :active="request()->is('books')">Books</x-nav-link>

        @auth
            <x-nav-link href="{{ route('specimens.index') }}" :active="request()->is('specimens.index')">
                Specimens
            </x-nav-link>
        @endauth
    </div>
</div>

<script>
    function toggleMenu(menuId) {
        const menu = document.getElementById(menuId);
        menu.classList.toggle('hidden');
    }
</script>
