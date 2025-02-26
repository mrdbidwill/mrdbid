<div class="bg-white border-b border-gray-200">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between h-16">
            <div class="flex">
                <!-- Links for the Menu -->

                <div class="hidden space-x-8 sm:-my-px sm:ml-10 sm:flex">
                    @guest
                        <!-- Links for guests -->
                        <a href="/">
                            <x-mrdbid-logo-svg
                                class="inline-flex items-center px-1 pt-1 border-b-2 border-transparent text-sm font-medium leading-5 text-gray-500 hover:text-gray-700 hover:border-gray-300 focus:outline-none focus:text-gray-700 focus:border-gray-300 transition duration-150 ease-in-out"></x-mrdbid-logo-svg>
                        </a>



                        <x-nav-link href="{{ route('about') }}" :active="request()->routeIs('about')">
                            {{ __('About') }}
                        </x-nav-link>

                        <x-nav-link href="{{ route('contact') }}" :active="request()->routeIs('contact')">
                            {{ __('Contact') }}
                        </x-nav-link>

                        <x-nav-link href="{{ route('books.showFilteredBooks') }}"
                                    :active="request()->routeIs('books.showFilteredBooks')">
                            {{ __('Books') }}
                        </x-nav-link>

                        <x-nav-link href="{{ route('login') }}" :active="request()->routeIs('login')">
                            {{ __('Login') }}
                        </x-nav-link>

                        <x-nav-link href="{{ route('register') }}" :active="request()->routeIs('register')">
                            {{ __('Register') }}
                        </x-nav-link>

                    @else
                        <!-- Link for logged-in users -->
                        <a href="/">
                            <x-mrdbid-logo-svg
                                class="inline-flex items-center px-1 pt-1 border-b-2 border-transparent text-sm font-medium leading-5 text-gray-500 hover:text-gray-700 hover:border-gray-300 focus:outline-none focus:text-gray-700 focus:border-gray-300 transition duration-150 ease-in-out"></x-mrdbid-logo-svg>
                        </a>

                        <x-nav-link href="{{ route('about') }}" :active="request()->routeIs('about')">
                            {{ __('About') }}
                        </x-nav-link>
                        <x-nav-link href="{{ route('contact') }}" :active="request()->routeIs('contact')">
                            {{ __('Contact') }}
                        </x-nav-link>
                        <x-nav-link href="{{ route('books.showFilteredBooks') }}"
                                    :active="request()->routeIs('books.showFilteredBooks')">
                            {{ __('Books') }}
                        </x-nav-link>
                        <x-nav-link href="{{ route('specimens.index') }}"
                                    :active="request()->routeIs('specimens.index')">
                            {{ __('Specimens') }}
                        </x-nav-link>
                    @endguest
                </div>

                @auth
                    <div class="hidden sm:flex sm:items-center sm:ml-6">
                        <!-- Profile Dropdown -->
                        <div class="ml-3 relative">
                            <x-dropdown align="right" width="48">
                                <x-slot name="trigger">
                                    <button
                                        class="flex items-center text-sm font-medium text-gray-500 hover:text-gray-700 focus:outline-none">
                                        <div>{{ Auth::user()->name }}</div>
                                        <div class="ml-1">
                                            <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg"
                                                 viewBox="0 0 20 20">
                                                <path fill-rule="evenodd"
                                                      d="M5.293 5.293a1 1 0 011.414 0L10 8.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"
                                                      clip-rule="evenodd"/>
                                            </svg>
                                        </div>
                                    </button>
                                </x-slot>

                                <x-slot name="content">
                                    <x-dropdown-link href="{{ route('profile.show') }}">
                                        {{ __('Profile') }}
                                    </x-dropdown-link>

                                    <form method="POST" action="{{ route('logout') }}">
                                        @csrf
                                        <x-dropdown-link href="{{ route('logout') }}"
                                                         onclick="event.preventDefault(); this.closest('form').submit();">
                                            {{ __('Log Out') }}
                                        </x-dropdown-link>
                                    </form>
                                </x-slot>
                            </x-dropdown>
                        </div>
                    </div>
                @endif
            </div>
            @livewire('responsive-navigation')

        </div>
    </div>
</div>
