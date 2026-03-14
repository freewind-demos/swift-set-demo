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
