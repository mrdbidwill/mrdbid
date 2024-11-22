import {defineConfig} from "vite";
import laravel from "laravel-vite-plugin";
import tailwindcss from "tailwindcss";
import autoprefixer from "autoprefixer";

export default defineConfig({
    plugins: [
        laravel({
            input: ["resources/css/app.css", "resources/js/app.js"],
            refresh: true,
        }),
    ],
    css: {
        postcss: {
            plugins: [tailwindcss("./tailwind.config.mjs"), autoprefixer()],
        },
    },
    server: {
        hmr: {
            host: '127.0.0.1',  // Ensure the host is set correctly for HMR
            overlay: false      // Disable the overlay for HMR errors
        },
        cors: true               // Enable CORS
    },
    build: {
        sourcemap: true,         // Enable source maps
    },
});
