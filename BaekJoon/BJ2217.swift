//https://www.acmicpc.net/problem/2217
//모든 로프를 사용해야 할 필요는 없으며, 임의로 몇 개의 로프를 골라서 사용해도 된다.

var arr = [Int]()
var max = 0
for _ in 0..<Int(readLine()!)! {
    arr.append(Int(readLine()!)!)
}
arr.sort()

while arr.count >= 1 {
    let curMax = arr[0] * (arr.count)
    if curMax > max {
        max = curMax
    }
    arr.removeFirst()
}
print(max)
