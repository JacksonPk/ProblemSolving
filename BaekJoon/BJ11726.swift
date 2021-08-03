//https://www.acmicpc.net/problem/11726

let N = Int(readLine()!)!
var possibility = [1,2] //2x1 = 1가지, 2x2 = 2가지

func DP(cols: Int) -> Int {
    if cols-1 <= 1 {
        return possibility[cols-1]
    }
    for i in 2..<cols {
        possibility.append((possibility[i-1] + possibility[i-2]) % 10007)
    }
    return (possibility[cols-1])
}
print(DP(cols: N))
