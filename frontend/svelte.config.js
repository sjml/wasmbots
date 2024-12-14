import adapter from '@sveltejs/adapter-static';
import { vitePreprocess } from '@sveltejs/vite-plugin-svelte';
import { mdsvex } from "mdsvex";

/** @type {import('@sveltejs/kit').Config} */
const config = {
	preprocess: [
		vitePreprocess(),
		mdsvex({
			extensions: ['.md', '.svx'],
			smartypants: {
				quotes: true,
				ellipses: true,
				backticks: false,
				dashes: 'oldschool',
			}
		}),
	],

	extensions: ['.svelte', '.md'],

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
		},
		alias: {
			"wasmbots": "../engine/src"
		}
	},
};

export default config;
