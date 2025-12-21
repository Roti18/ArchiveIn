<script lang="ts">
	import { currentItems, selectItem, goBack, navigationPath } from '$lib/stores/archive-navigation';
	import { fade } from 'svelte/transition';
	import { quintOut } from 'svelte/easing';
	import type { ArchiveItem } from '$lib/types/archive';

	function handleItemClick(item: ArchiveItem) {
		selectItem(item);
	}
</script>

<div in:fade={{ duration: 600, easing: quintOut }} class="max-md:w-full">
	<!-- BACK + BREADCRUMB -->
	{#if $navigationPath.length > 0}
		<div class="mb-4">
			<button
				on:click={goBack}
				class="text-xs tracking-[0.35em] text-gray-400
				       transition-colors duration-300 hover:text-white
				       max-md:text-[0.7rem]"
			>
				← BACK
			</button>

			<div class="mt-2 text-xs text-gray-500">
				{['Archive', ...$navigationPath].join(' / ')}
			</div>
		</div>
	{/if}

	<!-- LIST -->
	<div class="flex flex-col">
		{#each $currentItems as item (item.id)}
			<button
				on:click={() => handleItemClick(item)}
				class="group grid grid-cols-[1fr_40px] gap-12
				       border-b border-white/8 py-4
				       transition-all duration-450 ease-in-out
				       hover:translate-x-1.5 hover:bg-gray-400/5
				       max-md:gap-4"
			>
				<div class="ml-5 text-left">
					<div class="text-base tracking-[0.08em] text-gray-100">
						{item.title}

						{#if item.semesterTitle}
							<div class="mt-1 text-xs tracking-widest text-gray-500">
								{item.semesterTitle}
							</div>
						{/if}

						{#if item.semesterDate}
							<div class="mt-1 text-xs tracking-widest text-gray-600">
								{item.semesterDate}
							</div>
						{/if}
					</div>
				</div>

				<div
					class="text-lg text-gray-400
					       transition-transform duration-450
					       group-hover:translate-x-1"
				>
					→
				</div>
			</button>
		{/each}
	</div>
</div>
