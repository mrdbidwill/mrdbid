@extends('layouts.app')

@section('content')
    <div class="w-full max-w-4xl p-6 bg-white rounded-lg shadow-lg mx-auto">
        @if (session('success'))
            <x-alert type="success" :message="session('success')" dismissable="true" />
        @endif

        <h1 class="text-2xl font-bold mb-6">Contact Us</h1>

        @if (session('status'))
                <x-alert type="status" :message="session('status')" dismissable="true" />
        @endif

        @if ($errors->any())
                <x-alert type="warning" :message="'Please fix the following errors.'" />
                <ul class="list-disc pl-5">
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>

        @endif

        <form action="{{ route('contact.send') }}" method="POST" class="space-y-6">
            @csrf
            <div>
                <label for="recipient" class="block text-gray-700 font-bold mb-2">Use Dropdown to Select Send
                    to:</label> <select id="recipient" name="recipient"
                                        class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                                        required>
                    <option value="contact@mrdbid.com">contact@mrdbid.com</option>
                    <option value="webmaster@mrdbid.com">webmaster@mrdbid.com</option>
                    <option value="will@mrdbid.com">will@mrdbid.com</option>
                </select>
            </div>
            <div>
                <label for="name" class="block text-gray-700 font-bold mb-2">Name:</label> <input type="text" id="name"
                                                                                                  name="name"
                                                                                                  value="{{ old('name') }}"
                                                                                                  class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                                                                                                  required>
            </div>
            <div>
                <label for="email" class="block text-gray-700 font-bold mb-2">Email:</label> <input type="email"
                                                                                                    id="email"
                                                                                                    name="email"
                                                                                                    value="{{ old('email') }}"
                                                                                                    class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                                                                                                    required>
            </div>
            <div>
                <label for="message" class="block text-gray-700 font-bold mb-2">Message:</label> <textarea id="message"
                                                                                                           name="message"
                                                                                                           class="shadow appearance-none border rounded w-full h-64 py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                                                                                                           required>{{ old('message') }}</textarea>
            </div>
            <div>
                <button type="submit"
                        class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
                    Send
                </button>
            </div>
        </form>
    </div>
@endsection
