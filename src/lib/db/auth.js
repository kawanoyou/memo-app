import db from '../db.js';

// ユーザーを作成または更新
export async function upsertUser(id, email, name, image) {
  await db.execute({
    sql: `INSERT INTO users (id, email, name, image)
          VALUES (?, ?, ?, ?)
          ON CONFLICT(id) DO UPDATE SET
            email = excluded.email,
            name = excluded.name,
            image = excluded.image`,
    args: [id, email, name, image]
  });
}

// ユーザーをIDで取得
export async function getUserById(id) {
  const result = await db.execute({
    sql: 'SELECT * FROM users WHERE id = ?',
    args: [id]
  });
  return result.rows[0];
}

// ユーザーをメールアドレスで取得
export async function getUserByEmail(email) {
  const result = await db.execute({
    sql: 'SELECT * FROM users WHERE email = ?',
    args: [email]
  });
  return result.rows[0];
}
