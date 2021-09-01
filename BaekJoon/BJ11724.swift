//https://www.acmicpc.net/problem/11724

let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let N = input[0]
let M = input[1]
var isVisited = Array(repeating: false, count: N+1) //index 1부터 시작하기 위해서
var hashMap = [Int:[Int]]()
var count = 0

//입력
for _ in 0 ..< M {
    let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
    if hashMap[input[0]] == nil {
        hashMap[input[0]] = [input[1]]
    } else {
        hashMap[input[0]]!.append(input[1])
    }
    if hashMap[input[1]] == nil {
        hashMap[input[1]] = [input[0]]
    } else {
        hashMap[input[1]]!.append(input[0])
    }
}
//dfs
func dfs(node: Int) {
    isVisited[node] = true
    if hashMap[node] == nil { return }
    for i in 0..<hashMap[node]!.count where isVisited[hashMap[node]![i]] == false {
        dfs(node: hashMap[node]![i])
    }
}

for i in 1...N where isVisited[i] == false {
    dfs(node: i)
    count += 1
}

//출력
print(count)

