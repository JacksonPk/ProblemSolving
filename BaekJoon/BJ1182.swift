//https://www.acmicpc.net/problem/1182

let ns = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let getArr = readLine()!.split(separator: " ").compactMap{Int(String($0))}

let n = ns[0]
let s = ns[1]
var isUsed = Array(repeating: false, count: n)
var sumArr = [Int]()
var count = 0

//공집합을 빼고 1개부터 n.count까지 다 더해서 확인하기.
func getSum(index: Int) {
    for i in index..<n {
        if isUsed[i] == false {
            isUsed[i] = true
            sumArr.append(getArr[i])
            getSum(index: i+1)
            isUsed[i] = false
            sumArr.removeLast()
        }
    }
    if sumArr.count != 0 && sumArr.reduce(0, {$0 + $1}) == s { //base
        count += 1
    }
}

getSum(index: 0)
print(count)
