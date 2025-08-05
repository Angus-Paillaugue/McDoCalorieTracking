import { exists, writeFile, mkdir, readdir, unlink } from 'fs/promises';
import { join } from 'path';
import sharp from 'sharp';
import { DOWNLOAD_PATH, loadMap } from './shared';

async function downloadImages() {
  const map = await loadMap();
  if (!(await exists(DOWNLOAD_PATH))) {
    await mkdir(DOWNLOAD_PATH, { recursive: true });
  }
  const imagePromises = map.map(async (product) => {
    if (product.image && product.image.startsWith('http')) {
      const ext = product.image.split('?')[0].split('.').pop();
      const imagePath = join(DOWNLOAD_PATH, `${product.id}.${ext}`);
      if (!(await exists(imagePath))) {
        try {
          const response = await fetch(product.image);
          if (!response.ok) {
            throw new Error(`Failed to download image for ${product.id}: ${response.statusText}`);
          }
          const buffer = await response.arrayBuffer();
          await writeFile(imagePath, Buffer.from(buffer));
          console.log(`Image for ${product.id} saved to ${imagePath}`);
        } catch (error) {
          console.error(`Error downloading image for ${product.id} (${product.image}) :`, error);
        }
      } else {
        console.log(`Image for ${product.id} already exists at ${imagePath}`);
      }
    }
  });

  await Promise.all(imagePromises);
}

async function transformImages() {
  const images = await readdir(DOWNLOAD_PATH);
  const transformPromises = images.map(async (image) => {
    const imagePath = join(DOWNLOAD_PATH, image);
    await sharp(imagePath)
      .webp({ quality: 80 })
      .toFile(imagePath.replace(/\.\w+$/, '.webp'));
    await unlink(imagePath);
  });

  await Promise.all(transformPromises);
  console.log('All images transformed to webp format');
}
downloadImages()
  .then(() => {
    console.log('All images downloaded successfully');
    return transformImages();
  })
  .catch((error) => {
    console.error('Error during image download or transformation:', error);
  });
