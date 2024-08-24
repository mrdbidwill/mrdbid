// postcss.config.js
module.exports = {
    plugins: {
        tailwindcss: async () => {
            const tailwindConfig = await import('./tailwind.config.mjs');
            return tailwindConfig.default;
        },
        autoprefixer: {},
    },
};
