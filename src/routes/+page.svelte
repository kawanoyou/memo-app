<script>
  import { onMount } from 'svelte';

  let memos = $state([]);
  let title = $state('');
  let content = $state('');
  let editingId = $state(null);

  async function loadMemos() {
    const res = await fetch('/api/memos');
    memos = await res.json();
  }

  async function saveMemo() {
    if (!title.trim() || !content.trim()) return;

    if (editingId) {
      // 更新
      await fetch(`/api/memos/${editingId}`, {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ title, content })
      });
      editingId = null;
    } else {
      // 新規作成
      await fetch('/api/memos', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ title, content })
      });
    }

    title = '';
    content = '';
    await loadMemos();
  }

  function editMemo(memo) {
    editingId = memo.id;
    title = memo.title;
    content = memo.content;
    window.scrollTo({ top: 0, behavior: 'smooth' });
  }

  function cancelEdit() {
    editingId = null;
    title = '';
    content = '';
  }

  async function deleteMemo(id) {
    if (!confirm('このメモを削除しますか？')) return;

    await fetch(`/api/memos/${id}`, {
      method: 'DELETE'
    });
    await loadMemos();
  }

  onMount(() => {
    loadMemos();
  });
</script>

<div class="container">
  <h1>メモアプリ</h1>

  <div class="memo-form">
    <h2>{editingId ? 'メモを編集' : '新しいメモ'}</h2>
    <input
      type="text"
      bind:value={title}
      placeholder="タイトル"
      class="input-title"
    />
    <textarea
      bind:value={content}
      placeholder="内容"
      class="input-content"
      rows="5"
    ></textarea>
    <div class="button-group">
      <button onclick={saveMemo} class="btn btn-primary">
        {editingId ? '更新' : '作成'}
      </button>
      {#if editingId}
        <button onclick={cancelEdit} class="btn btn-secondary">
          キャンセル
        </button>
      {/if}
    </div>
  </div>

  <div class="memo-list">
    <h2>メモ一覧</h2>
    {#if memos.length === 0}
      <p class="empty-message">メモがありません</p>
    {:else}
      {#each memos as memo (memo.id)}
        <div class="memo-item">
          <div class="memo-header">
            <h3>{memo.title}</h3>
            <div class="memo-actions">
              <button onclick={() => editMemo(memo)} class="btn-small btn-edit">
                編集
              </button>
              <button onclick={() => deleteMemo(memo.id)} class="btn-small btn-delete">
                削除
              </button>
            </div>
          </div>
          <p class="memo-content">{memo.content}</p>
          <p class="memo-date">
            更新日時: {new Date(memo.updated_at).toLocaleString('ja-JP')}
          </p>
        </div>
      {/each}
    {/if}
  </div>
</div>

<style>
  :global(body) {
    margin: 0;
    padding: 0;
    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen,
      Ubuntu, Cantarell, sans-serif;
    background-color: #f5f5f5;
  }

  .container {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
  }

  h1 {
    color: #333;
    text-align: center;
    margin-bottom: 30px;
  }

  h2 {
    color: #555;
    margin-bottom: 15px;
    font-size: 1.3rem;
  }

  .memo-form {
    background: white;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    margin-bottom: 30px;
  }

  .input-title {
    width: 100%;
    padding: 12px;
    border: 1px solid #ddd;
    border-radius: 4px;
    font-size: 1rem;
    margin-bottom: 10px;
    box-sizing: border-box;
  }

  .input-content {
    width: 100%;
    padding: 12px;
    border: 1px solid #ddd;
    border-radius: 4px;
    font-size: 1rem;
    margin-bottom: 15px;
    box-sizing: border-box;
    resize: vertical;
    font-family: inherit;
  }

  .button-group {
    display: flex;
    gap: 10px;
  }

  .btn {
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    font-size: 1rem;
    cursor: pointer;
    transition: background-color 0.2s;
  }

  .btn-primary {
    background-color: #007bff;
    color: white;
  }

  .btn-primary:hover {
    background-color: #0056b3;
  }

  .btn-secondary {
    background-color: #6c757d;
    color: white;
  }

  .btn-secondary:hover {
    background-color: #545b62;
  }

  .memo-list {
    background: white;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  }

  .empty-message {
    text-align: center;
    color: #999;
    padding: 20px;
  }

  .memo-item {
    border-bottom: 1px solid #eee;
    padding: 15px 0;
  }

  .memo-item:last-child {
    border-bottom: none;
  }

  .memo-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 10px;
  }

  .memo-header h3 {
    margin: 0;
    color: #333;
    font-size: 1.2rem;
  }

  .memo-actions {
    display: flex;
    gap: 8px;
  }

  .btn-small {
    padding: 6px 12px;
    border: none;
    border-radius: 4px;
    font-size: 0.85rem;
    cursor: pointer;
    transition: background-color 0.2s;
  }

  .btn-edit {
    background-color: #28a745;
    color: white;
  }

  .btn-edit:hover {
    background-color: #218838;
  }

  .btn-delete {
    background-color: #dc3545;
    color: white;
  }

  .btn-delete:hover {
    background-color: #c82333;
  }

  .memo-content {
    color: #666;
    line-height: 1.6;
    margin: 10px 0;
    white-space: pre-wrap;
  }

  .memo-date {
    font-size: 0.85rem;
    color: #999;
    margin: 5px 0 0 0;
  }
</style>
