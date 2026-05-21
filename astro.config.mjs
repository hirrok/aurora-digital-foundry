import { defineConfig } from 'astro/config';
import tailwind from '@astrojs/tailwind';

export default defineConfig({
  integrations: [tailwind()],
  site: 'https://hirrok.github.io',
  base: '/aurora-digital-foundry',
  output: 'static',
});
