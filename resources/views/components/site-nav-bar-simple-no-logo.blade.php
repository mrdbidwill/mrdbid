@props(['active' => false])@php
    $member_type = App\Utils\MemberUtils::get_member_type();
@endphp

<nav class="bg-gray-100 p-4">
    <div class="container mx-auto flex flex-wrap justify-between items-center">

        @if ($member_type == 0)
            <!-- Only needed if no one is logged in -->
        @else
           {{--  Member Type: {{ $member_type }}  --}}
        @endif

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

                @if($member_type < 4)
                    <x-nav-link href="{{ route('admin.dashboard') }}" :active="request()->is('admin.dashboard')">
                        <span class="text-red-500">Admin</span>
                    </x-nav-link>
                @endif

                @livewire('navigation-menu')

    {{--             <x-nav-link href="{{ route('profile.edit') }}"
                            :active="request()->is('profile.edit')"> {{ Auth::user()->name }}
                </x-nav-link>

                <form method="POST" action="{{ route('logout') }}">
                    @csrf
                    <x-nav-link href="{{ route('logout') }}"
                                onclick="event.preventDefault(); this.closest('form').submit();">
                        {{ __('Log Out') }}
                    </x-nav-link>
                </form>
     --}}
            @endauth

            @guest
                <x-nav-link href="/login" :active="request()->is('login')">Log In</x-nav-link>
                <x-nav-link href="/register" :active="request()->is('register')">Register</x-nav-link>
            @endguest
        </div>
        <!-- End Standard navigation links -->

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
        </div>
        <!-- End Hamburger menu for mobile -->

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

                @if($member_type < 4)
                    <x-nav-link href="{{ route('admin.dashboard') }}" style="color: red; font-weight: bold;"
                                :active="request()->is('admin.dashboard')">
                        Admin
                    </x-nav-link>
                @endif

                <x-nav-link href="{{ route('profile.edit') }}"
                            :active="request()->is('profile.edit')"> {{ Auth::user()->name }}
                </x-nav-link>

                <form method="POST" action="{{ route('logout') }}">
                    @csrf
                    <x-nav-link href="{{ route('logout') }}"
                                onclick="event.preventDefault(); this.closest('form').submit();">
                        {{ __('Log Out') }}
                    </x-nav-link>
                </form>
            @endauth

            @guest
                <x-nav-link href="/login" :active="request()->is('login')">Log In</x-nav-link>
                <x-nav-link href="/register" :active="request()->is('register')">Register</x-nav-link>
            @endguest
        </div>
        <!-- End Mobile navigation links -->
    </div>
</nav>

<script>
    function toggleMenu(menuId) {
        const menu = document.getElementById(menuId);
        menu.classList.toggle('hidden');
    }
</script>
