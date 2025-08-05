import { exists, readFile } from 'fs/promises';
import type { Product } from '../src/lib/types';
import { join } from 'path';

export const HERE = import.meta.url.startsWith('file:')
  ? new URL('.', import.meta.url).pathname
  : process.cwd();
export const MAP_PATH = join(HERE, '../src/data/map.json');
export const DOWNLOAD_PATH = join(HERE, '../static/assets/');

export async function loadMap() {
  if (!exists(MAP_PATH)) throw new Error(`Map file not found at path: ${MAP_PATH}`);
  const fileContent = await readFile(MAP_PATH, 'utf-8');
  const json: Product[] = JSON.parse(fileContent);
  return json;
}
