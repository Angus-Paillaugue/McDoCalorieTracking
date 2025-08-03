import { type Handle } from '@sveltejs/kit';
import { sequence } from '@sveltejs/kit/hooks';
import { defaultLocale, config as i18nConfig, locales, origin } from '$lib/i18n';
import { urlStartsWith } from '$lib/utils';

const NEED_AUTH_ROUTES: string[] = [];

const authHandler: Handle = async ({ event, resolve }) => {
	const { url } = event;

	const response = await resolve(event);
	response.headers.set(
		'X-Robots-Tag',
		urlStartsWith(url.pathname, NEED_AUTH_ROUTES) ? 'noindex, nofollow' : 'index, follow'
	);

	return response;
};

export const i18nHandler: Handle = async ({ event, resolve }) => {
	const { url, request, cookies } = event;

	origin.set(url.origin);

	let locale = cookies.get('locale');

	if (!locale) {
		// Get user preferred locale
		locale = `${`${request.headers.get('accept-language')}`.match(/^[a-z]{2}/i)}`.toLowerCase();

		// Set default locale if user preferred locale does not match
		if (!locales.includes(locale)) locale = defaultLocale;
	}

	const localeConfig = i18nConfig.loaders.find((l) => l.locale === locale);

	// Add html `lang` attribute
	event.locals.i18n = {
		lang: locale,
		dir: localeConfig!.dir || 'ltr'
	};

	return resolve(event, {
		transformPageChunk: ({ html }) =>
			html.replace('%lang%', locale).replace('%dir%', localeConfig!.dir || 'ltr')
	});
};

export const handle = sequence(i18nHandler, authHandler);
