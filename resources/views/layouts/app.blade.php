<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>MRDBID Mushroom Database Identification</title>

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.bunny.net">
    <link href="https://fonts.bunny.net/css?family=inter:400,500,600&display=swap" rel="stylesheet"/>

    <!-- Vite Assets -->
    @vite('resources/css/app.css')
    @vite('resources/js/app.js')

    <!-- Third-Party Libraries -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>

    <!-- jQuery UI CSS -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    @livewireStyles

    <!-- Custom Scripts -->
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

        function toggleColorImage(element) {
            const bannerImage = element.getAttribute('data-banner');
            const bigImage = element.getAttribute('data-big');
            const currentSrc = element.getAttribute('src');

            if (currentSrc === bannerImage) {
                element.setAttribute('src', bigImage);
                element.classList.remove('h-100', 'w-100');
                element.classList.add('h-auto', 'w-auto');
            } else {
                element.setAttribute('src', bannerImage);
                element.classList.remove('h-auto', 'w-auto');
                element.classList.add('h-100', 'w-100');
            }
        }
    </script>

    <style>
        body {
            display: none;
        }
    </style>
</head>
<body>
<x-site-nav-bar></x-site-nav-bar>
<main>
    <div class="mx-auto max-w-7xl py-6 sm:px-6 lg:px-8">
        @yield('content')
    </div>
</main>

@livewireScripts

<!-- Example of 'stack' usage for scripts that might be pushed from child views -->
@stack('scripts')

<script>
    document.addEventListener("DOMContentLoaded", function () {
        document.body.style.display = "block";
    });
</script>
</body>
</html>
