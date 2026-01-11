<script>
  import { signIn, signOut } from '@auth/sveltekit/client';

  let { data, children } = $props();
  let session = $derived(data.session);
</script>

<div class="app">
  <header>
    <nav class="container">
      <h1>メモアプリ</h1>
      {#if session?.user}
        <div class="user-info">
          {#if session.user.image}
            <img src={session.user.image} alt="Avatar" class="avatar" />
          {/if}
          <span class="user-name">{session.user.name || session.user.email}</span>
          <button onclick={() => signOut()} class="btn-logout">
            ログアウト
          </button>
        </div>
      {/if}
    </nav>
  </header>

  <main>
    {@render children()}
  </main>
</div>

<style>
  :global(body) {
    margin: 0;
    padding: 0;
    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen,
      Ubuntu, Cantarell, sans-serif;
    background-color: #f5f5f5;
  }

  .app {
    min-height: 100vh;
    display: flex;
    flex-direction: column;
  }

  header {
    background: white;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    position: sticky;
    top: 0;
    z-index: 100;
  }

  nav {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 15px 20px;
    max-width: 800px;
    margin: 0 auto;
    width: 100%;
  }

  nav h1 {
    margin: 0;
    font-size: 1.5rem;
    color: #333;
  }

  .user-info {
    display: flex;
    align-items: center;
    gap: 12px;
  }

  .avatar {
    width: 36px;
    height: 36px;
    border-radius: 50%;
    border: 2px solid #eee;
  }

  .user-name {
    color: #555;
    font-size: 0.95rem;
  }

  .btn-logout {
    padding: 8px 16px;
    background: #dc3545;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 0.9rem;
    transition: background-color 0.2s;
  }

  .btn-logout:hover {
    background: #c82333;
  }

  main {
    flex: 1;
  }

  .container {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
  }
</style>
