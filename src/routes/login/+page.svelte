<script>
  import { signIn } from '@auth/sveltekit/client';
</script>

<div class="login-page">
  <div class="login-card">
    <div class="icon">
      <svg width="64" height="64" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
        <rect x="15" y="10" width="70" height="80" rx="5" fill="#4A90E2" stroke="#2E5C8A" stroke-width="2"/>
        <line x1="25" y1="30" x2="75" y2="30" stroke="white" stroke-width="2" stroke-linecap="round"/>
        <line x1="25" y1="45" x2="75" y2="45" stroke="white" stroke-width="2" stroke-linecap="round"/>
        <line x1="25" y1="60" x2="60" y2="60" stroke="white" stroke-width="2" stroke-linecap="round"/>
      </svg>
    </div>
    <h1>メモアプリ</h1>
    <p>メモを作成・管理するには<br />ログインが必要です</p>
    <button onclick={() => signIn('google', { callbackUrl: '/' })} class="btn-google">
      <svg width="18" height="18" viewBox="0 0 18 18" xmlns="http://www.w3.org/2000/svg">
        <path fill="#4285F4" d="M17.64 9.2c0-.637-.057-1.251-.164-1.84H9v3.481h4.844c-.209 1.125-.843 2.078-1.796 2.717v2.258h2.908c1.702-1.567 2.684-3.875 2.684-6.615z"/>
        <path fill="#34A853" d="M9.003 18c2.43 0 4.467-.806 5.956-2.184L12.05 13.56c-.806.54-1.836.86-3.047.86-2.344 0-4.328-1.584-5.036-3.711H.96v2.332C2.44 15.983 5.485 18 9.003 18z"/>
        <path fill="#FBBC05" d="M3.964 10.71c-.18-.54-.282-1.117-.282-1.71s.102-1.17.282-1.71V4.958H.957C.347 6.173 0 7.55 0 9s.348 2.827.957 4.042l3.007-2.332z"/>
        <path fill="#EA4335" d="M9.003 3.58c1.321 0 2.508.454 3.44 1.345l2.582-2.58C13.464.891 11.428 0 9.003 0 5.485 0 2.44 2.017.96 4.958L3.967 7.29c.708-2.127 2.692-3.71 5.036-3.71z"/>
      </svg>
      Googleでログイン
    </button>
  </div>
</div>

<style>
  .login-page {
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 80vh;
    padding: 20px;
  }

  .login-card {
    background: white;
    padding: 48px 40px;
    border-radius: 12px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    text-align: center;
    max-width: 400px;
    width: 100%;
  }

  .icon {
    margin-bottom: 24px;
    display: flex;
    justify-content: center;
  }

  h1 {
    color: #333;
    font-size: 2rem;
    margin: 0 0 16px 0;
  }

  p {
    color: #666;
    line-height: 1.6;
    margin: 0 0 32px 0;
  }

  .btn-google {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 12px;
    padding: 12px 32px;
    background: #4285f4;
    color: white;
    border: none;
    border-radius: 6px;
    font-size: 16px;
    font-weight: 500;
    cursor: pointer;
    width: 100%;
    transition: background-color 0.2s, box-shadow 0.2s;
  }

  .btn-google:hover {
    background: #357ae8;
    box-shadow: 0 2px 8px rgba(66, 133, 244, 0.3);
  }

  .btn-google svg {
    flex-shrink: 0;
  }
</style>
