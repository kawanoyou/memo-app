import { createClient } from '@libsql/client';
import { TURSO_DATABASE_URL, TURSO_AUTH_TOKEN } from '$env/static/private';

// Tursoクライアントの作成
const db = createClient({
  url: TURSO_DATABASE_URL,
  authToken: TURSO_AUTH_TOKEN
});

// テーブルの初期化
async function initDatabase() {
  // ユーザーテーブル
  await db.execute(`
    CREATE TABLE IF NOT EXISTS users (
      id TEXT PRIMARY KEY,
      email TEXT NOT NULL UNIQUE,
      name TEXT,
      image TEXT,
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP
    )
  `);

  // セッションテーブル
  await db.execute(`
    CREATE TABLE IF NOT EXISTS sessions (
      id TEXT PRIMARY KEY,
      user_id TEXT NOT NULL,
      expires_at INTEGER NOT NULL,
      FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
    )
  `);

  // アカウントテーブル（OAuth情報）
  await db.execute(`
    CREATE TABLE IF NOT EXISTS accounts (
      id TEXT PRIMARY KEY,
      user_id TEXT NOT NULL,
      provider TEXT NOT NULL,
      provider_account_id TEXT NOT NULL,
      access_token TEXT,
      refresh_token TEXT,
      expires_at INTEGER,
      FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
      UNIQUE(provider, provider_account_id)
    )
  `);

  // メモテーブル（user_id追加版）
  await db.execute(`
    CREATE TABLE IF NOT EXISTS memos (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT NOT NULL,
      content TEXT NOT NULL,
      user_id TEXT NOT NULL,
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
    )
  `);
}

// 初期化を実行
initDatabase().catch(console.error);

// メモを全件取得（ユーザーIDでフィルタ）
export async function getAllMemos(userId) {
  const result = await db.execute({
    sql: 'SELECT * FROM memos WHERE user_id = ? ORDER BY updated_at DESC',
    args: [userId]
  });
  return result.rows;
}

// メモを1件取得
export async function getMemo(id) {
  const result = await db.execute({
    sql: 'SELECT * FROM memos WHERE id = ?',
    args: [id]
  });
  return result.rows[0];
}

// メモを作成（ユーザーID付き）
export async function createMemo(userId, title, content) {
  const result = await db.execute({
    sql: 'INSERT INTO memos (user_id, title, content) VALUES (?, ?, ?)',
    args: [userId, title, content]
  });
  return result.lastInsertRowid;
}

// メモを更新
export async function updateMemo(id, title, content) {
  const result = await db.execute({
    sql: 'UPDATE memos SET title = ?, content = ?, updated_at = CURRENT_TIMESTAMP WHERE id = ?',
    args: [title, content, id]
  });
  return result;
}

// メモを削除
export async function deleteMemo(id) {
  const result = await db.execute({
    sql: 'DELETE FROM memos WHERE id = ?',
    args: [id]
  });
  return result;
}

export default db;
