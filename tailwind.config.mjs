/** @type {import('tailwindcss').Config} */
export default {
  content: ['./src/**/*.{astro,html,js,jsx,md,mdx,svelte,ts,tsx,vue}'],
  theme: {
    extend: {
      colors: {
        ocean:   '#003566',
        wave:    '#0077b6',
        surf:    '#00b4d8',
        sand:    '#fcbf49',
        sunset:  '#f77f00',
        foam:    '#e8f4f8',
      },
      fontFamily: {
        display: ['"Syne"', 'sans-serif'],
        body:    ['"Karla"', 'sans-serif'],
      },
    },
  },
  plugins: [],
};
