<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>MRDBID Mushroom Database Identification</title>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700&display=swap" rel="stylesheet">
    <link href="{{ mix('css/app.css') }}" rel="stylesheet">

    <script>
        function toggleImage(element) {
            const thumbnailSrc = element.getAttribute('data-thumbnail');
            const fullSizeSrc = element.getAttribute('data-fullsize');

            if (element.src === thumbnailSrc) {
                element.src = fullSizeSrc;
                element.classList.remove('h-100', 'w-100');
            } else {
                element.src = thumbnailSrc;
                element.classList.add('h-100', 'w-100');
            }
        }
    </script>

    <script>
        function toggleColorImage(element) {
            const bannerImage = element.getAttribute('data-banner');
            const bigImage = element.getAttribute('data-big');
            const currentSrc = element.getAttribute('src');

            if (currentSrc === bannerImage) {
                element.setAttribute('src', bigImage);
                element.classList.remove('h-100', 'w-100');
                element.classList.add('h-auto', 'w-auto'); // You can adjust these class names as needed for the big image.
            } else {
                element.setAttribute('src', bannerImage);
                element.classList.remove('h-auto', 'w-auto');
                element.classList.add('h-100', 'w-100'); // Revert to the original class names for the banner.
            }
        }
    </script>

    <link rel="preconnect" href="https://fonts.bunny.net">
    <link href="https://fonts.bunny.net/css?family=inter:400,500,600&display=swap" rel="stylesheet"/>

    <script src="https://cdn.jsdelivr.net/npm/alpinejs@2.x.x/dist/alpine.min.js" defer></script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Include jQuery UI for Autocomplete (if necessary) -->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    @vite('resources/css/app.css')
    @fluxStyles
</head>

<body>
@stack('scripts')
<div>
    <x-site-nav-bar></x-site-nav-bar>
    <main>
        <div class=" mx-auto max-w-7xl py-6 sm:px-6 lg:px-8">
            @yield('content')
        </div>
    </main>
</div>
@fluxScripts
</body>
</html>
