<script lang="ts">
	import { onMount } from 'svelte';

	interface TrailDot {
		x: number;
		y: number;
		id: number;
	}

	let trail: TrailDot[] = [];
	let idCounter = 0;

	onMount(() => {
		function handleMouseMove(e: MouseEvent) {
			const dot: TrailDot = {
				x: e.pageX,
				y: e.pageY,
				id: idCounter++
			};

			trail = [...trail, dot];

			if (trail.length > 8) {
				trail = trail.slice(1);
			}

			setTimeout(() => {
				trail = trail.filter((d) => d.id !== dot.id);
			}, 120);
		}

		document.addEventListener('mousemove', handleMouseMove);
		return () => document.removeEventListener('mousemove', handleMouseMove);
	});
</script>

{#each trail as dot (dot.id)}
	<div
		class="pointer-events-none fixed z-9999 h-0.5 w-0.5 rounded-full bg-gray-600 transition-opacity duration-120"
		style="left: {dot.x}px; top: {dot.y}px;"
	></div>
{/each}
