<script lang="ts">
	const internalMin = 0;
	const internalMax = 1000;

	interface Props {
		value: number;
		min: number;
		max: number;
		name: string;
	}
	let { value = $bindable(), min, max, name }: Props = $props();

	function sliderToValue(n: number): number {
		if (n == 0) return min;
		const vmin = min == 0 ? 0 : Math.log(min);
		const vmax = Math.log(max);

		const scale = (vmax - vmin) / (internalMax - internalMin);
		return Math.round(Math.exp(vmin + scale * (n - internalMin)));
	}

	function valueToSlider(n: number) {
		if (n === 0) return min;
		const minv = min == 0 ? 0 : Math.log(min);
		const maxv = Math.log(max);

		const scale = (maxv - minv) / (internalMax - internalMin);
		return Math.round((Math.log(n) - minv) / scale + internalMin);
	}

	let internalValue = $state(valueToSlider(value));
	function sliderChange() {
		value = sliderToValue(internalValue);
		console.log("setting value:", value, "from", internalValue);
	}
</script>

<div class="logSlider">
	<div class="name"><code>{name}</code></div>
	<input type="range"
		class="slider"
		bind:value={internalValue}
		min={internalMin}
		max={internalMax}
		oninput={sliderChange}
	>
	<div class="value">{value}</div>
</div>

<style>
	.logSlider {
		display: flex;
		justify-content: center;

		width: 100%;
	}

	.logSlider input {
		display: block;
	}

	.name {
		margin-right: 20px;
		display: flex;
		align-items: center;
		font-size: large;
	}

	.value {
		display: flex;
		align-items: center;
		min-width: 4em;
		margin-left: 10px;
	}
</style>
