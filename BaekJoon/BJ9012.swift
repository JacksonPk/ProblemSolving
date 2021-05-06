//https://www.acmicpc.net/problem/9012

func isPS(with str: String) -> String {
    var count = 0
    let arrs = Array(str)
    
    for value in arrs {
        if value == "(" {
            count += 1
        }else if value == ")" {
            count -= 1
        }
        if count == -1 {
            return "NO"
        }
    }
    return count == 0 ? "YES" : "NO"
}
for _ in 0..<Int(readLine()!)! {
    print(isPS(with: readLine()!))
}
