export const prerender = true;
export const ssr = false;
export const trailingSlash = "always";
import "../app.css";

import { redirect } from '@sveltejs/kit';

export async function load({ url }) {
	if (url.pathname == "/") {
		redirect(307, '/app/');
	}
}
