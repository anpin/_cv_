import { defineConfig } from 'astro/config';
import path from "node:path";
import { fileURLToPath } from "node:url";
import nodeResolve from '@rollup/plugin-node-resolve';

// https://astro.build/config
import tailwind from '@astrojs/tailwind';
import fable from "vite-plugin-fable";

const currentDir = path.dirname(fileURLToPath(import.meta.url));
const fsproj = path.join(currentDir, "sketches/Sketches.fsproj");

// https://astro.build/config
export default defineConfig({
  output: 'static',
  integrations: [tailwind()],
  vite: {
    plugins: [
      // fable({ fsproj }),
      nodeResolve({
        modulePaths: ['node_modules']
      })
    ],
    build: {
      rollupOptions: {
        plugins: [
          nodeResolve({
            modulePaths: ['node_modules']
          })
        ]
      }
    },
    resolve: {
      alias: {
        'p5': 'p5/lib/p5.min.js',
        'p5_2': 'p5/lib/p5.min.js'
      }
    },
    optimizeDeps: {
      include: ['p5']
    },
    ssr: {
      external: ['svgo'],
    },
  },
  devToolbar: {
    enabled: false
  }
});
