import { drizzle } from 'drizzle-orm/postgres-js'
import postgres from 'postgres'
import { achievements, userAchievements } from './db/schema/schema'

const connectionString = process.env.DATABASE_URL!

const client = postgres(connectionString, { max: 1 })

export const db = drizzle(client, {
  schema: {
    achievements,
    userAchievements,
  },
})
