//https://www.acmicpc.net/problem/3079

let nm = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let n = nm[0]
let m = nm[1]
var tasks = [Int]()
for _ in 0..<n {
    tasks.append(Int(readLine()!)!)
}

tasks.sort()

func totalPass(in time: Int) -> Int {
    tasks.reduce(0){$0 + (time / $1)}
}
func binarySearch() -> Int {
    var ans = 0
    var left = 0
    var right = tasks[0] * m //가장 작은것만 사용한다고 가정했을 때
    
    while left <= right {
        let mid = (left + right) / 2
        let total = totalPass(in: mid)
        if total < m {
            left = mid + 1
        }else {
            ans = mid
            right = mid - 1
        }
    }
    return ans
}
print(binarySearch())

