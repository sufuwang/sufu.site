<template>
  <t-checkbox class="item_container">
    <t-popup
      class="placement right-full align"
      content="这是popup内容"
      placement="right"
      show-arrow
      destroy-on-close
    >
      <span class="slot"><slot></slot></span>
    </t-popup>
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
.item_container {
  // width: calc(100% - 30px);
  padding: 4px 8px;
  :deep(.t-checkbox__label) {
    // width: 100%;
  }
  .slot {
    // width: 100%;
    display: inline-block;
    word-wrap: break-word;
    color: black;
    font-weight: v-bind(fontWeight);
    text-decoration: v-bind(textDecoration);
  }
}
</style>
