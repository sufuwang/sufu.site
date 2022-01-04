import path from 'path'
import { defineConfig } from 'vite'
import vueJsx from '@vitejs/plugin-vue-jsx'

export default defineConfig({
  resolve: {
    alias: [
      { find: '@components', replacement: path.resolve(__dirname, '../components') },
    ]
  },
  plugins: [
    vueJsx({}),
  ],
})
