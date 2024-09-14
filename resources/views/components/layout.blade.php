<!doctype html>
<html lang="en" class="h-full">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>MRDBID Mushroom Database Identification - components/layout</title>

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

    <style>
        .flex-wrap {
            display: flex;
            flex-wrap: wrap;
        }

        .w-1of5 {
            width: 20%; /* This makes each image take up 20% of a row, so up to 5 images per row */
        }

        .p-1 {
            padding: 0.25rem; /* Adjust the padding as needed */
        }

        .h-100 {
            height: 100px; /* Adjust height as needed */
        }
    </style>

    @vite('resources/css/app.css')
</head>

<body class="h-full">          <!-- <?php echo "views/components/layout.blade.php line " . __LINE__ . "."; ?> -->
<div class="min-h-full">         <!-- <?php echo "views/components/layout.blade.php line " . __LINE__ . "."; ?> -->
    <x-site-nav-bar></x-site-nav-bar>
    <main>
        <div
            class=" mx-auto max-w-7xl py-6 sm:px-6 lg:px-8">   <!-- <?php echo "views/components/layout.blade.php line " . __LINE__ . "."; ?> -->
            {{ $slot }}
        </div>
    </main>
</div>
</body>
</html>
