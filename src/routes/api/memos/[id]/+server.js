import { json } from '@sveltejs/kit';
import { getMemo, updateMemo, deleteMemo } from '$lib/db.js';

// メモ1件取得
export async function GET({ params, locals }) {
  const session = await locals.auth();

  if (!session?.user) {
    return json({ error: '認証が必要です' }, { status: 401 });
  }

  const memo = await getMemo(params.id);

  if (!memo) {
    return json({ error: 'メモが見つかりません' }, { status: 404 });
  }

  if (memo.user_id !== session.user.id) {
    return json({ error: 'アクセス権限がありません' }, { status: 403 });
  }

  return json(memo);
}

// メモ更新
export async function PUT({ params, request, locals }) {
  const session = await locals.auth();

  if (!session?.user) {
    return json({ error: '認証が必要です' }, { status: 401 });
  }

  const memo = await getMemo(params.id);

  if (!memo || memo.user_id !== session.user.id) {
    return json({ error: 'アクセス権限がありません' }, { status: 403 });
  }

  const { title, content } = await request.json();
  await updateMemo(params.id, title, content);
  return json({ id: params.id, title, content });
}

// メモ削除
export async function DELETE({ params, locals }) {
  const session = await locals.auth();

  if (!session?.user) {
    return json({ error: '認証が必要です' }, { status: 401 });
  }

  const memo = await getMemo(params.id);

  if (!memo || memo.user_id !== session.user.id) {
    return json({ error: 'アクセス権限がありません' }, { status: 403 });
  }

  await deleteMemo(params.id);
  return json({ success: true });
}
