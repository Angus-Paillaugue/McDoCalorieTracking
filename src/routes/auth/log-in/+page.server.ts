import { UserDAO } from '$lib/server/db/user';
import bcrypt from 'bcryptjs';
import type { Actions } from './$types';
import { generateAccessToken } from '$lib/server/auth';
import { fail, redirect } from '@sveltejs/kit';

export const actions: Actions = {
  logIn: async ({ request, cookies }) => {
    const formData = Object.fromEntries(await request.formData());
    const { username, password } = formData as { username: string; password: string };

    try {
      const user = await UserDAO.getUserByUsername(username);
      const compare = await bcrypt.compare(password, user.passwordHash);

      if (!compare) {
        return fail(400, { action: 'logIn', error: 'Invalid username or password' });
      }

      cookies.set('token', generateAccessToken(user.id), {
        path: '/',
        maxAge: 60 * 60 * 24 * 30,
      });
      redirect(303, '/app');
    } catch (error) {
      console.error('Error logging user :', error);
      return fail(400, {
        action: 'logIn',
        error: error instanceof Error ? error.message : String(error),
      });
    }
  },
};
