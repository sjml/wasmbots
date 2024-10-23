<script lang="ts">

</script>

<nav>
    <slot/>
</nav>

<style>
    nav {
        position: sticky;
        top: 0;
        background-color: rgb(37, 37, 37);
        display: flex;
        justify-content: space-between;
        padding: 5px;

        z-index: 20;
    }
</style>
