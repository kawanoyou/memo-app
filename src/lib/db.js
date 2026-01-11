import { createClient } from '@libsql/client';
import { TURSO_DATABASE_URL, TURSO_AUTH_TOKEN } from '$env/static/private';

// Tursoクライアントの作成
const db = createClient({
  url: TURSO_DATABASE_URL,
  authToken: TURSO_AUTH_TOKEN
});

// テーブルの初期化
async function initDatabase() {
  await db.execute(`
    CREATE TABLE IF NOT EXISTS memos (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT NOT NULL,
      content TEXT NOT NULL,
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
    )
  `);
}

// 初期化を実行
initDatabase().catch(console.error);

// メモを全件取得
export async function getAllMemos() {
  const result = await db.execute('SELECT * FROM memos ORDER BY updated_at DESC');
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

// メモを作成
export async function createMemo(title, content) {
  const result = await db.execute({
    sql: 'INSERT INTO memos (title, content) VALUES (?, ?)',
    args: [title, content]
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
