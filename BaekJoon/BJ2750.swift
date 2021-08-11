//https://www.acmicpc.net/problem/2750

var arr = [Int]()
for _ in 0..<Int(readLine()!)! {
    arr.append(Int(readLine()!)!)
}
arr.sort()
arr.forEach { val in
    print(val)
}
