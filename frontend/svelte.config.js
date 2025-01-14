import process from 'node:process';
import adapter from '@sveltejs/adapter-static';
import { vitePreprocess } from '@sveltejs/vite-plugin-svelte';

const projectBase = process.env['WASMBOTS_BASE'] ?? '/projects/wasmbots';

/** @type {import('@sveltejs/kit').Config} */
const config = {
	preprocess: [
		vitePreprocess(),
	],

	extensions: ['.svelte'],

	kit: {
		adapter: adapter({
			pages: 'build',
			asssets: 'build',
			fallback: '200.html',
			precompress: false,
			strict: true,
		}),
		paths: {
			base: process.argv.includes('dev') ? '' : projectBase
		},
		alias: {
			"wasmbots": "../engine/src"
		}
	},
};

export default config;
