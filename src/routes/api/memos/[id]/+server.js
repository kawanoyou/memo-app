import { json } from '@sveltejs/kit';
import { getMemo, updateMemo, deleteMemo } from '$lib/db.js';

// メモ1件取得
export async function GET({ params }) {
  const memo = await getMemo(params.id);
  if (!memo) {
    return json({ error: 'メモが見つかりません' }, { status: 404 });
  }
  return json(memo);
}

// メモ更新
export async function PUT({ params, request }) {
  const { title, content } = await request.json();
  await updateMemo(params.id, title, content);
  return json({ id: params.id, title, content });
}

// メモ削除
export async function DELETE({ params }) {
  await deleteMemo(params.id);
  return json({ success: true });
}
