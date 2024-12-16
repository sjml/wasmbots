<script lang="ts">
	const internalMin = 0;
	const internalMax = 1000;

	interface Props {
		value: number;
		min: number;
		max: number;
		name: string;
		integral?: boolean; // if we're only working with integers (default true)
		precision?: number;  // if we're not integral, how many numbers after the decimal to show (default 2)
		sliderType?: "linear"|"logarithmic";
		// yes, "linear" is kind of silly because it's just re-implementing the default behavior
		//    of a ranged input but it lets me use the same component and styling for both.
	}
	let { value = $bindable(), min, max, name, integral = true, precision = 2, sliderType = "linear" }: Props = $props();

	function sliderToValue(n: number): number {
		if (sliderType == "logarithmic") {
			if (n == 0) return min;
			const vmin = min == 0 ? 0 : Math.log(min);
			const vmax = Math.log(max);

			const scale = (vmax - vmin) / (internalMax - internalMin);
			const val = Math.exp(vmin + scale * (n - internalMin));
			if (integral) {
				return Math.round(val);
			}
			return val;
		}
		else { // if (sliderType == "linear")
			const scale = (max - min) / (internalMax - internalMin);
			const val = min + scale * (n - internalMin);
			if (integral) {
				return Math.round(val);
			}
			return val;
		}
	}

	function valueToSlider(n: number): number {
		if (sliderType == "logarithmic") {
			if (n === 0) return min;
			const vmin = min == 0 ? 0 : Math.log(min);
			const vmax = Math.log(max);

			const scale = (vmax - vmin) / (internalMax - internalMin);
			const val = (Math.log(n) - vmin) / scale + internalMin;
			if (integral) {
				return Math.round(val);
			}
			return val;
		}
		else { // if (sliderType == "linear")
			const scale = (max - min) / (internalMax - internalMin);
			const val = (n - min) / scale + internalMin;
			if (integral) {
				return Math.round(val);
			}
			return val;
		}
	}

	function valToDisplay(val: number): string {
		return integral ? Math.floor(val).toString() : val.toFixed(precision);
	}

	let internalValue = $state(valueToSlider(value));
	let displayValue = $state(valToDisplay(value));
	function sliderChange() {
		value = sliderToValue(internalValue);
		displayValue = valToDisplay(value);
	}
</script>

<div class="logSlider">
	<div class="nameValue">
		<div class="name"><code>{name}</code></div>
		<div class="value">{displayValue}</div>
	</div>
	<input type="range"
		class="slider"
		bind:value={internalValue}
		min={internalMin}
		max={internalMax}
		oninput={sliderChange}
	>
</div>

<style>
	.logSlider {
		display: flex;
		justify-content: center;
		flex-direction: column;

		width: 100%;
	}

	.nameValue {
		display: flex;
		justify-content: space-between;
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
		text-align: right;
	}
</style>
