CREATE TABLE `academic_item` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`mata_kuliah_id` integer NOT NULL,
	`type` text NOT NULL,
	`title` text NOT NULL,
	`hero_image_webp_url` text,
	`hero_image_original_url` text,
	`hero_image_file_id` text,
	`hero_image_google_id` text,
	FOREIGN KEY (`mata_kuliah_id`) REFERENCES `mata_kuliah`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE TABLE `academic_item_block` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`item_id` integer NOT NULL,
	`type` text NOT NULL,
	`content` text,
	`image_webp_url` text,
	`image_original_url` text,
	`image_file_id` text,
	`image_google_id` text,
	`caption` text,
	`width` text,
	`order` integer NOT NULL,
	FOREIGN KEY (`item_id`) REFERENCES `academic_item`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE TABLE `academic_item_link` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`item_id` integer NOT NULL,
	`title` text NOT NULL,
	`url` text NOT NULL,
	`platform` text,
	`order` integer DEFAULT 0 NOT NULL,
	FOREIGN KEY (`item_id`) REFERENCES `academic_item`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE TABLE `asprak` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`name` text NOT NULL,
	`mata_kuliah_id` integer NOT NULL,
	FOREIGN KEY (`mata_kuliah_id`) REFERENCES `mata_kuliah`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE TABLE `gallery_group` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`title` text NOT NULL,
	`description` text
);
--> statement-breakpoint
CREATE TABLE `gallery_item` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`group_id` integer,
	`title` text NOT NULL,
	`description` text,
	`image_webp_url` text NOT NULL,
	`image_original_url` text NOT NULL,
	`imagekit_file_id` text,
	`google_drive_file_id` text,
	`date` text NOT NULL,
	`created_at` integer,
	`updated_at` integer,
	FOREIGN KEY (`group_id`) REFERENCES `gallery_group`(`id`) ON UPDATE no action ON DELETE set null
);
--> statement-breakpoint
CREATE TABLE `mata_kuliah` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`semester_id` integer NOT NULL,
	`name` text NOT NULL,
	`code` text,
	`dosen` text NOT NULL,
	`jam` text NOT NULL,
	FOREIGN KEY (`semester_id`) REFERENCES `semester`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE TABLE `praktikum` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`mata_kuliah_id` integer NOT NULL,
	`title` text NOT NULL,
	`asprak` text,
	FOREIGN KEY (`mata_kuliah_id`) REFERENCES `mata_kuliah`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE TABLE `praktikum_item` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`praktikum_id` integer NOT NULL,
	`type` text NOT NULL,
	`title` text NOT NULL,
	`hero_image_webp_url` text,
	`hero_image_original_url` text,
	`hero_image_file_id` text,
	`hero_image_google_id` text,
	FOREIGN KEY (`praktikum_id`) REFERENCES `praktikum`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE TABLE `praktikum_item_block` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`item_id` integer NOT NULL,
	`type` text NOT NULL,
	`content` text,
	`image_webp_url` text,
	`image_original_url` text,
	`image_file_id` text,
	`image_google_id` text,
	`caption` text,
	`width` text,
	`order` integer NOT NULL,
	FOREIGN KEY (`item_id`) REFERENCES `praktikum_item`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE TABLE `praktikum_item_link` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`item_id` integer NOT NULL,
	`title` text NOT NULL,
	`url` text NOT NULL,
	`platform` text,
	`order` integer DEFAULT 0 NOT NULL,
	FOREIGN KEY (`item_id`) REFERENCES `praktikum_item`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE TABLE `semester` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`name` text NOT NULL,
	`start_year` integer NOT NULL,
	`end_year` integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE `session` (
	`id` text PRIMARY KEY NOT NULL,
	`user_id` text NOT NULL,
	`expires_at` integer NOT NULL,
	FOREIGN KEY (`user_id`) REFERENCES `user`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE TABLE `user` (
	`id` text PRIMARY KEY NOT NULL,
	`email` text NOT NULL,
	`name` text,
	`avatar` text,
	`google_id` text,
	`role` text DEFAULT 'user' NOT NULL,
	`created_at` integer
);
--> statement-breakpoint
CREATE UNIQUE INDEX `user_email_unique` ON `user` (`email`);--> statement-breakpoint
CREATE UNIQUE INDEX `user_google_id_unique` ON `user` (`google_id`);