import { translate } from '$lib/i18n';

type FormatDateOptions = {
  locale?: string;
};

export class DateUtils {
  static isSameDay(date1: Date, date2: Date): boolean {
    return (
      date1.getDate() === date2.getDate() &&
      date1.getMonth() === date2.getMonth() &&
      date1.getFullYear() === date2.getFullYear()
    );
  }

  static isSameMonth(date1: Date, date2: Date): boolean {
    return date1.getMonth() === date2.getMonth() && date1.getFullYear() === date2.getFullYear();
  }

  static isSameYear(date1: Date, date2: Date): boolean {
    return date1.getFullYear() === date2.getFullYear();
  }

  static isToday(date: Date): boolean {
    const today = new Date();
    return this.isSameDay(date, today);
  }

  static isYesterday(date: Date): boolean {
    const yesterday = new Date();
    yesterday.setDate(yesterday.getDate() - 1);
    return this.isSameDay(date, yesterday);
  }

  static formatDate(date: Date, p?: FormatDateOptions): string {
    const paramsDefaults: FormatDateOptions = { locale: 'en-US' };
    const params = { ...paramsDefaults, ...p };
    if (!date || isNaN(date.getTime())) {
      throw new Error('Invalid date provided');
    }
    const now = new Date();
    if (DateUtils.isSameDay(date, now)) {
      return translate('date.today', { locale: params.locale });
    }
    if (DateUtils.isYesterday(date)) {
      return translate('date.yesterday', { locale: params.locale });
    }
    const options: Intl.DateTimeFormatOptions = {
      month: 'long',
      day: 'numeric',
      year: this.isSameYear(date, now) ? undefined : 'numeric',
    };
    return date.toLocaleDateString(params.locale, options);
  }
}
