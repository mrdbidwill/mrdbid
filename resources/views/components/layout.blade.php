<!doctype html>
<html lang="en" class="h-full">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>MRDBID Mushroom Database Identification - components/layout</title>
    @vite('resources/css/app.css')
</head>

<body class="h-full">
<div class="min-h-full">
    <x-site-nav-bar></x-site-nav-bar>
    <main>
        <div class=" mx-auto max-w-7xl py-6 sm:px-6 lg:px-8">
            {{ $slot }}
        </div>
    </main>
</div>
</body>
</html>
