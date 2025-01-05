<script lang="ts">
	let { data } = $props();
</script>

<div class="documentation">
	<div class="githubLink">
		<a href={data.githubPath} class="external github" target="_blank">
			<svg fill="currentColor" viewBox="0 0 98 96" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M48.854 0C21.839 0 0 22 0 49.217c0 21.756 13.993 40.172 33.405 46.69 2.427.49 3.316-1.059 3.316-2.362 0-1.141-.08-5.052-.08-9.127-13.59 2.934-16.42-5.867-16.42-5.867-2.184-5.704-5.42-7.17-5.42-7.17-4.448-3.015.324-3.015.324-3.015 4.934.326 7.523 5.052 7.523 5.052 4.367 7.496 11.404 5.378 14.235 4.074.404-3.178 1.699-5.378 3.074-6.6-10.839-1.141-22.243-5.378-22.243-24.283 0-5.378 1.94-9.778 5.014-13.2-.485-1.222-2.184-6.275.486-13.038 0 0 4.125-1.304 13.426 5.052a46.97 46.97 0 0 1 12.214-1.63c4.125 0 8.33.571 12.213 1.63 9.302-6.356 13.427-5.052 13.427-5.052 2.67 6.763.97 11.816.485 13.038 3.155 3.422 5.015 7.822 5.015 13.2 0 18.905-11.404 23.06-22.324 24.283 1.78 1.548 3.316 4.481 3.316 9.126 0 6.6-.08 11.897-.08 13.526 0 1.304.89 2.853 3.316 2.364 19.412-6.52 33.405-24.935 33.405-46.691C97.707 22 75.788 0 48.854 0z"/></svg>Edit this file on GitHub
		</a>
	</div>

	<div class="contents">
		{@html data.content}
	</div>
</div>

<style>
	.githubLink {
		padding-top: 15px;
		opacity: 0.5;
		width: 100%;
		font-size: 85%;
	}

	.githubLink a {
		display: flex;
		flex-direction: row;
		justify-content: flex-end;
	}

	.githubLink svg {
		width: 20px;
		color: white;
		text-decoration: none;
		margin-right: 5px;
	}

	.documentation :global {
		h1 a.header-anchor {
			display: none;
		}

		h2, h3 {
			margin-top: 35px;
			margin-bottom: 0;
		}
		h4, h5, h6 {
			margin-top: 20px;
			margin-bottom: 0;
		}

		h2 + p,
		h3 + p,
		h4 + p,
		h5 + p,
		h6 + p {
			margin-top: 10px;
		}


		h1 a.header-anchor,
		h2 a.header-anchor,
		h3 a.header-anchor,
		h4 a.header-anchor,
		h5 a.header-anchor,
		h6 a.header-anchor {
			margin-left: 8px;
			opacity: 0;
			pointer-events: none;
			text-decoration: none;
			transition-property: opacity;
			transition-duration: 100ms;
		}

		h1:hover a.header-anchor,
		h2:hover a.header-anchor,
		h3:hover a.header-anchor,
		h4:hover a.header-anchor,
		h5:hover a.header-anchor,
		h6:hover a.header-anchor {
			opacity: 1;
			pointer-events: all;
		}

		code {
			background-color: #565656;
			padding: 2px 5px;
			border-radius: 5px;
		}

		li {
			margin-top: 10px;
		}

		img {
			max-width: 100%;
			display: block;
			margin: 10px auto;
		}

		/* little external link indicator; got it working but it's kinda distracting */
		/* a.external::after {
			content: "";
			mask: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='currentColor' viewBox='0 0 256 256'%3E%3Cpath d='M228,104a12,12,0,0,1-24,0V69l-59.51,59.51a12,12,0,0,1-17-17L187,52H152a12,12,0,0,1,0-24h64a12,12,0,0,1,12,12Zm-44,24a12,12,0,0,0-12,12v64H52V84h64a12,12,0,0,0,0-24H48A20,20,0,0,0,28,80V208a20,20,0,0,0,20,20H176a20,20,0,0,0,20-20V140A12,12,0,0,0,184,128Z'%3E%3C/path%3E%3C/svg%3E") no-repeat center;
			mask-size: contain;
			margin-left: 3px;
			width: 15px;
			height: 15px;
			background-color: currentColor;
			display: inline-block;
		} */
	}
</style>
