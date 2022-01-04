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

const config = {
  themeConfig: {
    sidebar,
  }
}

export default config
