type TypeKey = 'a' | 'b'


export const setStorage = (key: TypeKey, value: any) => {
  localStorage.setItem(key, value);
}

export const getStorage = (key: TypeKey) => {
  return localStorage.getItem(key)
}
