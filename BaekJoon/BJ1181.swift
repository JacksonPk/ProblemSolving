//https://www.acmicpc.net/problem/1181

var arr = [String]()

for _ in 0..<Int(readLine()!)! {
    arr.append(readLine()!)
}
arr = Array(Set(arr))
arr = arr.sorted{ $0 < $1 }
arr = arr.sorted{ $0.count < $1.count }
arr.forEach { val in
    print(val)
}
