import { z } from 'zod'
import { db } from '@/lib/db'
import { achievements, userAchievements } from '@/lib/db/schema/schema'
import { eq, and, inArray } from 'drizzle-orm'
import { checkProgress as checkAchievementProgress } from '@/lib/achievements/checkProgress'
import { auth } from '@/lib/auth'

const checkProgressSchema = z.object({
  achievementId: z.string().uuid(),
})

export async function checkProgress(input: z.infer<typeof checkProgressSchema>) {
  const { userId, tenantId } = await auth()
  if (!userId || !tenantId) {
    throw new Error('Unauthorized')
  }

  await checkAchievementProgress({
    achievementId: parseInt(input.achievementId),
    userId,
    tenantId,
  })
}

export async function getUserAchievements() {
  const { userId, tenantId } = await auth()
  if (!userId || !tenantId) {
    throw new Error('Unauthorized')
  }

  const userAchievementsList = await db.query.userAchievements.findMany({
    where: eq(userAchievements.userId, userId),
    with: {
      achievement: {
        with: {
          badge: true,
        },
      },
    },
    orderBy: (achievements, { desc }) => [
      desc(achievements.completedAt),
    ],
  })

  return userAchievementsList
}

export async function getAvailableAchievements() {
  const { userId, tenantId } = await auth()
  if (!userId || !tenantId) {
    throw new Error('Unauthorized')
  }

  // Get all achievements for tenant
  const availableAchievements = await db.query.achievements.findMany({
    where: and(
      eq(achievements.tenantId, tenantId),
      eq(achievements.isGlobal, false)
    ),
    with: {
      badge: true,
      prerequisites: true,
    },
    orderBy: (achievements, { asc }) => [
      asc(achievements.category),
      asc(achievements.order),
    ],
  })

  // Get user's completed achievements
  const completedAchievements = await db.query.userAchievements.findMany({
    where: eq(userAchievements.userId, userId),
  })

  const completedIds = new Set(completedAchievements.map(a => a.achievementId))

  // Filter out completed achievements and check prerequisites
  const filteredAchievements = availableAchievements.map(achievement => ({
    ...achievement,
    isCompleted: completedIds.has(achievement.id),
    prerequisitesMet: Array.isArray(achievement.prerequisites) ? (achievement.prerequisites as any[]).every(p => completedIds.has(p.id)) : false,
  }))

  return filteredAchievements
}

export async function getAchievementProgress(achievementId: string) {
  const { userId, tenantId } = await auth()
  if (!userId || !tenantId) {
    throw new Error('Unauthorized')
  }

  const achievement = await db.query.achievements.findFirst({
    where: and(
      eq(achievements.id, parseInt(achievementId)),
      eq(achievements.tenantId, tenantId)
    ),
  })

  if (!achievement) {
    throw new Error('Achievement not found')
  }

  const progress = await checkAchievementProgress({
    achievementId: parseInt(achievementId),
    userId,
    tenantId,
  })

  return {
    achievement,
    progress,
  }
}
