//https://www.acmicpc.net/problem/11659

let NM = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let N = NM[0]
let M = NM[1]

var arr = readLine()!.split(separator: " ").compactMap{Int(String($0))}
var totals = Array(repeating: 0, count: N+1)

//init preSum
totals[0] = 0
if totals.count > 1 {
    for i in 1..<totals.count {
        totals[i] = totals[i-1] + arr[i-1]
    }
}

func dp(i: Int, j: Int) -> Int {
    if i == j {
        return arr[i-1]
    }
    else {
        return totals[j] - totals[i-1]
    }
}

for _ in 0..<M {
    let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
    print(dp(i: input[0], j: input[1]))
}
