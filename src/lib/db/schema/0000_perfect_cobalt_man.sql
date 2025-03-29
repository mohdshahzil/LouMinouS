-- Current sql file was generated after introspecting the database
-- If you want to run this migration please uncomment this code before executing migrations
/*
CREATE TYPE "public"."enum__courses_v_version_status" AS ENUM('draft', 'published');--> statement-breakpoint
CREATE TYPE "public"."enum__lessons_v_version_assignment_allowed_file_types" AS ENUM('pdf', 'doc', 'image', 'zip', 'code');--> statement-breakpoint
CREATE TYPE "public"."enum__lessons_v_version_quiz_questions_type" AS ENUM('multiple', 'boolean', 'text');--> statement-breakpoint
CREATE TYPE "public"."enum__lessons_v_version_quiz_settings_show_correct_answers" AS ENUM('never', 'after_each', 'after_submit', 'after_all');--> statement-breakpoint
CREATE TYPE "public"."enum__lessons_v_version_status" AS ENUM('draft', 'published');--> statement-breakpoint
CREATE TYPE "public"."enum__lessons_v_version_type" AS ENUM('video', 'reading', 'quiz', 'assignment', 'discussion');--> statement-breakpoint
CREATE TYPE "public"."enum__modules_v_version_completion_criteria_type" AS ENUM('all_lessons', 'min_score', 'custom');--> statement-breakpoint
CREATE TYPE "public"."enum__modules_v_version_status" AS ENUM('draft', 'published');--> statement-breakpoint
CREATE TYPE "public"."enum_achievements_criteria_metric" AS ENUM('count', 'score', 'duration', 'custom');--> statement-breakpoint
CREATE TYPE "public"."enum_achievements_criteria_timeframe" AS ENUM('all_time', 'daily', 'weekly', 'monthly');--> statement-breakpoint
CREATE TYPE "public"."enum_achievements_type" AS ENUM('course_progress', 'quiz_score', 'assignment', 'streak', 'discussion', 'custom');--> statement-breakpoint
CREATE TYPE "public"."enum_badges_category" AS ENUM('progress', 'performance', 'engagement', 'special');--> statement-breakpoint
CREATE TYPE "public"."enum_badges_rarity" AS ENUM('common', 'uncommon', 'rare', 'epic', 'legendary');--> statement-breakpoint
CREATE TYPE "public"."enum_courses_status" AS ENUM('draft', 'published');--> statement-breakpoint
CREATE TYPE "public"."enum_enrollments_status" AS ENUM('active', 'completed', 'dropped', 'pending');--> statement-breakpoint
CREATE TYPE "public"."enum_leaderboards_scope_achievement_type" AS ENUM('all', 'course', 'quiz', 'streak');--> statement-breakpoint
CREATE TYPE "public"."enum_leaderboards_scope_point_type" AS ENUM('all', 'lesson', 'quiz', 'assignment');--> statement-breakpoint
CREATE TYPE "public"."enum_leaderboards_timeframe" AS ENUM('all_time', 'daily', 'weekly', 'monthly');--> statement-breakpoint
CREATE TYPE "public"."enum_leaderboards_type" AS ENUM('points', 'progress', 'achievements', 'custom');--> statement-breakpoint
CREATE TYPE "public"."enum_lessons_assignment_allowed_file_types" AS ENUM('pdf', 'doc', 'image', 'zip', 'code');--> statement-breakpoint
CREATE TYPE "public"."enum_lessons_quiz_questions_type" AS ENUM('multiple', 'boolean', 'text');--> statement-breakpoint
CREATE TYPE "public"."enum_lessons_quiz_settings_show_correct_answers" AS ENUM('never', 'after_each', 'after_submit', 'after_all');--> statement-breakpoint
CREATE TYPE "public"."enum_lessons_status" AS ENUM('draft', 'published');--> statement-breakpoint
CREATE TYPE "public"."enum_lessons_type" AS ENUM('video', 'reading', 'quiz', 'assignment', 'discussion');--> statement-breakpoint
CREATE TYPE "public"."enum_levels_rewards_type" AS ENUM('badge', 'feature', 'custom');--> statement-breakpoint
CREATE TYPE "public"."enum_modules_completion_criteria_type" AS ENUM('all_lessons', 'min_score', 'custom');--> statement-breakpoint
CREATE TYPE "public"."enum_modules_status" AS ENUM('draft', 'published');--> statement-breakpoint
CREATE TYPE "public"."enum_points_source_type" AS ENUM('lessons', 'achievements', 'streaks');--> statement-breakpoint
CREATE TYPE "public"."enum_points_type" AS ENUM('lesson_complete', 'quiz_score', 'assignment_submit', 'discussion_post', 'streak_bonus', 'achievement_unlock');--> statement-breakpoint
CREATE TYPE "public"."enum_progress_module_progress_status" AS ENUM('not_started', 'in_progress', 'completed');--> statement-breakpoint
CREATE TYPE "public"."enum_progress_status" AS ENUM('not_started', 'in_progress', 'completed');--> statement-breakpoint
CREATE TYPE "public"."enum_streaks_type" AS ENUM('login', 'progress', 'quiz', 'assignment');--> statement-breakpoint
CREATE TYPE "public"."enum_student_settings_preferences_theme" AS ENUM('light', 'dark', 'system');--> statement-breakpoint
CREATE TYPE "public"."enum_tenants_plan" AS ENUM('basic', 'pro', 'enterprise');--> statement-breakpoint
CREATE TYPE "public"."enum_tenants_settings_theme" AS ENUM('light', 'dark', 'system');--> statement-breakpoint
CREATE TYPE "public"."enum_tenants_status" AS ENUM('active', 'suspended', 'pending');--> statement-breakpoint
CREATE TYPE "public"."enum_users_role" AS ENUM('admin', 'instructor', 'student');--> statement-breakpoint
CREATE TABLE "payload_migrations" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" varchar,
	"batch" numeric,
	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "media" (
	"id" serial PRIMARY KEY NOT NULL,
	"tenant_id" integer,
	"is_global" boolean DEFAULT false,
	"alt" varchar,
	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"url" varchar,
	"thumbnail_u_r_l" varchar,
	"filename" varchar,
	"mime_type" varchar,
	"filesize" numeric,
	"width" numeric,
	"height" numeric,
	"focal_x" numeric,
	"focal_y" numeric,
	"sizes_thumbnail_url" varchar,
	"sizes_thumbnail_width" numeric,
	"sizes_thumbnail_height" numeric,
	"sizes_thumbnail_mime_type" varchar,
	"sizes_thumbnail_filesize" numeric,
	"sizes_thumbnail_filename" varchar,
	"sizes_card_url" varchar,
	"sizes_card_width" numeric,
	"sizes_card_height" numeric,
	"sizes_card_mime_type" varchar,
	"sizes_card_filesize" numeric,
	"sizes_card_filename" varchar
);
--> statement-breakpoint
CREATE TABLE "tenants" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" varchar NOT NULL,
	"slug" varchar NOT NULL,
	"domain" varchar,
	"status" "enum_tenants_status" DEFAULT 'active' NOT NULL,
	"plan" "enum_tenants_plan" DEFAULT 'basic' NOT NULL,
	"subscription_start_date" timestamp(3) with time zone,
	"subscription_renewal_date" timestamp(3) with time zone,
	"subscription_stripe_customer_id" varchar,
	"settings_theme" "enum_tenants_settings_theme" DEFAULT 'system',
	"settings_logo_id" integer,
	"settings_colors_primary" varchar DEFAULT '#000000',
	"settings_colors_secondary" varchar DEFAULT '#ffffff',
	"features_gamification" boolean DEFAULT true,
	"features_adaptive_learning" boolean DEFAULT false,
	"features_analytics" boolean DEFAULT true,
	"features_api" boolean DEFAULT false,
	"analytics_total_users" numeric,
	"analytics_total_courses" numeric,
	"analytics_storage_used" numeric,
	"analytics_last_activity_at" timestamp(3) with time zone,
	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "users" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" varchar NOT NULL,
	"avatar_id" integer,
	"role" "enum_users_role" DEFAULT 'student' NOT NULL,
	"tenant_id" integer,
	"settings_id" integer,
	"last_active" timestamp(3) with time zone,
	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"enable_a_p_i_key" boolean,
	"api_key" varchar,
	"api_key_index" varchar,
	"email" varchar NOT NULL,
	"reset_password_token" varchar,
	"reset_password_expiration" timestamp(3) with time zone,
	"salt" varchar,
	"hash" varchar,
	"login_attempts" numeric DEFAULT '0',
	"lock_until" timestamp(3) with time zone
);
--> statement-breakpoint
CREATE TABLE "student_settings" (
	"id" serial PRIMARY KEY NOT NULL,
	"user_id" integer NOT NULL,
	"preferences_theme" "enum_student_settings_preferences_theme" DEFAULT 'system',
	"preferences_email_notifications_assignments" boolean DEFAULT true,
	"preferences_email_notifications_course_updates" boolean DEFAULT true,
	"preferences_email_notifications_achievements" boolean DEFAULT true,
	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "modules" (
	"id" serial PRIMARY KEY NOT NULL,
	"title" varchar,
	"description" jsonb,
	"course_id" integer,
	"order" numeric,
	"duration_hours" numeric DEFAULT '0',
	"duration_minutes" numeric DEFAULT '0',
	"status" "enum_modules_status" DEFAULT 'draft',
	"completion_criteria_type" "enum_modules_completion_criteria_type" DEFAULT 'all_lessons',
	"completion_criteria_minimum_score" numeric,
	"completion_criteria_custom_rule" varchar,
	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"_status" "enum_modules_status" DEFAULT 'draft'
);
--> statement-breakpoint
CREATE TABLE "progress_module_progress" (
	"_order" integer NOT NULL,
	"_parent_id" integer NOT NULL,
	"id" varchar PRIMARY KEY NOT NULL,
	"module_id" integer NOT NULL,
	"status" "enum_progress_module_progress_status" NOT NULL,
	"progress" numeric NOT NULL
);
--> statement-breakpoint
CREATE TABLE "progress" (
	"id" serial PRIMARY KEY NOT NULL,
	"student_id" integer NOT NULL,
	"course_id" integer NOT NULL,
	"status" "enum_progress_status" DEFAULT 'not_started' NOT NULL,
	"overall_progress" numeric DEFAULT '0' NOT NULL,
	"points_earned" numeric DEFAULT '0' NOT NULL,
	"total_points" numeric DEFAULT '0' NOT NULL,
	"is_global" boolean DEFAULT false,
	"started_at" timestamp(3) with time zone NOT NULL,
	"completed_at" timestamp(3) with time zone,
	"last_accessed" timestamp(3) with time zone NOT NULL,
	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "lessons" (
	"id" serial PRIMARY KEY NOT NULL,
	"title" varchar,
	"module_id" integer,
	"order" numeric,
	"type" "enum_lessons_type",
	"description" jsonb,
	"video_url" varchar,
	"video_duration" numeric,
	"video_transcript" varchar,
	"content" jsonb,
	"quiz_settings_time_limit" numeric,
	"quiz_settings_attempts" numeric DEFAULT '1',
	"quiz_settings_passing_score" numeric DEFAULT '70',
	"quiz_settings_randomize_questions" boolean DEFAULT false,
	"quiz_settings_show_correct_answers" "enum_lessons_quiz_settings_show_correct_answers" DEFAULT 'after_submit',
	"assignment_instructions" jsonb,
	"assignment_due_date" timestamp(3) with time zone,
	"assignment_points" numeric,
	"discussion_prompt" jsonb,
	"discussion_settings_require_response" boolean DEFAULT true,
	"discussion_settings_require_replies" numeric DEFAULT '2',
	"discussion_settings_minimum_words" numeric,
	"discussion_settings_due_date" timestamp(3) with time zone,
	"status" "enum_lessons_status" DEFAULT 'draft',
	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"_status" "enum_lessons_status" DEFAULT 'draft'
);
--> statement-breakpoint
CREATE TABLE "progress_quiz_attempts" (
	"_order" integer NOT NULL,
	"_parent_id" integer NOT NULL,
	"id" varchar PRIMARY KEY NOT NULL,
	"lesson_id" integer,
	"score" numeric NOT NULL,
	"completed_at" timestamp(3) with time zone NOT NULL
);
--> statement-breakpoint
CREATE TABLE "progress_discussions" (
	"_order" integer NOT NULL,
	"_parent_id" integer NOT NULL,
	"id" varchar PRIMARY KEY NOT NULL,
	"lesson_id" integer,
	"participated_at" timestamp(3) with time zone NOT NULL
);
--> statement-breakpoint
CREATE TABLE "courses" (
	"id" serial PRIMARY KEY NOT NULL,
	"title" varchar,
	"slug" varchar,
	"tenant_id" integer,
	"is_global" boolean DEFAULT false,
	"instructor_id" integer,
	"description" jsonb,
	"thumbnail_id" integer,
	"duration_hours" numeric,
	"duration_minutes" numeric,
	"schedule_start_date" timestamp(3) with time zone,
	"schedule_end_date" timestamp(3) with time zone,
	"schedule_enrollment_deadline" timestamp(3) with time zone,
	"status" "enum_courses_status" DEFAULT 'draft',
	"settings_allow_late_submissions" boolean DEFAULT true,
	"settings_require_prerequisites" boolean DEFAULT true,
	"settings_show_progress" boolean DEFAULT true,
	"enrollment_capacity" numeric,
	"enrollment_allow_self_enrollment" boolean DEFAULT true,
	"enrollment_require_prerequisite_completion" boolean DEFAULT true,
	"enrollment_enrollment_start" timestamp(3) with time zone,
	"enrollment_enrollment_end" timestamp(3) with time zone,
	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"_status" "enum_courses_status" DEFAULT 'draft'
);
--> statement-breakpoint
CREATE TABLE "points" (
	"id" serial PRIMARY KEY NOT NULL,
	"student_id" integer NOT NULL,
	"type" "enum_points_type" NOT NULL,
	"amount" numeric NOT NULL,
	"source_type" "enum_points_source_type" NOT NULL,
	"source_lesson_id" integer,
	"source_achievement_id" integer,
	"source_streak_id" integer,
	"metadata" jsonb,
	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "achievements" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" varchar NOT NULL,
	"tenant_id" integer,
	"description" varchar NOT NULL,
	"type" "enum_achievements_type" NOT NULL,
	"criteria_metric" "enum_achievements_criteria_metric" NOT NULL,
	"criteria_threshold" numeric NOT NULL,
	"criteria_timeframe" "enum_achievements_criteria_timeframe" DEFAULT 'all_time',
	"criteria_custom_rule" varchar,
	"badge_id" integer NOT NULL,
	"points" numeric NOT NULL,
	"secret" boolean DEFAULT false,
	"is_global" boolean DEFAULT false,
	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "streaks" (
	"id" serial PRIMARY KEY NOT NULL,
	"student_id" integer NOT NULL,
	"type" "enum_streaks_type" NOT NULL,
	"current_streak" numeric DEFAULT '0' NOT NULL,
	"longest_streak" numeric DEFAULT '0' NOT NULL,
	"last_activity" timestamp(3) with time zone NOT NULL,
	"next_required" timestamp(3) with time zone NOT NULL,
	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "badges" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" varchar NOT NULL,
	"description" varchar NOT NULL,
	"icon_id" integer NOT NULL,
	"rarity" "enum_badges_rarity" NOT NULL,
	"category" "enum_badges_category" NOT NULL,
	"tenant_id" integer,
	"is_global" boolean DEFAULT false,
	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "levels_rewards" (
	"_order" integer NOT NULL,
	"_parent_id" integer NOT NULL,
	"id" varchar PRIMARY KEY NOT NULL,
	"type" "enum_levels_rewards_type" NOT NULL,
	"badge_id" integer,
	"feature" varchar,
	"custom_data" jsonb
);
--> statement-breakpoint
CREATE TABLE "levels" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" varchar NOT NULL,
	"level" numeric NOT NULL,
	"description" varchar,
	"points_required" numeric NOT NULL,
	"tenant_id" integer,
	"is_global" boolean DEFAULT false,
	"icon_id" integer NOT NULL,
	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "streaks_history" (
	"_order" integer NOT NULL,
	"_parent_id" integer NOT NULL,
	"id" varchar PRIMARY KEY NOT NULL,
	"date" timestamp(3) with time zone NOT NULL,
	"points" numeric NOT NULL
);
--> statement-breakpoint
CREATE TABLE "streaks_rels" (
	"id" serial PRIMARY KEY NOT NULL,
	"order" integer,
	"parent_id" integer NOT NULL,
	"path" varchar NOT NULL,
	"courses_id" integer,
	"lessons_id" integer,
	"modules_id" integer
);
--> statement-breakpoint
CREATE TABLE "leaderboards" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" varchar NOT NULL,
	"tenant_id" integer,
	"is_global" boolean DEFAULT false,
	"type" "enum_leaderboards_type" NOT NULL,
	"timeframe" "enum_leaderboards_timeframe" NOT NULL,
	"scope_course_id" integer,
	"scope_point_type" "enum_leaderboards_scope_point_type" DEFAULT 'all',
	"scope_achievement_type" "enum_leaderboards_scope_achievement_type" DEFAULT 'all',
	"custom_logic" varchar,
	"display_limit" numeric DEFAULT '10' NOT NULL,
	"refresh_interval" numeric DEFAULT '3600' NOT NULL,
	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "enrollments" (
	"id" serial PRIMARY KEY NOT NULL,
	"student_id" integer NOT NULL,
	"course_id" integer NOT NULL,
	"status" "enum_enrollments_status" DEFAULT 'active' NOT NULL,
	"enrolled_at" timestamp(3) with time zone NOT NULL,
	"started_at" timestamp(3) with time zone,
	"completed_at" timestamp(3) with time zone,
	"dropped_at" timestamp(3) with time zone,
	"expires_at" timestamp(3) with time zone,
	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "courses_rels" (
	"id" serial PRIMARY KEY NOT NULL,
	"order" integer,
	"parent_id" integer NOT NULL,
	"path" varchar NOT NULL,
	"modules_id" integer,
	"courses_id" integer
);
--> statement-breakpoint
CREATE TABLE "_courses_v" (
	"id" serial PRIMARY KEY NOT NULL,
	"parent_id" integer,
	"version_title" varchar,
	"version_slug" varchar,
	"version_tenant_id" integer,
	"version_is_global" boolean DEFAULT false,
	"version_instructor_id" integer,
	"version_description" jsonb,
	"version_thumbnail_id" integer,
	"version_duration_hours" numeric,
	"version_duration_minutes" numeric,
	"version_schedule_start_date" timestamp(3) with time zone,
	"version_schedule_end_date" timestamp(3) with time zone,
	"version_schedule_enrollment_deadline" timestamp(3) with time zone,
	"version_status" "enum__courses_v_version_status" DEFAULT 'draft',
	"version_settings_allow_late_submissions" boolean DEFAULT true,
	"version_settings_require_prerequisites" boolean DEFAULT true,
	"version_settings_show_progress" boolean DEFAULT true,
	"version_enrollment_capacity" numeric,
	"version_enrollment_allow_self_enrollment" boolean DEFAULT true,
	"version_enrollment_require_prerequisite_completion" boolean DEFAULT true,
	"version_enrollment_enrollment_start" timestamp(3) with time zone,
	"version_enrollment_enrollment_end" timestamp(3) with time zone,
	"version_updated_at" timestamp(3) with time zone,
	"version_created_at" timestamp(3) with time zone,
	"version__status" "enum__courses_v_version_status" DEFAULT 'draft',
	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"latest" boolean
);
--> statement-breakpoint
CREATE TABLE "_courses_v_rels" (
	"id" serial PRIMARY KEY NOT NULL,
	"order" integer,
	"parent_id" integer NOT NULL,
	"path" varchar NOT NULL,
	"modules_id" integer,
	"courses_id" integer
);
--> statement-breakpoint
CREATE TABLE "modules_rels" (
	"id" serial PRIMARY KEY NOT NULL,
	"order" integer,
	"parent_id" integer NOT NULL,
	"path" varchar NOT NULL,
	"lessons_id" integer
);
--> statement-breakpoint
CREATE TABLE "_modules_v" (
	"id" serial PRIMARY KEY NOT NULL,
	"parent_id" integer,
	"version_title" varchar,
	"version_description" jsonb,
	"version_course_id" integer,
	"version_order" numeric,
	"version_duration_hours" numeric DEFAULT '0',
	"version_duration_minutes" numeric DEFAULT '0',
	"version_status" "enum__modules_v_version_status" DEFAULT 'draft',
	"version_completion_criteria_type" "enum__modules_v_version_completion_criteria_type" DEFAULT 'all_lessons',
	"version_completion_criteria_minimum_score" numeric,
	"version_completion_criteria_custom_rule" varchar,
	"version_updated_at" timestamp(3) with time zone,
	"version_created_at" timestamp(3) with time zone,
	"version__status" "enum__modules_v_version_status" DEFAULT 'draft',
	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"latest" boolean
);
--> statement-breakpoint
CREATE TABLE "_modules_v_rels" (
	"id" serial PRIMARY KEY NOT NULL,
	"order" integer,
	"parent_id" integer NOT NULL,
	"path" varchar NOT NULL,
	"lessons_id" integer
);
--> statement-breakpoint
CREATE TABLE "lessons_quiz_questions" (
	"_order" integer NOT NULL,
	"_parent_id" integer NOT NULL,
	"id" varchar PRIMARY KEY NOT NULL,
	"question" varchar,
	"type" "enum_lessons_quiz_questions_type",
	"answer" varchar,
	"points" numeric,
	"explanation" jsonb
);
--> statement-breakpoint
CREATE TABLE "lessons_quiz_questions_options" (
	"_order" integer NOT NULL,
	"_parent_id" varchar NOT NULL,
	"id" varchar PRIMARY KEY NOT NULL,
	"text" varchar,
	"correct" boolean DEFAULT false
);
--> statement-breakpoint
CREATE TABLE "lessons_assignment_rubric" (
	"_order" integer NOT NULL,
	"_parent_id" integer NOT NULL,
	"id" varchar PRIMARY KEY NOT NULL,
	"criterion" varchar,
	"points" numeric,
	"description" varchar
);
--> statement-breakpoint
CREATE TABLE "lessons_assignment_allowed_file_types" (
	"order" integer NOT NULL,
	"parent_id" integer NOT NULL,
	"value" "enum_lessons_assignment_allowed_file_types",
	"id" serial PRIMARY KEY NOT NULL
);
--> statement-breakpoint
CREATE TABLE "lessons_discussion_guidelines" (
	"_order" integer NOT NULL,
	"_parent_id" integer NOT NULL,
	"id" varchar PRIMARY KEY NOT NULL,
	"text" varchar
);
--> statement-breakpoint
CREATE TABLE "_lessons_v_version_quiz_questions" (
	"_order" integer NOT NULL,
	"_parent_id" integer NOT NULL,
	"id" serial PRIMARY KEY NOT NULL,
	"question" varchar,
	"type" "enum__lessons_v_version_quiz_questions_type",
	"answer" varchar,
	"points" numeric,
	"explanation" jsonb,
	"_uuid" varchar
);
--> statement-breakpoint
CREATE TABLE "_lessons_v_version_quiz_questions_options" (
	"_order" integer NOT NULL,
	"_parent_id" integer NOT NULL,
	"id" serial PRIMARY KEY NOT NULL,
	"text" varchar,
	"correct" boolean DEFAULT false,
	"_uuid" varchar
);
--> statement-breakpoint
CREATE TABLE "_lessons_v" (
	"id" serial PRIMARY KEY NOT NULL,
	"parent_id" integer,
	"version_title" varchar,
	"version_module_id" integer,
	"version_order" numeric,
	"version_type" "enum__lessons_v_version_type",
	"version_description" jsonb,
	"version_video_url" varchar,
	"version_video_duration" numeric,
	"version_video_transcript" varchar,
	"version_content" jsonb,
	"version_quiz_settings_time_limit" numeric,
	"version_quiz_settings_attempts" numeric DEFAULT '1',
	"version_quiz_settings_passing_score" numeric DEFAULT '70',
	"version_quiz_settings_randomize_questions" boolean DEFAULT false,
	"version_quiz_settings_show_correct_answers" "enum__lessons_v_version_quiz_settings_show_correct_answers" DEFAULT 'after_submit',
	"version_assignment_instructions" jsonb,
	"version_assignment_due_date" timestamp(3) with time zone,
	"version_assignment_points" numeric,
	"version_discussion_prompt" jsonb,
	"version_discussion_settings_require_response" boolean DEFAULT true,
	"version_discussion_settings_require_replies" numeric DEFAULT '2',
	"version_discussion_settings_minimum_words" numeric,
	"version_discussion_settings_due_date" timestamp(3) with time zone,
	"version_status" "enum__lessons_v_version_status" DEFAULT 'draft',
	"version_updated_at" timestamp(3) with time zone,
	"version_created_at" timestamp(3) with time zone,
	"version__status" "enum__lessons_v_version_status" DEFAULT 'draft',
	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"latest" boolean
);
--> statement-breakpoint
CREATE TABLE "_lessons_v_version_assignment_rubric" (
	"_order" integer NOT NULL,
	"_parent_id" integer NOT NULL,
	"id" serial PRIMARY KEY NOT NULL,
	"criterion" varchar,
	"points" numeric,
	"description" varchar,
	"_uuid" varchar
);
--> statement-breakpoint
CREATE TABLE "_lessons_v_version_assignment_allowed_file_types" (
	"order" integer NOT NULL,
	"parent_id" integer NOT NULL,
	"value" "enum__lessons_v_version_assignment_allowed_file_types",
	"id" serial PRIMARY KEY NOT NULL
);
--> statement-breakpoint
CREATE TABLE "_lessons_v_version_discussion_guidelines" (
	"_order" integer NOT NULL,
	"_parent_id" integer NOT NULL,
	"id" serial PRIMARY KEY NOT NULL,
	"text" varchar,
	"_uuid" varchar
);
--> statement-breakpoint
CREATE TABLE "payload_locked_documents" (
	"id" serial PRIMARY KEY NOT NULL,
	"global_slug" varchar,
	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "payload_locked_documents_rels" (
	"id" serial PRIMARY KEY NOT NULL,
	"order" integer,
	"parent_id" integer NOT NULL,
	"path" varchar NOT NULL,
	"tenants_id" integer,
	"student_settings_id" integer,
	"users_id" integer,
	"progress_id" integer,
	"points_id" integer,
	"levels_id" integer,
	"achievements_id" integer,
	"badges_id" integer,
	"streaks_id" integer,
	"leaderboards_id" integer,
	"enrollments_id" integer,
	"courses_id" integer,
	"modules_id" integer,
	"lessons_id" integer,
	"media_id" integer
);
--> statement-breakpoint
CREATE TABLE "payload_preferences" (
	"id" serial PRIMARY KEY NOT NULL,
	"key" varchar,
	"value" jsonb,
	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "payload_preferences_rels" (
	"id" serial PRIMARY KEY NOT NULL,
	"order" integer,
	"parent_id" integer NOT NULL,
	"path" varchar NOT NULL,
	"users_id" integer
);
--> statement-breakpoint
ALTER TABLE "media" ADD CONSTRAINT "media_tenant_id_tenants_id_fk" FOREIGN KEY ("tenant_id") REFERENCES "public"."tenants"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "tenants" ADD CONSTRAINT "tenants_settings_logo_id_media_id_fk" FOREIGN KEY ("settings_logo_id") REFERENCES "public"."media"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "users" ADD CONSTRAINT "users_avatar_id_media_id_fk" FOREIGN KEY ("avatar_id") REFERENCES "public"."media"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "users" ADD CONSTRAINT "users_tenant_id_tenants_id_fk" FOREIGN KEY ("tenant_id") REFERENCES "public"."tenants"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "users" ADD CONSTRAINT "users_settings_id_student_settings_id_fk" FOREIGN KEY ("settings_id") REFERENCES "public"."student_settings"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "student_settings" ADD CONSTRAINT "student_settings_user_id_users_id_fk" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "modules" ADD CONSTRAINT "modules_course_id_courses_id_fk" FOREIGN KEY ("course_id") REFERENCES "public"."courses"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "progress_module_progress" ADD CONSTRAINT "progress_module_progress_module_id_modules_id_fk" FOREIGN KEY ("module_id") REFERENCES "public"."modules"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "progress_module_progress" ADD CONSTRAINT "progress_module_progress_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."progress"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "progress" ADD CONSTRAINT "progress_student_id_users_id_fk" FOREIGN KEY ("student_id") REFERENCES "public"."users"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "progress" ADD CONSTRAINT "progress_course_id_courses_id_fk" FOREIGN KEY ("course_id") REFERENCES "public"."courses"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "lessons" ADD CONSTRAINT "lessons_module_id_modules_id_fk" FOREIGN KEY ("module_id") REFERENCES "public"."modules"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "progress_quiz_attempts" ADD CONSTRAINT "progress_quiz_attempts_lesson_id_lessons_id_fk" FOREIGN KEY ("lesson_id") REFERENCES "public"."lessons"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "progress_quiz_attempts" ADD CONSTRAINT "progress_quiz_attempts_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."progress"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "progress_discussions" ADD CONSTRAINT "progress_discussions_lesson_id_lessons_id_fk" FOREIGN KEY ("lesson_id") REFERENCES "public"."lessons"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "progress_discussions" ADD CONSTRAINT "progress_discussions_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."progress"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "courses" ADD CONSTRAINT "courses_tenant_id_tenants_id_fk" FOREIGN KEY ("tenant_id") REFERENCES "public"."tenants"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "courses" ADD CONSTRAINT "courses_instructor_id_users_id_fk" FOREIGN KEY ("instructor_id") REFERENCES "public"."users"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "courses" ADD CONSTRAINT "courses_thumbnail_id_media_id_fk" FOREIGN KEY ("thumbnail_id") REFERENCES "public"."media"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "points" ADD CONSTRAINT "points_student_id_users_id_fk" FOREIGN KEY ("student_id") REFERENCES "public"."users"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "points" ADD CONSTRAINT "points_source_lesson_id_lessons_id_fk" FOREIGN KEY ("source_lesson_id") REFERENCES "public"."lessons"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "points" ADD CONSTRAINT "points_source_achievement_id_achievements_id_fk" FOREIGN KEY ("source_achievement_id") REFERENCES "public"."achievements"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "points" ADD CONSTRAINT "points_source_streak_id_streaks_id_fk" FOREIGN KEY ("source_streak_id") REFERENCES "public"."streaks"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "achievements" ADD CONSTRAINT "achievements_tenant_id_tenants_id_fk" FOREIGN KEY ("tenant_id") REFERENCES "public"."tenants"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "achievements" ADD CONSTRAINT "achievements_badge_id_badges_id_fk" FOREIGN KEY ("badge_id") REFERENCES "public"."badges"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "streaks" ADD CONSTRAINT "streaks_student_id_users_id_fk" FOREIGN KEY ("student_id") REFERENCES "public"."users"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "badges" ADD CONSTRAINT "badges_icon_id_media_id_fk" FOREIGN KEY ("icon_id") REFERENCES "public"."media"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "badges" ADD CONSTRAINT "badges_tenant_id_tenants_id_fk" FOREIGN KEY ("tenant_id") REFERENCES "public"."tenants"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "levels_rewards" ADD CONSTRAINT "levels_rewards_badge_id_badges_id_fk" FOREIGN KEY ("badge_id") REFERENCES "public"."badges"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "levels_rewards" ADD CONSTRAINT "levels_rewards_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."levels"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "levels" ADD CONSTRAINT "levels_tenant_id_tenants_id_fk" FOREIGN KEY ("tenant_id") REFERENCES "public"."tenants"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "levels" ADD CONSTRAINT "levels_icon_id_media_id_fk" FOREIGN KEY ("icon_id") REFERENCES "public"."media"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "streaks_history" ADD CONSTRAINT "streaks_history_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."streaks"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "streaks_rels" ADD CONSTRAINT "streaks_rels_parent_fk" FOREIGN KEY ("parent_id") REFERENCES "public"."streaks"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "streaks_rels" ADD CONSTRAINT "streaks_rels_courses_fk" FOREIGN KEY ("courses_id") REFERENCES "public"."courses"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "streaks_rels" ADD CONSTRAINT "streaks_rels_lessons_fk" FOREIGN KEY ("lessons_id") REFERENCES "public"."lessons"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "streaks_rels" ADD CONSTRAINT "streaks_rels_modules_fk" FOREIGN KEY ("modules_id") REFERENCES "public"."modules"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "leaderboards" ADD CONSTRAINT "leaderboards_tenant_id_tenants_id_fk" FOREIGN KEY ("tenant_id") REFERENCES "public"."tenants"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "leaderboards" ADD CONSTRAINT "leaderboards_scope_course_id_courses_id_fk" FOREIGN KEY ("scope_course_id") REFERENCES "public"."courses"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "enrollments" ADD CONSTRAINT "enrollments_student_id_users_id_fk" FOREIGN KEY ("student_id") REFERENCES "public"."users"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "enrollments" ADD CONSTRAINT "enrollments_course_id_courses_id_fk" FOREIGN KEY ("course_id") REFERENCES "public"."courses"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "courses_rels" ADD CONSTRAINT "courses_rels_parent_fk" FOREIGN KEY ("parent_id") REFERENCES "public"."courses"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "courses_rels" ADD CONSTRAINT "courses_rels_modules_fk" FOREIGN KEY ("modules_id") REFERENCES "public"."modules"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "courses_rels" ADD CONSTRAINT "courses_rels_courses_fk" FOREIGN KEY ("courses_id") REFERENCES "public"."courses"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "_courses_v" ADD CONSTRAINT "_courses_v_parent_id_courses_id_fk" FOREIGN KEY ("parent_id") REFERENCES "public"."courses"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "_courses_v" ADD CONSTRAINT "_courses_v_version_tenant_id_tenants_id_fk" FOREIGN KEY ("version_tenant_id") REFERENCES "public"."tenants"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "_courses_v" ADD CONSTRAINT "_courses_v_version_instructor_id_users_id_fk" FOREIGN KEY ("version_instructor_id") REFERENCES "public"."users"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "_courses_v" ADD CONSTRAINT "_courses_v_version_thumbnail_id_media_id_fk" FOREIGN KEY ("version_thumbnail_id") REFERENCES "public"."media"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "_courses_v_rels" ADD CONSTRAINT "_courses_v_rels_parent_fk" FOREIGN KEY ("parent_id") REFERENCES "public"."_courses_v"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "_courses_v_rels" ADD CONSTRAINT "_courses_v_rels_modules_fk" FOREIGN KEY ("modules_id") REFERENCES "public"."modules"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "_courses_v_rels" ADD CONSTRAINT "_courses_v_rels_courses_fk" FOREIGN KEY ("courses_id") REFERENCES "public"."courses"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "modules_rels" ADD CONSTRAINT "modules_rels_parent_fk" FOREIGN KEY ("parent_id") REFERENCES "public"."modules"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "modules_rels" ADD CONSTRAINT "modules_rels_lessons_fk" FOREIGN KEY ("lessons_id") REFERENCES "public"."lessons"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "_modules_v" ADD CONSTRAINT "_modules_v_parent_id_modules_id_fk" FOREIGN KEY ("parent_id") REFERENCES "public"."modules"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "_modules_v" ADD CONSTRAINT "_modules_v_version_course_id_courses_id_fk" FOREIGN KEY ("version_course_id") REFERENCES "public"."courses"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "_modules_v_rels" ADD CONSTRAINT "_modules_v_rels_parent_fk" FOREIGN KEY ("parent_id") REFERENCES "public"."_modules_v"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "_modules_v_rels" ADD CONSTRAINT "_modules_v_rels_lessons_fk" FOREIGN KEY ("lessons_id") REFERENCES "public"."lessons"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "lessons_quiz_questions" ADD CONSTRAINT "lessons_quiz_questions_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."lessons"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "lessons_quiz_questions_options" ADD CONSTRAINT "lessons_quiz_questions_options_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."lessons_quiz_questions"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "lessons_assignment_rubric" ADD CONSTRAINT "lessons_assignment_rubric_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."lessons"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "lessons_assignment_allowed_file_types" ADD CONSTRAINT "lessons_assignment_allowed_file_types_parent_fk" FOREIGN KEY ("parent_id") REFERENCES "public"."lessons"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "lessons_discussion_guidelines" ADD CONSTRAINT "lessons_discussion_guidelines_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."lessons"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "_lessons_v_version_quiz_questions" ADD CONSTRAINT "_lessons_v_version_quiz_questions_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_lessons_v"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "_lessons_v_version_quiz_questions_options" ADD CONSTRAINT "_lessons_v_version_quiz_questions_options_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_lessons_v_version_quiz_questions"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "_lessons_v" ADD CONSTRAINT "_lessons_v_parent_id_lessons_id_fk" FOREIGN KEY ("parent_id") REFERENCES "public"."lessons"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "_lessons_v" ADD CONSTRAINT "_lessons_v_version_module_id_modules_id_fk" FOREIGN KEY ("version_module_id") REFERENCES "public"."modules"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "_lessons_v_version_assignment_rubric" ADD CONSTRAINT "_lessons_v_version_assignment_rubric_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_lessons_v"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "_lessons_v_version_assignment_allowed_file_types" ADD CONSTRAINT "_lessons_v_version_assignment_allowed_file_types_parent_fk" FOREIGN KEY ("parent_id") REFERENCES "public"."_lessons_v"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "_lessons_v_version_discussion_guidelines" ADD CONSTRAINT "_lessons_v_version_discussion_guidelines_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."_lessons_v"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payload_locked_documents_rels" ADD CONSTRAINT "payload_locked_documents_rels_parent_fk" FOREIGN KEY ("parent_id") REFERENCES "public"."payload_locked_documents"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payload_locked_documents_rels" ADD CONSTRAINT "payload_locked_documents_rels_tenants_fk" FOREIGN KEY ("tenants_id") REFERENCES "public"."tenants"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payload_locked_documents_rels" ADD CONSTRAINT "payload_locked_documents_rels_student_settings_fk" FOREIGN KEY ("student_settings_id") REFERENCES "public"."student_settings"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payload_locked_documents_rels" ADD CONSTRAINT "payload_locked_documents_rels_users_fk" FOREIGN KEY ("users_id") REFERENCES "public"."users"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payload_locked_documents_rels" ADD CONSTRAINT "payload_locked_documents_rels_progress_fk" FOREIGN KEY ("progress_id") REFERENCES "public"."progress"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payload_locked_documents_rels" ADD CONSTRAINT "payload_locked_documents_rels_points_fk" FOREIGN KEY ("points_id") REFERENCES "public"."points"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payload_locked_documents_rels" ADD CONSTRAINT "payload_locked_documents_rels_levels_fk" FOREIGN KEY ("levels_id") REFERENCES "public"."levels"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payload_locked_documents_rels" ADD CONSTRAINT "payload_locked_documents_rels_achievements_fk" FOREIGN KEY ("achievements_id") REFERENCES "public"."achievements"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payload_locked_documents_rels" ADD CONSTRAINT "payload_locked_documents_rels_badges_fk" FOREIGN KEY ("badges_id") REFERENCES "public"."badges"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payload_locked_documents_rels" ADD CONSTRAINT "payload_locked_documents_rels_streaks_fk" FOREIGN KEY ("streaks_id") REFERENCES "public"."streaks"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payload_locked_documents_rels" ADD CONSTRAINT "payload_locked_documents_rels_leaderboards_fk" FOREIGN KEY ("leaderboards_id") REFERENCES "public"."leaderboards"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payload_locked_documents_rels" ADD CONSTRAINT "payload_locked_documents_rels_enrollments_fk" FOREIGN KEY ("enrollments_id") REFERENCES "public"."enrollments"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payload_locked_documents_rels" ADD CONSTRAINT "payload_locked_documents_rels_courses_fk" FOREIGN KEY ("courses_id") REFERENCES "public"."courses"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payload_locked_documents_rels" ADD CONSTRAINT "payload_locked_documents_rels_modules_fk" FOREIGN KEY ("modules_id") REFERENCES "public"."modules"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payload_locked_documents_rels" ADD CONSTRAINT "payload_locked_documents_rels_lessons_fk" FOREIGN KEY ("lessons_id") REFERENCES "public"."lessons"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payload_locked_documents_rels" ADD CONSTRAINT "payload_locked_documents_rels_media_fk" FOREIGN KEY ("media_id") REFERENCES "public"."media"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payload_preferences_rels" ADD CONSTRAINT "payload_preferences_rels_parent_fk" FOREIGN KEY ("parent_id") REFERENCES "public"."payload_preferences"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "payload_preferences_rels" ADD CONSTRAINT "payload_preferences_rels_users_fk" FOREIGN KEY ("users_id") REFERENCES "public"."users"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
CREATE INDEX "payload_migrations_created_at_idx" ON "payload_migrations" USING btree ("created_at" timestamptz_ops);--> statement-breakpoint
CREATE INDEX "payload_migrations_updated_at_idx" ON "payload_migrations" USING btree ("updated_at" timestamptz_ops);--> statement-breakpoint
CREATE INDEX "media_created_at_idx" ON "media" USING btree ("created_at" timestamptz_ops);--> statement-breakpoint
CREATE UNIQUE INDEX "media_filename_idx" ON "media" USING btree ("filename" text_ops);--> statement-breakpoint
CREATE INDEX "media_sizes_card_sizes_card_filename_idx" ON "media" USING btree ("sizes_card_filename" text_ops);--> statement-breakpoint
CREATE INDEX "media_sizes_thumbnail_sizes_thumbnail_filename_idx" ON "media" USING btree ("sizes_thumbnail_filename" text_ops);--> statement-breakpoint
CREATE INDEX "media_tenant_idx" ON "media" USING btree ("tenant_id" int4_ops);--> statement-breakpoint
CREATE INDEX "media_updated_at_idx" ON "media" USING btree ("updated_at" timestamptz_ops);--> statement-breakpoint
CREATE INDEX "tenants_created_at_idx" ON "tenants" USING btree ("created_at" timestamptz_ops);--> statement-breakpoint
CREATE UNIQUE INDEX "tenants_domain_idx" ON "tenants" USING btree ("domain" text_ops);--> statement-breakpoint
CREATE INDEX "tenants_settings_settings_logo_idx" ON "tenants" USING btree ("settings_logo_id" int4_ops);--> statement-breakpoint
CREATE UNIQUE INDEX "tenants_slug_idx" ON "tenants" USING btree ("slug" text_ops);--> statement-breakpoint
CREATE INDEX "tenants_updated_at_idx" ON "tenants" USING btree ("updated_at" timestamptz_ops);--> statement-breakpoint
CREATE INDEX "users_avatar_idx" ON "users" USING btree ("avatar_id" int4_ops);--> statement-breakpoint
CREATE INDEX "users_created_at_idx" ON "users" USING btree ("created_at" timestamptz_ops);--> statement-breakpoint
CREATE UNIQUE INDEX "users_email_idx" ON "users" USING btree ("email" text_ops);--> statement-breakpoint
CREATE INDEX "users_settings_idx" ON "users" USING btree ("settings_id" int4_ops);--> statement-breakpoint
CREATE INDEX "users_tenant_idx" ON "users" USING btree ("tenant_id" int4_ops);--> statement-breakpoint
CREATE INDEX "users_updated_at_idx" ON "users" USING btree ("updated_at" timestamptz_ops);--> statement-breakpoint
CREATE INDEX "student_settings_created_at_idx" ON "student_settings" USING btree ("created_at" timestamptz_ops);--> statement-breakpoint
CREATE INDEX "student_settings_updated_at_idx" ON "student_settings" USING btree ("updated_at" timestamptz_ops);--> statement-breakpoint
CREATE UNIQUE INDEX "student_settings_user_idx" ON "student_settings" USING btree ("user_id" int4_ops);--> statement-breakpoint
CREATE INDEX "modules__status_idx" ON "modules" USING btree ("_status" enum_ops);--> statement-breakpoint
CREATE INDEX "modules_course_idx" ON "modules" USING btree ("course_id" int4_ops);--> statement-breakpoint
CREATE INDEX "modules_created_at_idx" ON "modules" USING btree ("created_at" timestamptz_ops);--> statement-breakpoint
CREATE INDEX "modules_updated_at_idx" ON "modules" USING btree ("updated_at" timestamptz_ops);--> statement-breakpoint
CREATE INDEX "progress_module_progress_module_idx" ON "progress_module_progress" USING btree ("module_id" int4_ops);--> statement-breakpoint
CREATE INDEX "progress_module_progress_order_idx" ON "progress_module_progress" USING btree ("_order" int4_ops);--> statement-breakpoint
CREATE INDEX "progress_module_progress_parent_id_idx" ON "progress_module_progress" USING btree ("_parent_id" int4_ops);--> statement-breakpoint
CREATE INDEX "progress_course_idx" ON "progress" USING btree ("course_id" int4_ops);--> statement-breakpoint
CREATE INDEX "progress_created_at_idx" ON "progress" USING btree ("created_at" timestamptz_ops);--> statement-breakpoint
CREATE INDEX "progress_student_idx" ON "progress" USING btree ("student_id" int4_ops);--> statement-breakpoint
CREATE INDEX "progress_updated_at_idx" ON "progress" USING btree ("updated_at" timestamptz_ops);--> statement-breakpoint
CREATE INDEX "lessons__status_idx" ON "lessons" USING btree ("_status" enum_ops);--> statement-breakpoint
CREATE INDEX "lessons_created_at_idx" ON "lessons" USING btree ("created_at" timestamptz_ops);--> statement-breakpoint
CREATE INDEX "lessons_module_idx" ON "lessons" USING btree ("module_id" int4_ops);--> statement-breakpoint
CREATE INDEX "lessons_updated_at_idx" ON "lessons" USING btree ("updated_at" timestamptz_ops);--> statement-breakpoint
CREATE INDEX "progress_quiz_attempts_lesson_idx" ON "progress_quiz_attempts" USING btree ("lesson_id" int4_ops);--> statement-breakpoint
CREATE INDEX "progress_quiz_attempts_order_idx" ON "progress_quiz_attempts" USING btree ("_order" int4_ops);--> statement-breakpoint
CREATE INDEX "progress_quiz_attempts_parent_id_idx" ON "progress_quiz_attempts" USING btree ("_parent_id" int4_ops);--> statement-breakpoint
CREATE INDEX "progress_discussions_lesson_idx" ON "progress_discussions" USING btree ("lesson_id" int4_ops);--> statement-breakpoint
CREATE INDEX "progress_discussions_order_idx" ON "progress_discussions" USING btree ("_order" int4_ops);--> statement-breakpoint
CREATE INDEX "progress_discussions_parent_id_idx" ON "progress_discussions" USING btree ("_parent_id" int4_ops);--> statement-breakpoint
CREATE INDEX "courses__status_idx" ON "courses" USING btree ("_status" enum_ops);--> statement-breakpoint
CREATE INDEX "courses_created_at_idx" ON "courses" USING btree ("created_at" timestamptz_ops);--> statement-breakpoint
CREATE INDEX "courses_instructor_idx" ON "courses" USING btree ("instructor_id" int4_ops);--> statement-breakpoint
CREATE UNIQUE INDEX "courses_slug_idx" ON "courses" USING btree ("slug" text_ops);--> statement-breakpoint
CREATE INDEX "courses_tenant_idx" ON "courses" USING btree ("tenant_id" int4_ops);--> statement-breakpoint
CREATE INDEX "courses_thumbnail_idx" ON "courses" USING btree ("thumbnail_id" int4_ops);--> statement-breakpoint
CREATE INDEX "courses_updated_at_idx" ON "courses" USING btree ("updated_at" timestamptz_ops);--> statement-breakpoint
CREATE INDEX "points_created_at_idx" ON "points" USING btree ("created_at" timestamptz_ops);--> statement-breakpoint
CREATE INDEX "points_source_source_achievement_idx" ON "points" USING btree ("source_achievement_id" int4_ops);--> statement-breakpoint
CREATE INDEX "points_source_source_lesson_idx" ON "points" USING btree ("source_lesson_id" int4_ops);--> statement-breakpoint
CREATE INDEX "points_source_source_streak_idx" ON "points" USING btree ("source_streak_id" int4_ops);--> statement-breakpoint
CREATE INDEX "points_source_source_type_idx" ON "points" USING btree ("source_type" enum_ops);--> statement-breakpoint
CREATE INDEX "points_student_idx" ON "points" USING btree ("student_id" int4_ops);--> statement-breakpoint
CREATE INDEX "points_type_idx" ON "points" USING btree ("type" enum_ops);--> statement-breakpoint
CREATE INDEX "points_updated_at_idx" ON "points" USING btree ("updated_at" timestamptz_ops);--> statement-breakpoint
CREATE INDEX "achievements_badge_idx" ON "achievements" USING btree ("badge_id" int4_ops);--> statement-breakpoint
CREATE INDEX "achievements_created_at_idx" ON "achievements" USING btree ("created_at" timestamptz_ops);--> statement-breakpoint
CREATE INDEX "achievements_name_idx" ON "achievements" USING btree ("name" text_ops);--> statement-breakpoint
CREATE INDEX "achievements_tenant_idx" ON "achievements" USING btree ("tenant_id" int4_ops);--> statement-breakpoint
CREATE INDEX "achievements_updated_at_idx" ON "achievements" USING btree ("updated_at" timestamptz_ops);--> statement-breakpoint
CREATE INDEX "streaks_created_at_idx" ON "streaks" USING btree ("created_at" timestamptz_ops);--> statement-breakpoint
CREATE INDEX "streaks_last_activity_idx" ON "streaks" USING btree ("last_activity" timestamptz_ops);--> statement-breakpoint
CREATE INDEX "streaks_student_idx" ON "streaks" USING btree ("student_id" int4_ops);--> statement-breakpoint
CREATE INDEX "streaks_type_idx" ON "streaks" USING btree ("type" enum_ops);--> statement-breakpoint
CREATE INDEX "streaks_updated_at_idx" ON "streaks" USING btree ("updated_at" timestamptz_ops);--> statement-breakpoint
CREATE INDEX "badges_category_idx" ON "badges" USING btree ("category" enum_ops);--> statement-breakpoint
CREATE INDEX "badges_created_at_idx" ON "badges" USING btree ("created_at" timestamptz_ops);--> statement-breakpoint
CREATE INDEX "badges_icon_idx" ON "badges" USING btree ("icon_id" int4_ops);--> statement-breakpoint
CREATE INDEX "badges_name_idx" ON "badges" USING btree ("name" text_ops);--> statement-breakpoint
CREATE INDEX "badges_rarity_idx" ON "badges" USING btree ("rarity" enum_ops);--> statement-breakpoint
CREATE INDEX "badges_tenant_idx" ON "badges" USING btree ("tenant_id" int4_ops);--> statement-breakpoint
CREATE INDEX "badges_updated_at_idx" ON "badges" USING btree ("updated_at" timestamptz_ops);--> statement-breakpoint
CREATE INDEX "levels_rewards_badge_idx" ON "levels_rewards" USING btree ("badge_id" int4_ops);--> statement-breakpoint
CREATE INDEX "levels_rewards_order_idx" ON "levels_rewards" USING btree ("_order" int4_ops);--> statement-breakpoint
CREATE INDEX "levels_rewards_parent_id_idx" ON "levels_rewards" USING btree ("_parent_id" int4_ops);--> statement-breakpoint
CREATE INDEX "levels_created_at_idx" ON "levels" USING btree ("created_at" timestamptz_ops);--> statement-breakpoint
CREATE INDEX "levels_icon_idx" ON "levels" USING btree ("icon_id" int4_ops);--> statement-breakpoint
CREATE INDEX "levels_tenant_idx" ON "levels" USING btree ("tenant_id" int4_ops);--> statement-breakpoint
CREATE INDEX "levels_updated_at_idx" ON "levels" USING btree ("updated_at" timestamptz_ops);--> statement-breakpoint
CREATE INDEX "streaks_history_order_idx" ON "streaks_history" USING btree ("_order" int4_ops);--> statement-breakpoint
CREATE INDEX "streaks_history_parent_id_idx" ON "streaks_history" USING btree ("_parent_id" int4_ops);--> statement-breakpoint
CREATE INDEX "streaks_rels_courses_id_idx" ON "streaks_rels" USING btree ("courses_id" int4_ops);--> statement-breakpoint
CREATE INDEX "streaks_rels_lessons_id_idx" ON "streaks_rels" USING btree ("lessons_id" int4_ops);--> statement-breakpoint
CREATE INDEX "streaks_rels_modules_id_idx" ON "streaks_rels" USING btree ("modules_id" int4_ops);--> statement-breakpoint
CREATE INDEX "streaks_rels_order_idx" ON "streaks_rels" USING btree ("order" int4_ops);--> statement-breakpoint
CREATE INDEX "streaks_rels_parent_idx" ON "streaks_rels" USING btree ("parent_id" int4_ops);--> statement-breakpoint
CREATE INDEX "streaks_rels_path_idx" ON "streaks_rels" USING btree ("path" text_ops);--> statement-breakpoint
CREATE INDEX "leaderboards_created_at_idx" ON "leaderboards" USING btree ("created_at" timestamptz_ops);--> statement-breakpoint
CREATE INDEX "leaderboards_scope_scope_course_idx" ON "leaderboards" USING btree ("scope_course_id" int4_ops);--> statement-breakpoint
CREATE INDEX "leaderboards_tenant_idx" ON "leaderboards" USING btree ("tenant_id" int4_ops);--> statement-breakpoint
CREATE INDEX "leaderboards_timeframe_idx" ON "leaderboards" USING btree ("timeframe" enum_ops);--> statement-breakpoint
CREATE INDEX "leaderboards_type_idx" ON "leaderboards" USING btree ("type" enum_ops);--> statement-breakpoint
CREATE INDEX "leaderboards_updated_at_idx" ON "leaderboards" USING btree ("updated_at" timestamptz_ops);--> statement-breakpoint
CREATE INDEX "enrollments_course_idx" ON "enrollments" USING btree ("course_id" int4_ops);--> statement-breakpoint
CREATE INDEX "enrollments_created_at_idx" ON "enrollments" USING btree ("created_at" timestamptz_ops);--> statement-breakpoint
CREATE INDEX "enrollments_student_idx" ON "enrollments" USING btree ("student_id" int4_ops);--> statement-breakpoint
CREATE INDEX "enrollments_updated_at_idx" ON "enrollments" USING btree ("updated_at" timestamptz_ops);--> statement-breakpoint
CREATE INDEX "courses_rels_courses_id_idx" ON "courses_rels" USING btree ("courses_id" int4_ops);--> statement-breakpoint
CREATE INDEX "courses_rels_modules_id_idx" ON "courses_rels" USING btree ("modules_id" int4_ops);--> statement-breakpoint
CREATE INDEX "courses_rels_order_idx" ON "courses_rels" USING btree ("order" int4_ops);--> statement-breakpoint
CREATE INDEX "courses_rels_parent_idx" ON "courses_rels" USING btree ("parent_id" int4_ops);--> statement-breakpoint
CREATE INDEX "courses_rels_path_idx" ON "courses_rels" USING btree ("path" text_ops);--> statement-breakpoint
CREATE INDEX "_courses_v_created_at_idx" ON "_courses_v" USING btree ("created_at" timestamptz_ops);--> statement-breakpoint
CREATE INDEX "_courses_v_latest_idx" ON "_courses_v" USING btree ("latest" bool_ops);--> statement-breakpoint
CREATE INDEX "_courses_v_parent_idx" ON "_courses_v" USING btree ("parent_id" int4_ops);--> statement-breakpoint
CREATE INDEX "_courses_v_updated_at_idx" ON "_courses_v" USING btree ("updated_at" timestamptz_ops);--> statement-breakpoint
CREATE INDEX "_courses_v_version_version__status_idx" ON "_courses_v" USING btree ("version__status" enum_ops);--> statement-breakpoint
CREATE INDEX "_courses_v_version_version_created_at_idx" ON "_courses_v" USING btree ("version_created_at" timestamptz_ops);--> statement-breakpoint
CREATE INDEX "_courses_v_version_version_instructor_idx" ON "_courses_v" USING btree ("version_instructor_id" int4_ops);--> statement-breakpoint
CREATE INDEX "_courses_v_version_version_slug_idx" ON "_courses_v" USING btree ("version_slug" text_ops);--> statement-breakpoint
CREATE INDEX "_courses_v_version_version_tenant_idx" ON "_courses_v" USING btree ("version_tenant_id" int4_ops);--> statement-breakpoint
CREATE INDEX "_courses_v_version_version_thumbnail_idx" ON "_courses_v" USING btree ("version_thumbnail_id" int4_ops);--> statement-breakpoint
CREATE INDEX "_courses_v_version_version_updated_at_idx" ON "_courses_v" USING btree ("version_updated_at" timestamptz_ops);--> statement-breakpoint
CREATE INDEX "_courses_v_rels_courses_id_idx" ON "_courses_v_rels" USING btree ("courses_id" int4_ops);--> statement-breakpoint
CREATE INDEX "_courses_v_rels_modules_id_idx" ON "_courses_v_rels" USING btree ("modules_id" int4_ops);--> statement-breakpoint
CREATE INDEX "_courses_v_rels_order_idx" ON "_courses_v_rels" USING btree ("order" int4_ops);--> statement-breakpoint
CREATE INDEX "_courses_v_rels_parent_idx" ON "_courses_v_rels" USING btree ("parent_id" int4_ops);--> statement-breakpoint
CREATE INDEX "_courses_v_rels_path_idx" ON "_courses_v_rels" USING btree ("path" text_ops);--> statement-breakpoint
CREATE INDEX "modules_rels_lessons_id_idx" ON "modules_rels" USING btree ("lessons_id" int4_ops);--> statement-breakpoint
CREATE INDEX "modules_rels_order_idx" ON "modules_rels" USING btree ("order" int4_ops);--> statement-breakpoint
CREATE INDEX "modules_rels_parent_idx" ON "modules_rels" USING btree ("parent_id" int4_ops);--> statement-breakpoint
CREATE INDEX "modules_rels_path_idx" ON "modules_rels" USING btree ("path" text_ops);--> statement-breakpoint
CREATE INDEX "_modules_v_created_at_idx" ON "_modules_v" USING btree ("created_at" timestamptz_ops);--> statement-breakpoint
CREATE INDEX "_modules_v_latest_idx" ON "_modules_v" USING btree ("latest" bool_ops);--> statement-breakpoint
CREATE INDEX "_modules_v_parent_idx" ON "_modules_v" USING btree ("parent_id" int4_ops);--> statement-breakpoint
CREATE INDEX "_modules_v_updated_at_idx" ON "_modules_v" USING btree ("updated_at" timestamptz_ops);--> statement-breakpoint
CREATE INDEX "_modules_v_version_version__status_idx" ON "_modules_v" USING btree ("version__status" enum_ops);--> statement-breakpoint
CREATE INDEX "_modules_v_version_version_course_idx" ON "_modules_v" USING btree ("version_course_id" int4_ops);--> statement-breakpoint
CREATE INDEX "_modules_v_version_version_created_at_idx" ON "_modules_v" USING btree ("version_created_at" timestamptz_ops);--> statement-breakpoint
CREATE INDEX "_modules_v_version_version_updated_at_idx" ON "_modules_v" USING btree ("version_updated_at" timestamptz_ops);--> statement-breakpoint
CREATE INDEX "_modules_v_rels_lessons_id_idx" ON "_modules_v_rels" USING btree ("lessons_id" int4_ops);--> statement-breakpoint
CREATE INDEX "_modules_v_rels_order_idx" ON "_modules_v_rels" USING btree ("order" int4_ops);--> statement-breakpoint
CREATE INDEX "_modules_v_rels_parent_idx" ON "_modules_v_rels" USING btree ("parent_id" int4_ops);--> statement-breakpoint
CREATE INDEX "_modules_v_rels_path_idx" ON "_modules_v_rels" USING btree ("path" text_ops);--> statement-breakpoint
CREATE INDEX "lessons_quiz_questions_order_idx" ON "lessons_quiz_questions" USING btree ("_order" int4_ops);--> statement-breakpoint
CREATE INDEX "lessons_quiz_questions_parent_id_idx" ON "lessons_quiz_questions" USING btree ("_parent_id" int4_ops);--> statement-breakpoint
CREATE INDEX "lessons_quiz_questions_options_order_idx" ON "lessons_quiz_questions_options" USING btree ("_order" int4_ops);--> statement-breakpoint
CREATE INDEX "lessons_quiz_questions_options_parent_id_idx" ON "lessons_quiz_questions_options" USING btree ("_parent_id" text_ops);--> statement-breakpoint
CREATE INDEX "lessons_assignment_rubric_order_idx" ON "lessons_assignment_rubric" USING btree ("_order" int4_ops);--> statement-breakpoint
CREATE INDEX "lessons_assignment_rubric_parent_id_idx" ON "lessons_assignment_rubric" USING btree ("_parent_id" int4_ops);--> statement-breakpoint
CREATE INDEX "lessons_assignment_allowed_file_types_order_idx" ON "lessons_assignment_allowed_file_types" USING btree ("order" int4_ops);--> statement-breakpoint
CREATE INDEX "lessons_assignment_allowed_file_types_parent_idx" ON "lessons_assignment_allowed_file_types" USING btree ("parent_id" int4_ops);--> statement-breakpoint
CREATE INDEX "lessons_discussion_guidelines_order_idx" ON "lessons_discussion_guidelines" USING btree ("_order" int4_ops);--> statement-breakpoint
CREATE INDEX "lessons_discussion_guidelines_parent_id_idx" ON "lessons_discussion_guidelines" USING btree ("_parent_id" int4_ops);--> statement-breakpoint
CREATE INDEX "_lessons_v_version_quiz_questions_order_idx" ON "_lessons_v_version_quiz_questions" USING btree ("_order" int4_ops);--> statement-breakpoint
CREATE INDEX "_lessons_v_version_quiz_questions_parent_id_idx" ON "_lessons_v_version_quiz_questions" USING btree ("_parent_id" int4_ops);--> statement-breakpoint
CREATE INDEX "_lessons_v_version_quiz_questions_options_order_idx" ON "_lessons_v_version_quiz_questions_options" USING btree ("_order" int4_ops);--> statement-breakpoint
CREATE INDEX "_lessons_v_version_quiz_questions_options_parent_id_idx" ON "_lessons_v_version_quiz_questions_options" USING btree ("_parent_id" int4_ops);--> statement-breakpoint
CREATE INDEX "_lessons_v_created_at_idx" ON "_lessons_v" USING btree ("created_at" timestamptz_ops);--> statement-breakpoint
CREATE INDEX "_lessons_v_latest_idx" ON "_lessons_v" USING btree ("latest" bool_ops);--> statement-breakpoint
CREATE INDEX "_lessons_v_parent_idx" ON "_lessons_v" USING btree ("parent_id" int4_ops);--> statement-breakpoint
CREATE INDEX "_lessons_v_updated_at_idx" ON "_lessons_v" USING btree ("updated_at" timestamptz_ops);--> statement-breakpoint
CREATE INDEX "_lessons_v_version_version__status_idx" ON "_lessons_v" USING btree ("version__status" enum_ops);--> statement-breakpoint
CREATE INDEX "_lessons_v_version_version_created_at_idx" ON "_lessons_v" USING btree ("version_created_at" timestamptz_ops);--> statement-breakpoint
CREATE INDEX "_lessons_v_version_version_module_idx" ON "_lessons_v" USING btree ("version_module_id" int4_ops);--> statement-breakpoint
CREATE INDEX "_lessons_v_version_version_updated_at_idx" ON "_lessons_v" USING btree ("version_updated_at" timestamptz_ops);--> statement-breakpoint
CREATE INDEX "_lessons_v_version_assignment_rubric_order_idx" ON "_lessons_v_version_assignment_rubric" USING btree ("_order" int4_ops);--> statement-breakpoint
CREATE INDEX "_lessons_v_version_assignment_rubric_parent_id_idx" ON "_lessons_v_version_assignment_rubric" USING btree ("_parent_id" int4_ops);--> statement-breakpoint
CREATE INDEX "_lessons_v_version_assignment_allowed_file_types_order_idx" ON "_lessons_v_version_assignment_allowed_file_types" USING btree ("order" int4_ops);--> statement-breakpoint
CREATE INDEX "_lessons_v_version_assignment_allowed_file_types_parent_idx" ON "_lessons_v_version_assignment_allowed_file_types" USING btree ("parent_id" int4_ops);--> statement-breakpoint
CREATE INDEX "_lessons_v_version_discussion_guidelines_order_idx" ON "_lessons_v_version_discussion_guidelines" USING btree ("_order" int4_ops);--> statement-breakpoint
CREATE INDEX "_lessons_v_version_discussion_guidelines_parent_id_idx" ON "_lessons_v_version_discussion_guidelines" USING btree ("_parent_id" int4_ops);--> statement-breakpoint
CREATE INDEX "payload_locked_documents_created_at_idx" ON "payload_locked_documents" USING btree ("created_at" timestamptz_ops);--> statement-breakpoint
CREATE INDEX "payload_locked_documents_global_slug_idx" ON "payload_locked_documents" USING btree ("global_slug" text_ops);--> statement-breakpoint
CREATE INDEX "payload_locked_documents_updated_at_idx" ON "payload_locked_documents" USING btree ("updated_at" timestamptz_ops);--> statement-breakpoint
CREATE INDEX "payload_locked_documents_rels_achievements_id_idx" ON "payload_locked_documents_rels" USING btree ("achievements_id" int4_ops);--> statement-breakpoint
CREATE INDEX "payload_locked_documents_rels_badges_id_idx" ON "payload_locked_documents_rels" USING btree ("badges_id" int4_ops);--> statement-breakpoint
CREATE INDEX "payload_locked_documents_rels_courses_id_idx" ON "payload_locked_documents_rels" USING btree ("courses_id" int4_ops);--> statement-breakpoint
CREATE INDEX "payload_locked_documents_rels_enrollments_id_idx" ON "payload_locked_documents_rels" USING btree ("enrollments_id" int4_ops);--> statement-breakpoint
CREATE INDEX "payload_locked_documents_rels_leaderboards_id_idx" ON "payload_locked_documents_rels" USING btree ("leaderboards_id" int4_ops);--> statement-breakpoint
CREATE INDEX "payload_locked_documents_rels_lessons_id_idx" ON "payload_locked_documents_rels" USING btree ("lessons_id" int4_ops);--> statement-breakpoint
CREATE INDEX "payload_locked_documents_rels_levels_id_idx" ON "payload_locked_documents_rels" USING btree ("levels_id" int4_ops);--> statement-breakpoint
CREATE INDEX "payload_locked_documents_rels_media_id_idx" ON "payload_locked_documents_rels" USING btree ("media_id" int4_ops);--> statement-breakpoint
CREATE INDEX "payload_locked_documents_rels_modules_id_idx" ON "payload_locked_documents_rels" USING btree ("modules_id" int4_ops);--> statement-breakpoint
CREATE INDEX "payload_locked_documents_rels_order_idx" ON "payload_locked_documents_rels" USING btree ("order" int4_ops);--> statement-breakpoint
CREATE INDEX "payload_locked_documents_rels_parent_idx" ON "payload_locked_documents_rels" USING btree ("parent_id" int4_ops);--> statement-breakpoint
CREATE INDEX "payload_locked_documents_rels_path_idx" ON "payload_locked_documents_rels" USING btree ("path" text_ops);--> statement-breakpoint
CREATE INDEX "payload_locked_documents_rels_points_id_idx" ON "payload_locked_documents_rels" USING btree ("points_id" int4_ops);--> statement-breakpoint
CREATE INDEX "payload_locked_documents_rels_progress_id_idx" ON "payload_locked_documents_rels" USING btree ("progress_id" int4_ops);--> statement-breakpoint
CREATE INDEX "payload_locked_documents_rels_streaks_id_idx" ON "payload_locked_documents_rels" USING btree ("streaks_id" int4_ops);--> statement-breakpoint
CREATE INDEX "payload_locked_documents_rels_student_settings_id_idx" ON "payload_locked_documents_rels" USING btree ("student_settings_id" int4_ops);--> statement-breakpoint
CREATE INDEX "payload_locked_documents_rels_tenants_id_idx" ON "payload_locked_documents_rels" USING btree ("tenants_id" int4_ops);--> statement-breakpoint
CREATE INDEX "payload_locked_documents_rels_users_id_idx" ON "payload_locked_documents_rels" USING btree ("users_id" int4_ops);--> statement-breakpoint
CREATE INDEX "payload_preferences_created_at_idx" ON "payload_preferences" USING btree ("created_at" timestamptz_ops);--> statement-breakpoint
CREATE INDEX "payload_preferences_key_idx" ON "payload_preferences" USING btree ("key" text_ops);--> statement-breakpoint
CREATE INDEX "payload_preferences_updated_at_idx" ON "payload_preferences" USING btree ("updated_at" timestamptz_ops);--> statement-breakpoint
CREATE INDEX "payload_preferences_rels_order_idx" ON "payload_preferences_rels" USING btree ("order" int4_ops);--> statement-breakpoint
CREATE INDEX "payload_preferences_rels_parent_idx" ON "payload_preferences_rels" USING btree ("parent_id" int4_ops);--> statement-breakpoint
CREATE INDEX "payload_preferences_rels_path_idx" ON "payload_preferences_rels" USING btree ("path" text_ops);--> statement-breakpoint
CREATE INDEX "payload_preferences_rels_users_id_idx" ON "payload_preferences_rels" USING btree ("users_id" int4_ops);
*/