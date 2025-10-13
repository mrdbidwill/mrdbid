/** @type {import('tailwindcss').Config} */
module.exports = {
    content: [
        './app/views/**/*.html.erb', // HTML ERB templates
        './app/helpers/**/*.rb',     // Helpers
        './app/javascript/**/*.js',  // JavaScript files
        './app/assets/stylesheets/**/*.css' // Stylesheets
    ],
    theme: {
        extend: {
            typography: {
                DEFAULT: {
                    css: {
                        'p': {
                            marginTop: '1.5em',
                            marginBottom: '1.5em',
                            lineHeight: '1.5',
                        },
                    },
                },
            },
        },
    },
    plugins: [
        require('@tailwindcss/forms'),
        require('@tailwindcss/typography'),
    ],
};