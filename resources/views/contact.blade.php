<x-layout>
    <p>resources/views/contact.blade.php</p>
    @if (session('success'))
        <p>{{ session('success') }}</p>
    @endif

    <form action="{{ route('contact.submit') }}" method="POST">
        @csrf
        <label for="name">Name:</label> <input type="text" id="name" name="name" value="{{ old('name') }}">
        @error('name')
        <div>{{ $message }}</div>
        @enderror

        <label for="email">Email:</label> <input type="email" id="email" name="email" value="{{ old('email') }}">
        @error('email')
        <div>{{ $message }}</div>
        @enderror

        <label for="recipient">Send to:</label> <select id="recipient" name="recipient">
            <option value="contact">Contact</option>
            <option value="webmaster">Webmaster</option>
            <option value="will">Will</option>
        </select>
        @error('recipient')
        <div>{{ $message }}</div>
        @enderror

        <label for="message">Message:</label> <textarea id="message" name="message">{{ old('message') }}</textarea>
        @error('message')
        <div>{{ $message }}</div>
        @enderror

        <button type="submit">Send</button>
    </form>
</x-layout>
