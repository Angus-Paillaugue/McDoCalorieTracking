# 🍔 McDonald's Nutrition Facts Tracker

A modern, SvelteKit-powered web application to explore, filter, and analyze the nutritional values of McDonald's menu items. Instantly see calories, proteins, carbohydrates, lipids, and more for each product, with support for multiple languages and beautiful, responsive UI.

---

## 🚀 Features

- **Browse & Search**: Quickly find McDonald's products and view their detailed nutritional information.
- **Filter & Sort**: Filter by categories, sort by nutritional values or name.
- **Nutritional Breakdown**: See calories, proteins, carbs, sugars, lipids, saturated fats, fibers, salt, and Nutri-Score for each product.
- **Selection & Totals**: Select products and quantities to see total nutritional values for your meal.
- **Internationalization (i18n)**: Supports multiple languages with easy translation management.
- **Responsive Design**: Looks great on desktop and mobile.
- **Accessible**: Keyboard navigation and ARIA-friendly.
- **Dockerized**: Easy to build and deploy anywhere.
- **Database Migrations**: Managed with SQL migration scripts.
- **Automated Image Processing**: Product images are downloaded and converted to optimized WebP format.

---

## 🖥️ Tech Stack

- [SvelteKit](https://kit.svelte.dev/) & [Svelte](https://svelte.dev/)
- [TypeScript](https://www.typescriptlang.org/)
- [Tailwind CSS](https://tailwindcss.com/) for styling
- [PostgreSQL](https://www.postgresql.org/) for data storage
- [Docker](https://www.docker.com/) for containerization
- [Sharp](https://sharp.pixelplumbing.com/) for image processing
- [Lucide Icons](https://lucide.dev/) for SVG icons

---

## 🛠️ Getting Started

### Development

#### 1. Clone & Install

```sh
git clone https://github.com/Angus-Paillaugue/McDoCalorieTracking.git
cd McDoCalorieTracking
bun install
```

#### 2. Environment Setup

Copy `.env.example` to `.env` and fill in the required variables (see `.env`).

#### 3. Database

Start PostgreSQL (locally or via Docker):

```sh
docker compose up -d
```

Run migrations:

```sh
bun run db:migrate
```

Start the development server:

```sh
bun run dev
```

## 🌍 Internationalization

Translations are managed in [`src/lib/i18n/messages/`](src/lib/i18n/messages/).
Check for missing translations:

```sh
bun run i18n:check
```
