import { pgTable, serial, text, timestamp, uuid, boolean, integer } from 'drizzle-orm/pg-core';

export const achievements = pgTable('achievements', {
  id: serial('id').primaryKey(),
  tenantId: integer('tenant_id').notNull(),
  name: text('name').notNull(),
  description: text('description').notNull(),
  type: text('type').notNull(),
  criteria: text('criteria').notNull(),
  badgeId: integer('badge_id').notNull(),
  points: integer('points').notNull(),
  secret: boolean('secret').default(false),
  isGlobal: boolean('is_global').default(false),
  category: text('category').notNull(),
  order: integer('order').notNull(),
  createdAt: timestamp('created_at').defaultNow().notNull(),
  updatedAt: timestamp('updated_at').defaultNow().notNull(),
});

export const userAchievements = pgTable('user_achievements', {
  id: serial('id').primaryKey(),
  userId: integer('user_id').notNull(),
  achievementId: integer('achievement_id').notNull(),
  completedAt: timestamp('completed_at').defaultNow(),
});
