<template>
  <t-input placeholder="为未来新增一个 Todo 吧" @onChange="handleChange" />
</template>

<script lang="ts" setup>
import { ref } from "vue"

const inputRef = ref('')
const handleChange = (value: string) => inputRef.value = value;

defineExpose({
  value: inputRef.value
})

</script>

<style lang="less" scoped>

</style>
