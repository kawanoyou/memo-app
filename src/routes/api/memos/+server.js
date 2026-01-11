import { json } from '@sveltejs/kit';
import { getAllMemos, createMemo } from '$lib/db.js';

// メモ一覧取得
export async function GET() {
  const memos = await getAllMemos();
  return json(memos);
}

// メモ作成
export async function POST({ request }) {
  const { title, content } = await request.json();
  const id = await createMemo(title, content);
  return json({ id, title, content }, { status: 201 });
}
