import { browser, dev } from '$app/environment';
import chalk from 'chalk';

const loggerLevels = ['error', 'warn', 'debug'] as const;

const loggerFactory = () => {
  const prefix = '[i18n]:';
  const color = '#f96743';

  return Object.fromEntries(
    loggerLevels.map((l) => {
      const styledPrefix = browser
        ? [`%c${prefix}`, `color: ${color}; font-weight: bold;`]
        : [chalk.hex(color).bold(prefix)];
      return [
        l,
        (...args: unknown[]) => {
          // Log everything in dev and only errors in prod
          if (dev || (!dev && loggerLevels.indexOf(l) <= 0)) console[l](...styledPrefix, ...args);
        },
      ];
    })
  );
};

export const logger = loggerFactory();
