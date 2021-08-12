//https://www.acmicpc.net/problem/1026
let _ = readLine()
var A = readLine()!.split(separator: " ").compactMap{Int(String($0))}
var B = readLine()!.split(separator: " ").compactMap{Int(String($0))}
A.sort()
B.sort()
B.reverse()
var sum = 0
for i in 0..<A.count {
    sum += A[i]*B[i]
}
print(sum)
