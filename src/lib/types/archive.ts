export interface ArchiveItem {
	id: string;
	title?: string;
	semesterTitle?: string;
	semesterDate?: string;
	children?: ArchiveItem[];
	description?: string;
	documentation?: DocumentationItem[];
}

export interface DocumentationItem {
	image: string;
	caption: string;
	subtitle: string;
}