import * as migration_20250329_085409 from './20250329_085409';

export const migrations = [
  {
    up: migration_20250329_085409.up,
    down: migration_20250329_085409.down,
    name: '20250329_085409'
  },
];
