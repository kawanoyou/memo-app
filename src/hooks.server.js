import { SvelteKitAuth } from '@auth/sveltekit';
import Google from '@auth/sveltekit/providers/google';
import { GOOGLE_CLIENT_ID, GOOGLE_CLIENT_SECRET, AUTH_SECRET } from '$env/static/private';
import { upsertUser } from '$lib/db/auth.js';

export const { handle } = SvelteKitAuth({
  providers: [
    Google({
      clientId: GOOGLE_CLIENT_ID,
      clientSecret: GOOGLE_CLIENT_SECRET
    })
  ],
  secret: AUTH_SECRET,
  trustHost: true,
  callbacks: {
    async signIn({ user, account, profile }) {
      if (account && user) {
        // ユーザー情報をデータベースに保存
        await upsertUser(user.id, user.email, user.name, user.image);
      }
      return true;
    },
    async session({ session, token }) {
      // セッションにユーザーIDを追加
      if (token?.sub) {
        session.user.id = token.sub;
      }
      return session;
    }
  }
});
