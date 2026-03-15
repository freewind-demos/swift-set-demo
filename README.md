# Swift 集合 Demo

## 简介

本示例演示 Swift 中集合（Set）的创建、基础操作和集合运算。集合是一种无序且不重复的数据结构，适用于需要去重或数学集合运算的场景。

## 基本原理

集合（Set）是数学中集合概念的编程实现，与数组和字典相比，集合有以下特点：

1. **无序性**：集合不记录元素的添加顺序
2. **唯一性**：集合中不会出现重复元素（自动去重）
3. **高性能查找**：查找元素的时间复杂度是 O(1)
4. **需实现 Hashable**：集合元素必须是可哈希的

Swift 集合的底层实现是哈希表，通过元素的哈希值快速定位和查找，这也是它高性能的原因。

## 启动和使用

### 环境要求

- macOS 系统（自带 Swift）
- 或从 https://swift.org/download/ 安装 Swift

### 安装和运行

```bash
cd swift-set-demo
swift run
```

### 预期输出

```
添加后: ["banana", "grape", "orange", "apple"]
删除后: ["grape", "orange", "apple"]
包含 apple: true

集合运算:
  A: [5, 2, 3, 1, 4]
  B: [8, 5, 6, 7, 4]
  并集: [5, 2, 3, 1, 4, 8, 6, 7]
  交集: [5, 4]
  A-B: [2, 3, 1]
  对称差: [2, 3, 1, 8, 6, 7]

遍历集合:
  apple
  grape
  orange
```

## 教程

### 什么是集合？

集合用于存储唯一元素的集合，自动去除重复项。适合用于：

- 去除数组中的重复元素
- 判断元素是否已存在
- 数学集合运算（并集、交集、差集）

```swift
// 创建集合
var fruits: Set = ["apple", "banana", "orange"]
let numbers: Set = [1, 2, 3, 4, 5]
```

注意：创建空集合必须显式声明类型，因为 `Set()` 和 `[:]` 看起来相似。

### 集合基础操作

```swift
// 添加元素
fruits.insert("grape")
// 如果添加已存在的元素，会被忽略

// 删除元素
fruits.remove("banana")
// 返回被删除的元素，如果不存在则返回 nil

// 检查包含
let hasApple = fruits.contains("apple")
// 返回 true 或 false
```

### 集合运算

集合运算是集合最强大的特性，让我们详细讲解：

**并集（Union）**：合并两个集合的所有元素

```swift
let setA: Set = [1, 2, 3, 4, 5]
let setB: Set = [4, 5, 6, 7, 8]
let union = setA.union(setB)
// 结果: [1, 2, 3, 4, 5, 6, 7, 8]
```

**交集（Intersection）**：两个集合共有的元素

```swift
let intersection = setA.intersection(setB)
// 结果: [4, 5]
```

**差集（Subtracting）**：属于A但不属于B的元素

```swift
let subtracting = setA.subtracting(setB)
// 结果: [1, 2, 3]
```

**对称差（Symmetric Difference）**：只属于其中一个集合的元素

```swift
let symmetricDiff = setA.symmetricDifference(setB)
// 结果: [1, 2, 3, 6, 7, 8]
```

### 判断集合关系

```swift
let setA: Set = [1, 2, 3]
let setB: Set = [1, 2, 3, 4, 5]

setA.isSubset(of: setB)      // true，A 是 B 的子集
setB.isSuperset(of: setA)     // true，B 是 A 的超集
setA.isDisjoint(with: setB)    // false，有交集
```

### 遍历集合

```swift
// 直接遍历（顺序不确定）
for fruit in fruits {
    print(fruit)
}

// 按排序顺序遍历
for fruit in fruits.sorted() {
    print(fruit)
}
```

### 常见问题和注意事项

1. **元素必须可哈希**：自定义类型需要实现 Hashable 协议
2. **无序性**：不要依赖集合的遍历顺序
3. **性能**：查找是 O(1)，但占用内存比数组大
4. **与数组去重的区别**：数组去重需要手动遍历，集合自动去重

## 关键代码详解

### main.swift 完整代码

```swift
// swift-set-demo.swift

// 创建集合
var fruits: Set = ["apple", "banana", "orange"]
let numbers: Set = [1, 2, 3, 4, 5]

// 添加元素
fruits.insert("grape")
print("添加后: \(fruits)")

// 删除元素
fruits.remove("banana")
print("删除后: \(fruits)")

// 检查包含
print("包含 apple: \(fruits.contains("apple"))")

// 集合运算
let setA: Set = [1, 2, 3, 4, 5]
let setB: Set = [4, 5, 6, 7, 8]

print("\n集合运算:")
print("  A: \(setA)")
print("  B: \(setB)")
print("  并集: \(setA.union(setB))")
print("  交集: \(setA.intersection(setB))")
print("  A-B: \(setA.subtracting(setB))")
print("  对称差: \(setA.symmetricDifference(setB))")

// 遍历
print("\n遍历集合:")
for fruit in fruits.sorted() {
    print("  \(fruit)")
}
```

### 核心代码解析

1. **创建集合**：`var fruits: Set = ["apple", "banana", "orange"]`
   - 显式声明 `Set` 类型
   - 如果不声明，Swift 会推断为 `[String]`

2. **insert()**：添加元素
   - 如果元素已存在，不做任何操作
   - 返回一个元组：(插入成功与否, 插入的元素)

3. **remove()**：删除元素
   - 返回被删除的元素值
   - 如果不存在，返回 nil

4. **contains()**：检查元素是否存在
   - 时间复杂度 O(1)

5. **集合运算方法**：
   - `union()`：并集
   - `intersection()`：交集
   - `subtracting()`：差集
   - `symmetricDifference()`：对称差

6. **sorted()**：返回排序后的数组
   - 集合本身无序，但可以转换为有序数组
