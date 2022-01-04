import Theme from 'vitepress/dist/client/theme-default'
import Components from '@components/index'
import TDesign from 'tdesign-vue-next'

export default {
  ...Theme,
  enhanceApp({ app }) {
    app.use(TDesign)
    Components.forEach(({ name, component }) => app.component(name, component))
  }
}  
