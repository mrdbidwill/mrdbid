// tailwind.config.mjs
export default {
    content: [
        //  https://tailwindcss.com/docs/upgrade-guide#configure-content-sources

        "./resources/**/*.blade.php",
        "./resources/**/*.js",
        "./resources/**/*.vue",
        "./vendor/livewire/flux-pro/stubs/**/*.blade.php",
        "./vendor/livewire/flux/stubs/**/*.blade.php",
    ],
    theme: {
        theme: {
            extend: {
                fontFamily: {
                    sans: ["Inter", "sans-serif"],
                },
            },
        },
    },
    variants: {
        extend: {},
    },
    plugins: [],
};
