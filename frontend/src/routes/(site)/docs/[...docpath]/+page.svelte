<script lang="ts">
	import { base } from "$app/paths";

	let { data } = $props();
</script>

<div class="documentation">
	<div class="githubLink">
		<a href={data.githubPath} class="external github" target="_blank">
			<img src="{base}/img/github.svg" alt="GitHub Logo">Edit this file on GitHub
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

	.githubLink img {
		width: 20px;
		margin-right: 5px;
	}

	.documentation .contents :global {
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

		img, video, iframe {
			max-width: 95%;
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
