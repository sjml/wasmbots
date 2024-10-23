import { sveltekit } from '@sveltejs/kit/vite';
import { defineConfig } from 'vite';

export default defineConfig({
	plugins: [sveltekit()],
    server: {
        fs: {
            allow: ['../engine']
        }
    },
    build: {
        chunkSizeWarningLimit: 1500,
    },
    define: {
        '__APP_BASE_PATH__': process.argv.includes('dev') ? `''` : `'/projects/wasmbots'`
    }
});
