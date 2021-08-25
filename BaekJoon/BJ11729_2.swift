//https://www.acmicpc.net/problem/11729

let N = Int(readLine()!)!
var result = ""
func recursion(from: Int, to: Int, n: Int) {
    if n == 1 {
        result.write("\(from) \(to)\n")
        return
    }
    recursion(from: from, to: 6-from-to, n: n-1)
    result.write("\(from) \(to)\n")
    recursion(from: 6-from-to, to: to, n: n-1)
}

recursion(from: 1, to: 3, n: N)
print((1 << N)-1)
print(result)
