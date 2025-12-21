import { db } from '$lib/server/db';
import type { SemesterForArchive, MataKuliahForArchive } from '$lib/types/academic';
import type { ArchiveItem } from '$lib/types/archive';

export async function getArchiveOverview(): Promise<SemesterForArchive[]> {
	return db.query.semester.findMany({
		with: {
			mataKuliahs: {
				columns: {
					id: true,
					name: true
				}
			}
		}
	});
}

function transformMataKuliahToArchiveItem(mk: MataKuliahForArchive): ArchiveItem {
	return {
		id: mk.id.toString(),
		title: mk.name,
		children: [] // Children can be added here if there are any
	};
}

function transformSemestersToArchiveItems(semesters: SemesterForArchive[]): ArchiveItem[] {
	return semesters.map((semester) => ({
		id: semester.id.toString(),
		semesterTitle: semester.name,
		semesterDate: `${semester.startYear} — ${semester.endYear}`,
		children: semester.mataKuliahs.map(transformMataKuliahToArchiveItem)
	}));
}

export async function getArchiveTree(): Promise<ArchiveItem[]> {
	const overview = await getArchiveOverview();
	return transformSemestersToArchiveItems(overview);
}
