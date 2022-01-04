<template>
  <t-checkbox class="container">
    <slot></slot>
  </t-checkbox>
</template>
<script lang="ts" setup>
import { computed } from 'vue'

declare interface TypeItemProps {
  isBold?: boolean
  textDecoration?: 'underline' | 'line-through'
}
const props = defineProps<TypeItemProps>()
const fontWeight = computed(() => props.isBold ? 900 : 400)

</script>
<style lang="less" scoped>
.container {
  display: block;
  padding: 4px 8px;
  :deep(span) {
    color: black;
    font-weight: v-bind(fontWeight);
    text-decoration: v-bind(textDecoration);
  }
}
</style>
