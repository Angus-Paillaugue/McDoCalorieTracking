import type { LayoutServerLoad } from './$types';

export const load = (async ({ locals, cookies }) => {
  if (!locals?.user) {
    throw new Error('User is required');
  }

  return { user: locals.user, sidebarState: cookies.get('sidebarState') || 'open' };
}) satisfies LayoutServerLoad;
