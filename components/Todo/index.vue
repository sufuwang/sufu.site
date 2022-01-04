<template>
  <Item
    v-for="(itme, index) in dataSource"
    :key="index"
    :isBold="itme.isBold"
    :textDecoration="itme.textDecoration"
  >
    {{ itme.content }}
  </Item>
</template>
<script lang="ts" setup>
import Item from './Item.vue'

interface TypeDataSource {
  isBold?: boolean
  textDecoration?: 'underline' | 'line-through'
  content: string
}
interface TypeProps {
  dataSource: Array<TypeDataSource>
}
const props = defineProps<TypeProps>()

</script>
