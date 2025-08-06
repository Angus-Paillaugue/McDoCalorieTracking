import { UserDAO } from '$lib/server/db/user';
import bcrypt from 'bcryptjs';
import type { Actions } from './$types';
import { generateAccessToken } from '$lib/server/auth';
import { fail, redirect } from '@sveltejs/kit';

export const actions: Actions = {
  signUp: async ({ request, cookies }) => {
    const formData = Object.fromEntries(await request.formData());
    const { username, password } = formData as { username: string; password: string };

    try {
      // Hash password
      const salt = await bcrypt.genSalt(10);
      const hash = await bcrypt.hash(password, salt);
      const createdUser = await UserDAO.createUser(username, hash);
      cookies.set('token', generateAccessToken(createdUser.id), {
        path: '/',
        maxAge: 60 * 60 * 24 * 30,
      });
    } catch (error) {
      console.error('Error creating user account :', error);
      return fail(400, {
        action: 'signUp',
        error: error instanceof Error ? error.message : String(error),
      });
    }

    throw redirect(303, '/app');
  },
};
