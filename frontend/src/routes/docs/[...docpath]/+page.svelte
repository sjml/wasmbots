<script lang="ts">
	let { data } = $props();
</script>

<div class="path">
	{data.fpath}
</div>

<div class="contents">
	{@html data.content}
</div>
