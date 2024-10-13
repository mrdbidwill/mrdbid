<x-layout>
    <p>resources/views/contact.blade.php</p>
    @if (session('success'))
        <p>{{ session('success') }}</p>
    @endif

    <form action="{{ route('contact.submit') }}" method="POST">
        @csrf
        <div class="border-2 border-amber-400 bg-amber-200 m-auto p-4">
            <label for="name">Name:</label> <input type="text" id="name" name="name" size="80"
                                                   value="{{ old('name') }}">
            @error('name')
            <div>{{ $message }}</div>
            @enderror
        </div>

        <div class="border-2 border-amber-400 bg-amber-200 m-auto p-4">
            <label for="email">Email:</label> <input type="email" id="email" name="email" size="80"
                                                     value="{{ old('email') }}">
            @error('email')
            <div>{{ $message }}</div>
            @enderror
        </div>

        <div class="border-2 border-amber-400 bg-amber-200 m-auto p-4">
            <label for="recipient">Send to:</label> <select id="recipient" name="recipient">
                <option value="contact">Contact</option>
                <option value="webmaster">Webmaster</option>
                <option value="will">Will</option>
            </select>
            @error('recipient')
            <div>{{ $message }}</div>
            @enderror
        </div>

        <div class="border-2 border-amber-400 bg-amber-200 m-auto p-4">
            <label for="message">Message:</label> <textarea id="message" name="message" rows="12"
                                                            cols="80">{{ old('message') }}</textarea>
            @error('message')
            <div>{{ $message }}</div>
            @enderror
        </div>

        <div class="border-2 border-amber-400 bg-amber-200 m-auto p-2 text-center font-extrabold">
            <button type="submit">Send</button>
        </div>
    </form>
</x-layout>
