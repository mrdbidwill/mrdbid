<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Kingdom Dashboard') }}
        </h2>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                    <div class="p-6 text-gray-900">

                        <x-nav-link :href="route('fungi.fungi-specimen')"
                                    :active="request()->routeIs('fungi.fungi-specimen')">
                            {{ __('Kingdom Fungi') }}
                        </x-nav-link>
                        <x-nav-link :href="route('monera.monera-specimen')"
                                    :active="request()->routeIs('monera.monera-specimen')">
                            {{ __('Kingdom Monera') }}
                        </x-nav-link>
                        <x-nav-link :href="route('protista.protista-specimen')"
                                    :active="request()->routeIs('protista.protista-specimen')">
                            {{ __('Kingdom Protista') }}
                        </x-nav-link>
                        <x-nav-link :href="route('animalia.animalia-specimen')"
                                    :active="request()->routeIs('animalia.animalia-specimen')">
                            {{ __('Kingdom Animalia') }}
                        </x-nav-link>

                        <x-nav-link :href="route('plantae.plantae-specimen')"
                                    :active="request()->routeIs('plantae.plantae-specimen')">
                            {{ __('Kingdom Plantae') }}
                        </x-nav-link>

                    </div>
                </div>
            </div>
        </div>
    </x-slot>
</x-app-layout>
