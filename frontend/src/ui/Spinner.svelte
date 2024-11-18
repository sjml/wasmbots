<script lang="ts">

</script>

<div class="spinnerContainer">
	<div class="lds-hourglass"></div>
</div>

<style>
	.spinnerContainer {
		position: absolute;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background-color: black;
		color: white;
		opacity: 0.5;

		display: flex;
		justify-content: center;
		align-items: center;
		z-index: 512;
	}

	.lds-hourglass,
	.lds-hourglass:after {
		box-sizing: border-box;
	}
	.lds-hourglass {
		display: inline-block;
		position: relative;
	}
	.lds-hourglass:after {
		content: " ";
		display: block;
		border-radius: 50%;
		width: 0;
		height: 0;
		box-sizing: border-box;
		border: 28px solid currentColor;
		border-color: currentColor transparent currentColor transparent;
		animation: lds-hourglass 2.2s infinite;
	}
	@keyframes lds-hourglass {
		0% {
			transform: rotate(0);
			animation-timing-function: cubic-bezier(0.55, 0.055, 0.675, 0.19);
		}
		50% {
			transform: rotate(900deg);
			animation-timing-function: cubic-bezier(0.215, 0.61, 0.355, 1);
		}
		100% {
			transform: rotate(1800deg);
		}
	}
</style>
