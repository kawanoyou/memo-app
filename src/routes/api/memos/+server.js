import { json } from '@sveltejs/kit';
import { getAllMemos, createMemo } from '$lib/db.js';

// メモ一覧取得
export async function GET({ locals }) {
  const session = await locals.auth();

  if (!session?.user) {
    return json({ error: '認証が必要です' }, { status: 401 });
  }

  const memos = await getAllMemos(session.user.id);
  return json(memos);
}

// メモ作成
export async function POST({ request, locals }) {
  const session = await locals.auth();

  if (!session?.user) {
    return json({ error: '認証が必要です' }, { status: 401 });
  }

  const { title, content } = await request.json();
  const id = await createMemo(session.user.id, title, content);
  return json({ id, title, content }, { status: 201 });
}
