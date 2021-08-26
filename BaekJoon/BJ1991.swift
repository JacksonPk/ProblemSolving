//https://www.acmicpc.net/problem/1991

var hashMap = [String:[String]]()
let N = Int(readLine()!)!


func preorder(parent: String) {
    print(parent,terminator: "")
    
    let left = hashMap[parent]![0]
    let right = hashMap[parent]![1]
    if left != "." {
        preorder(parent: left)
    }
    if right != "." {
        preorder(parent: right)
    }
}
func inorder(parent: String) {
    
    let left = hashMap[parent]![0]
    let right = hashMap[parent]![1]
    if left != "." {
        inorder(parent: left)
    }
    print(parent,terminator: "")
    
    if right != "." {
        inorder(parent: right)
    }
}
func postorder(parent: String) {
    
    let left = hashMap[parent]![0]
    let right = hashMap[parent]![1]
    if left != "." {
        postorder(parent: left)
    }
    if right != "." {
        postorder(parent: right)
    }
    print(parent,terminator: "")
}

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").compactMap{String($0)}
    hashMap[input[0]] = [input[1],input[2]]
}

preorder(parent: "A")
print()
inorder(parent: "A")
print()
postorder(parent: "A")
