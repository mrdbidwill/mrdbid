@props(['active' => false])
<nav class="bg-gray-100">
    <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
        <div class="flex h-16 items-center justify-between">
            <div class="flex items-center">
                <div class="flex-shrink-0">
                    <a href="{{ url('/') }}">
                        <x-application-logo/>
                    </a>
                </div>

                <div class="hidden md:block">
                    <div class="ml-10 flex items-baseline space-x-4">
                        <x-nav-link href="/" :active="request()->is('/')">Home</x-nav-link>
                        <x-nav-link href="/contact" :active="request()->is('contact')">Contact</x-nav-link>
                        <x-nav-link href="/about" :active="request()->is('about')">About</x-nav-link>
                        <x-nav-link href="/books" :active="request()->is('books')">Books</x-nav-link>

                        @auth
                            <x-nav-link href="{{ route('specimens.index') }}"
                                        :active="request()->is('specimens.index')">
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
                </div>
            </div>
        </div>
    </div>
</nav>
