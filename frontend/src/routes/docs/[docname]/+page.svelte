<script lang="ts">
	let { data } = $props();
</script>

<h1>Testing Data Flow</h1>

This document exists? — ({data.exists})

<div class="contents">
	{data.contents}
</div>
