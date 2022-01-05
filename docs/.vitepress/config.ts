import { UserConfig } from 'vite'

const sidebar = {
  '/': [
    { text: '快速开始', link: '/' },
    {
      text: '目标',
      link: '/target/index.html',
      children: [
        { text: '2022', link: '/target/2022' },
      ]
    }, {
      text: '文章',
      link: '/article/index.html',
      children: [
        { text: '2022', link: '/article/2022' },
      ]
    },
  ]
}

interface TypeConfig {
  vite?: UserConfig
  [key: string]: any
}

// https://github.com/vuejs/vitepress/blob/main/src/node/config.ts#L15
const config: TypeConfig = {
  themeConfig: {
    sidebar,
  },
}

export default config
