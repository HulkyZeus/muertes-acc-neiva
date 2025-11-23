import { fileURLToPath, URL } from 'node:url'

import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import vueDevTools from 'vite-plugin-vue-devtools'
import tailwindcss from '@tailwindcss/vite'

// https://vite.dev/config/
export default defineConfig({
  plugins: [
    vue(),
    vueDevTools(),
    tailwindcss(),

  ],
  resolve: {
      alias: {
        // Define el alias @/ apuntando a la carpeta src
        '@': fileURLToPath(new URL('./src', import.meta.url))
      }
    }
})
