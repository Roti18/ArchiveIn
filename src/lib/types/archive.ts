export interface ArchiveItem {
	id: string;
	title?: string;
	semesterTitle?: string;
	semesterStartYear?: number;
	semesterEndYear?: number;
	children?: ArchiveItem[];
	description?: string;
	documentation?: DocumentationItem[];
}

export interface DocumentationItem {
	image: string;
	caption: string;
	subtitle: string;
}