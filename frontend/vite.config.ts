import { sveltekit } from '@sveltejs/kit/vite';
import { defineConfig } from 'vite';

export default defineConfig({
	plugins: [sveltekit()],
	resolve: {
		preserveSymlinks: true
	},
	server: {
		fs: {
			allow: ['../engine']
		}
	},
	build: {
		// TODO: make custom Phaser build to slim this down
		chunkSizeWarningLimit: 2000,
	},
	define: {
		'__RSC_PATH__': process.argv.includes('dev') ? `'/rsc'` : `'/projects/wasmbots/rsc'`,
		'__IIFE_BUILD__': 'false',
	}
});
