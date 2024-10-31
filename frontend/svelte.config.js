import adapter from '@sveltejs/adapter-static';
import { vitePreprocess } from '@sveltejs/vite-plugin-svelte';

/** @type {import('@sveltejs/kit').Config} */
const config = {
  preprocess: vitePreprocess(),

  kit: {
  adapter: adapter({
      pages: 'build',
      asssets: 'build',
      fallback: '200.html',
      precompress: false,
      strict: true,
    }),
    paths: {
      base: process.argv.includes('dev') ? '' : '/projects/wasmbots'
    }
  },
};

export default config;
