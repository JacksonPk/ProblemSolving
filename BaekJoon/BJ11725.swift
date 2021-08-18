//https://www.acmicpc.net/problem/11725
let N = Int(readLine()!)!
var hashMap = [Int:[Int]]()
var arr = Array(repeating: 0, count: N+1) //2부터 시작하게하기
var result = ""
for _ in 0..<(N-1) {
    let nodes = readLine()!.split(separator: " ").compactMap{Int(String($0))}
    if hashMap[nodes[0]] == nil {
        hashMap[nodes[0]] = [nodes[1]]
    }else {
        hashMap[nodes[0]]?.append(nodes[1])
    }
    if hashMap[nodes[1]] == nil {
        hashMap[nodes[1]] = [nodes[0]]
    }else {
        hashMap[nodes[1]]?.append(nodes[0])
    }
}
var parents = [1] //root num
while !parents.isEmpty {
    let p = parents.removeLast()
    var childs = hashMap[p]
    while !childs!.isEmpty {
        let num = childs!.removeLast()
        if arr[num] == 0 && num != 1{
            arr[num] = p
            parents.append(num)
        }
    }
}
for i in 2...N {
    result.write(String(arr[i])+"\n")
}
print(result)
