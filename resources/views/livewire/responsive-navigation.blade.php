<div>
    <!-- Hamburger -->
    <div class="-me-2 flex items-center sm:hidden">
        <button wire:click="toggleMenu"
                class="inline-flex items-center justify-center p-2 rounded-md text-gray-400 hover:text-gray-500 hover:bg-gray-100 focus:outline-none focus:bg-gray-100 focus:text-gray-500 transition duration-150 ease-in-out">
            <svg class="size-6" stroke="currentColor" fill="none" viewBox="0 0 24 24">
                <path :class="{'hidden': open, 'inline-flex': ! open }" class="inline-flex" stroke-linecap="round"
                      stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"/>
                <path :class="{'hidden': ! open, 'inline-flex': open }" class="hidden" stroke-linecap="round"
                      stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
            </svg>
        </button>
    </div>

    <!-- Responsive Navigation Menu -->
    <div x-data="{ open: @entangle('open') }" class="sm:hidden">
        <div x-show="open" x-transition:enter="transition ease-out duration-200"
             x-transition:enter-start="opacity-0 scale-95" x-transition:enter-end="opacity-100 scale-100"
             x-transition:leave="transition ease-in duration-75" x-transition:leave-start="opacity-100 scale-100"
             x-transition:leave-end="opacity-0 scale-95" class="fixed inset-0 z-40 bg-black/50 sm:hidden" x-cloak></div>

        <div x-show="open" x-transition:enter="transition ease-out duration-200"
             x-transition:enter-start="opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95"
             x-transition:enter-end="opacity-100 translate-y-0 sm:scale-100"
             x-transition:leave="transition ease-in duration-75"
             x-transition:leave-start="opacity-100 translate-y-0 sm:scale-100"
             x-transition:leave-end="opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95"
             class="fixed inset-x-0 top-0 z-50 w-full bg-white px-4 pt-20 pb-4 sm:hidden" x-cloak>
            <div class="space-y-1 pt-2 pb-3">
                @guest
                    <x-responsive-nav-link href="{{ route('about') }}" :active="request()->routeIs('about')">
                        {{ __('About') }}
                    </x-responsive-nav-link>

                    <x-responsive-nav-link href="{{ route('contact') }}" :active="request()->routeIs('contact')">
                        {{ __('Contact') }}
                    </x-responsive-nav-link>

                    <x-responsive-nav-link href="{{ route('books.showFilteredBooks') }}"
                                           :active="request()->routeIs('books.showFilteredBooks')">
                        {{ __('Books') }}
                    </x-responsive-nav-link>

                    <x-responsive-nav-link href="{{ route('login') }}" :active="request()->routeIs('login')">
                        {{ __('Login') }}
                    </x-responsive-nav-link>

                    <x-responsive-nav-link href="{{ route('register') }}" :active="request()->routeIs('register')">
                        {{ __('Register') }}
                    </x-responsive-nav-link>
                @else
                    <!-- About Link -->
                    <x-responsive-nav-link href="{{ route('about') }}" :active="request()->routeIs('about')">
                        {{ __('About') }}
                    </x-responsive-nav-link>

                    <!-- Contact Link -->
                    <x-responsive-nav-link href="{{ route('contact') }}" :active="request()->routeIs('contact')">
                        {{ __('Contact') }}
                    </x-responsive-nav-link>

                    <!-- Books Link -->
                    <x-responsive-nav-link href="{{ route('books.showFilteredBooks') }}"
                                           :active="request()->routeIs('books.showFilteredBooks')">
                        {{ __('Books') }}
                    </x-responsive-nav-link>

                    <!-- Specimens Link -->
                    <x-responsive-nav-link href="{{ route('specimens.index') }}"
                                           :active="request()->routeIs('specimens.index')">
                        {{ __('Specimens') }}
                    </x-responsive-nav-link>

                    <!-- Admin Dashboard Link (for Users with type < 4) -->
                    @if(auth()->user()->type < 4)
                        <x-responsive-nav-link href="{{ route('admin.dashboard') }}"
                                               :active="request()->routeIs('admin.dashboard')" style="color: red;">
                            {{ __('Admin Dashboard') }}
                        </x-responsive-nav-link>
                    @endif


                    <!-- Profile Link -->
                    <x-responsive-nav-link href="{{ route('profile.show') }}"
                                           :active="request()->routeIs('profile.show')">
                        {{ Auth::user()->name }}
                    </x-responsive-nav-link>
                @endguest

            </div>
        </div>
    </div>
</div>
