import sharp from 'sharp';
import { readFileSync } from 'fs';

const svg = readFileSync('./static/favicon.svg');

// 32x32 favicon.png
await sharp(svg)
  .resize(32, 32)
  .png()
  .toFile('./static/favicon.png');

console.log('✓ favicon.png (32x32) generated');

// 180x180 apple-touch-icon.png
await sharp(svg)
  .resize(180, 180)
  .png()
  .toFile('./static/apple-touch-icon.png');

console.log('✓ apple-touch-icon.png (180x180) generated');

// 192x192 for Android
await sharp(svg)
  .resize(192, 192)
  .png()
  .toFile('./static/icon-192.png');

console.log('✓ icon-192.png (192x192) generated');

// 512x512 for Android
await sharp(svg)
  .resize(512, 512)
  .png()
  .toFile('./static/icon-512.png');

console.log('✓ icon-512.png (512x512) generated');

console.log('\nAll favicons generated successfully!');
