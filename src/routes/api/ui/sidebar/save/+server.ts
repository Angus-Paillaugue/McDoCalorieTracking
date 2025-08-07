import { json } from '@sveltejs/kit';
import type { RequestHandler } from './$types';

export const POST: RequestHandler = async ({ cookies, request }) => {
  const body = await request.json();
  const state = body || 'open';
  cookies.set('sidebarState', state, {
    path: '/',
    expires: new Date(Date.now() + 60 * 60 * 24 * 1000 * 365),
  }); // 1 year expiration
  return json({ sidebarState: state });
};
