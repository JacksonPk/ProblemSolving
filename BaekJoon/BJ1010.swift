//https://www.acmicpc.net/problem/1010

func combination(n: Int, m: Int) -> Int {
    /*조합함수
     m! / (m-n)!*n!
     m = 28부터는 Swift runtime failure: arithmetic overflow -> DP 이용
     mCn = (m)/(m-n)* m-1Cn 점화식을 이용.
     */
    if n==m {
        return 1
    }
    var arr = Array(repeating: 1, count: m-n+1)
    
    for i in 1..<arr.count {
        arr[i] = ((i+n)*arr[i-1])/i
    }
    return arr.last!
}

for _ in 0..<Int(readLine()!)! {
    let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
    print(combination(n: input[0], m: input[1]))
}
