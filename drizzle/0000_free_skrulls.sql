CREATE TABLE `announcements` (
	`id` text PRIMARY KEY NOT NULL,
	`title` text NOT NULL,
	`content` text NOT NULL,
	`department_id` text,
	`publish_from` text NOT NULL,
	`publish_until` text,
	`priority` integer DEFAULT 0 NOT NULL,
	`status` text NOT NULL,
	`source_reference` text NOT NULL,
	FOREIGN KEY (`department_id`) REFERENCES `departments`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE TABLE `audit_logs` (
	`id` text PRIMARY KEY NOT NULL,
	`actor` text NOT NULL,
	`action` text NOT NULL,
	`entity_type` text NOT NULL,
	`entity_id` text NOT NULL,
	`before_summary` text,
	`after_summary` text,
	`created_at` text NOT NULL
);
--> statement-breakpoint
CREATE TABLE `backup_runs` (
	`id` text PRIMARY KEY NOT NULL,
	`job_name` text NOT NULL,
	`status` text NOT NULL,
	`started_at` text NOT NULL,
	`completed_at` text,
	`destination` text NOT NULL,
	`checksum_manifest` text,
	`error_summary` text
);
--> statement-breakpoint
CREATE TABLE `calendar_items` (
	`id` text PRIMARY KEY NOT NULL,
	`title` text NOT NULL,
	`description` text,
	`start_at` text NOT NULL,
	`end_at` text NOT NULL,
	`event_type` text NOT NULL,
	`department_id` text,
	`visibility` text NOT NULL,
	`source_reference` text NOT NULL,
	FOREIGN KEY (`department_id`) REFERENCES `departments`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE TABLE `categories` (
	`id` text PRIMARY KEY NOT NULL,
	`department_id` text NOT NULL,
	`name_th` text NOT NULL,
	`name_en` text NOT NULL,
	`slug` text NOT NULL,
	`is_active` integer DEFAULT true NOT NULL,
	FOREIGN KEY (`department_id`) REFERENCES `departments`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE UNIQUE INDEX `categories_slug_unique` ON `categories` (`slug`);--> statement-breakpoint
CREATE TABLE `contacts` (
	`id` text PRIMARY KEY NOT NULL,
	`department_id` text NOT NULL,
	`role_name` text NOT NULL,
	`display_name` text,
	`contact_method` text NOT NULL,
	`contact_reference` text NOT NULL,
	`responsibility` text NOT NULL,
	`is_active` integer DEFAULT true NOT NULL,
	FOREIGN KEY (`department_id`) REFERENCES `departments`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE TABLE `departments` (
	`id` text PRIMARY KEY NOT NULL,
	`code` text NOT NULL,
	`name_th` text NOT NULL,
	`name_en` text NOT NULL,
	`description` text,
	`is_active` integer DEFAULT true NOT NULL,
	`created_at` text NOT NULL,
	`updated_at` text NOT NULL
);
--> statement-breakpoint
CREATE UNIQUE INDEX `departments_code_unique` ON `departments` (`code`);--> statement-breakpoint
CREATE TABLE `documents` (
	`id` text PRIMARY KEY NOT NULL,
	`title` text NOT NULL,
	`description` text,
	`object_key` text NOT NULL,
	`original_filename` text NOT NULL,
	`mime_type` text NOT NULL,
	`size` integer NOT NULL,
	`checksum` text NOT NULL,
	`version` text NOT NULL,
	`department_id` text NOT NULL,
	`visibility` text NOT NULL,
	`status` text NOT NULL,
	`uploaded_by` text NOT NULL,
	`created_at` text NOT NULL,
	FOREIGN KEY (`department_id`) REFERENCES `departments`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE UNIQUE INDEX `documents_object_key_unique` ON `documents` (`object_key`);--> statement-breakpoint
CREATE TABLE `feedback` (
	`id` text PRIMARY KEY NOT NULL,
	`query_id` text NOT NULL,
	`rating` integer NOT NULL,
	`comment` text,
	`created_at` text NOT NULL,
	FOREIGN KEY (`query_id`) REFERENCES `queries`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE TABLE `knowledge_items` (
	`id` text PRIMARY KEY NOT NULL,
	`title_th` text NOT NULL,
	`title_en` text,
	`summary_th` text NOT NULL,
	`summary_en` text,
	`content_th` text NOT NULL,
	`content_en` text,
	`department_id` text NOT NULL,
	`category_id` text,
	`content_type` text NOT NULL,
	`status` text NOT NULL,
	`visibility` text NOT NULL,
	`owner_name` text NOT NULL,
	`owner_contact_reference` text,
	`effective_date` text,
	`review_date` text,
	`version` text NOT NULL,
	`source_type` text NOT NULL,
	`source_url` text,
	`source_document_id` text,
	`created_by` text NOT NULL,
	`reviewed_by` text,
	`approved_by` text,
	`created_at` text NOT NULL,
	`updated_at` text NOT NULL,
	`published_at` text,
	`archived_at` text,
	FOREIGN KEY (`department_id`) REFERENCES `departments`(`id`) ON UPDATE no action ON DELETE no action,
	FOREIGN KEY (`category_id`) REFERENCES `categories`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE TABLE `knowledge_keywords` (
	`knowledge_id` text NOT NULL,
	`keyword` text NOT NULL,
	`normalized_keyword` text NOT NULL,
	`language` text NOT NULL,
	PRIMARY KEY(`knowledge_id`, `normalized_keyword`),
	FOREIGN KEY (`knowledge_id`) REFERENCES `knowledge_items`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE TABLE `knowledge_synonyms` (
	`source_term` text NOT NULL,
	`target_term` text NOT NULL,
	`department_id` text,
	`priority` integer DEFAULT 0 NOT NULL,
	PRIMARY KEY(`source_term`, `target_term`),
	FOREIGN KEY (`department_id`) REFERENCES `departments`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE TABLE `queries` (
	`id` text PRIMARY KEY NOT NULL,
	`user_reference` text,
	`normalized_query` text NOT NULL,
	`department_filter` text,
	`result_count` integer NOT NULL,
	`selected_result_id` text,
	`was_helpful` integer,
	`created_at` text NOT NULL
);
--> statement-breakpoint
CREATE TABLE `unanswered_queries` (
	`id` text PRIMARY KEY NOT NULL,
	`query_text` text NOT NULL,
	`normalized_query` text NOT NULL,
	`frequency` integer DEFAULT 1 NOT NULL,
	`suggested_department` text,
	`status` text NOT NULL,
	`assigned_to` text,
	`resolution_knowledge_id` text,
	`first_seen_at` text NOT NULL,
	`last_seen_at` text NOT NULL
);
