@props(['active' => false])
<nav class="bg-gray-100 p-4">
    <div class="container mx-auto flex justify-between items-center">

        <div class="flex-shrink-0">
            <a href="{{ url('/') }}">
                <x-application-logo/>
            </a>
        </div>

        <!-- Standard navigation links -->
        <div class="hidden md:flex space-x-4">

            <x-nav-link href="/" :active="request()->is('/')">Home</x-nav-link>
            <x-nav-link href="/contact" :active="request()->is('contact')">Contact</x-nav-link>
            <x-nav-link href="/about" :active="request()->is('about')">About</x-nav-link>
            <x-nav-link href="/books" :active="request()->is('books')">Books</x-nav-link>

            @auth
                <x-nav-link href="{{ route('specimens.index') }}" :active="request()->is('specimens.index')">
                    Specimens
                </x-nav-link>
                @php
                    $member_type = \App\Utils\MemberUtils::get_member_type();
                @endphp
                @if($member_type < 4)
                    <x-nav-link href="{{ route('admin_dashboard') }}" style="color: red; font-weight: bold;"
                                :active="request()->is('admin_dashboard')">
                        Admin
                    </x-nav-link>
                @endif

                <x-nav-link href="{{ route('profile.edit') }}"
                            :active="request()->is('profile.edit')"> {{  Auth::user()->name }}
                </x-nav-link>

                <form method="POST" action="{{ route('logout') }}">
                    @csrf
                    <x-nav-link href="route('logout')"
                                onclick="event.preventDefault();  this.closest('form').submit();">
                        {{ __('Log Out') }}
                    </x-nav-link>
                </form>

            @endauth

            @guest
                <x-nav-link href="/login" :active="request()->is('login')">Log In</x-nav-link>
                <x-nav-link href="/register" :active="request()->is('register')">Register
                </x-nav-link>
            @endguest
        </div>
        <!-- End Standard navigation links -->

        <!-- Mobile navigation links -->
        <div id="site-menu" class="block md:hidden">

            <x-nav-link href="/" :active="request()->is('/')">Home</x-nav-link>
            <x-nav-link href="/contact" :active="request()->is('contact')">Contact</x-nav-link>
            <x-nav-link href="/about" :active="request()->is('about')">About</x-nav-link>
            <x-nav-link href="/books" :active="request()->is('books')">Books</x-nav-link>

            @auth
                <x-nav-link href="{{ route('specimens.index') }}" :active="request()->is('specimens.index')">
                    Specimens
                </x-nav-link>
                @php
                    $member_type = \App\Utils\MemberUtils::get_member_type();
                @endphp
                @if($member_type < 4)
                    <x-nav-link href="{{ route('admin_dashboard') }}" style="color: red; font-weight: bold;"
                                :active="request()->is('admin_dashboard')">
                        Admin
                    </x-nav-link>
                @endif

                <x-nav-link href="{{ route('profile.edit') }}"
                            :active="request()->is('profile.edit')"> {{  Auth::user()->name }}
                </x-nav-link>

                <form method="POST" action="{{ route('logout') }}">
                    @csrf
                    <x-nav-link href="route('logout')"
                                onclick="event.preventDefault();  this.closest('form').submit();">
                        {{ __('Log Out') }}
                    </x-nav-link>
                </form>

            @endauth

            @guest
                <x-nav-link href="/login" :active="request()->is('login')">Log In</x-nav-link>
                <x-nav-link href="/register" :active="request()->is('register')">Register
                </x-nav-link>
            @endguest
        </div>
        <!-- End Mobile navigation links -->
    </div>
</nav>

<script>
    function toggleMenu(menuId) {
        var element = document.getElementById(menuId);
        element.classList.toggle("hidden");
    }
</script>
