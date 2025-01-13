import { execSync } from "node:child_process";
import fs from "node:fs";

import { chromium } from "playwright";

const fps = 60;
const secondsToCapture = 60;
const totalFrameCount = fps * secondsToCapture;
const numWidth = totalFrameCount.toString().length;

async function main() {
	console.log("Loading page...");
	const browser = await chromium.launch();
	const page = await browser.newPage();

	try {
		await page.setViewportSize({ width: 1280, height: 720 });
		await page.goto("http://localhost:5173/splash", {waitUntil: "networkidle"});

		const splash = await page.$('#splashContainer');
		if (!splash) {
			throw new Error('No splash container.');
		}

		await page.fill("#fpsTarget", fps.toString());
		for (let i = 0; i < totalFrameCount; i++) {
			console.log(`${(i / totalFrameCount * 100).toFixed(3)}% (${i} of ${totalFrameCount})`);
			await splash.screenshot({
				path: `./video-frames/${i.toString().padStart(numWidth, "0")}.png`,
			});
			await page.click("#tickButton");
		}
	} catch (err) {
		console.error(err);
	} finally {
		console.log("Closing browser...");
		await browser.close();
	}

	// -crf 0 gives highest quality but big file
	//    trying to find a happier medium that doesn't have as much banding in the gradient
	console.log("Stitching frames...");
	execSync(`ffmpeg \
		-framerate ${fps} \
		-i video-frames/%0${numWidth}d.png \
		-c:v libx264 \
		-preset veryslow \
		-crf 0 \
		-pix_fmt yuv420p \
		-movflags +faststart \
		-y \
		ManaForge.mp4`
	);

	console.log("Cleanup...");
	fs.rmSync("video-frames", {recursive: true, force: true});
}

main();
