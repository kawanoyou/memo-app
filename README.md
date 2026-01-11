# メモアプリ

SvelteKitとTurso（SQLite）を使ったシンプルなメモアプリ

## 機能

- メモの作成、編集、削除
- メモ一覧表示（更新日時の降順）
- Tursoによるデータ永続化

## セットアップ

### 1. 依存パッケージのインストール

```bash
npm install
```

### 2. Tursoのセットアップ

#### Turso CLIのインストール（初回のみ）

```bash
curl -sSfL https://get.tur.so/install.sh | bash
source ~/.zshrc  # またはsource ~/.bashrc
```

#### Tursoにログイン/サインアップ

```bash
# 新規ユーザーの場合
turso auth signup

# 既存ユーザーの場合
turso auth login
```

#### データベースを作成

```bash
turso db create memo-app
```

#### データベースのURLを取得

```bash
turso db show memo-app --url
```

#### 認証トークンを作成

```bash
turso db tokens create memo-app
```

### 3. 環境変数の設定

`.env`ファイルを作成し、以下の内容を記載：

```bash
TURSO_DATABASE_URL=libsql://your-database-url.turso.io
TURSO_AUTH_TOKEN=your-auth-token-here
```

上記の`your-database-url.turso.io`と`your-auth-token-here`を、先ほど取得した実際の値に置き換えてください。

### 4. 開発サーバーの起動

```bash
npm run dev
```

`http://localhost:5173/` でアプリにアクセスできます。

## デプロイ

### Vercelへのデプロイ（推奨）

1. GitHubリポジトリにプッシュ
2. [Vercel](https://vercel.com)でプロジェクトをインポート
3. 環境変数を設定：
   - `TURSO_DATABASE_URL`
   - `TURSO_AUTH_TOKEN`
4. デプロイボタンをクリック

設定は自動的に検出されるので、追加設定は不要です。

### その他のプラットフォーム（Render, Fly.io等）

これらのプラットフォームを使用する場合は、`@sveltejs/adapter-node`に変更する必要があります。

### Fly.ioへのデプロイ

1. Fly.io CLIをインストール
2. `fly launch`を実行
3. 環境変数を設定：
   ```bash
   fly secrets set TURSO_DATABASE_URL=your-url
   fly secrets set TURSO_AUTH_TOKEN=your-token
   ```
4. `fly deploy`

## 技術スタック

- [Svelte 5](https://svelte.dev/) - UIフレームワーク
- [SvelteKit](https://kit.svelte.dev/) - フルスタックフレームワーク
- [Turso](https://turso.tech/) - エッジSQLiteデータベース
- [@libsql/client](https://github.com/libsql/libsql-client-ts) - Tursoクライアントライブラリ

## ライセンス

ISC
