//https://www.acmicpc.net/problem/2156
//계단 오르기랑 같은 문제
//대신 처음과 끝을 선택할 이유는 없다.
let N = Int(readLine()!)!
var inArr = [Int]()
for _ in 0..<N {
    inArr.append(Int(readLine()!)!)
}

func dp() -> Int {
    var outArr = Array(repeating: 0, count: N)
    if N <= 2 {
        return inArr.reduce(0, {$0+$1})
    }
    outArr[0] = inArr[0]
    outArr[1] = inArr[0]+inArr[1]
    outArr[2] = max(inArr[0]+inArr[1],inArr[1]+inArr[2],inArr[0]+inArr[2])
    for i in 3..<N {
        /*
         ... A B C D 가 있을 때 D번째 인덱스에서 가장 누적합이 큰 케이스는
         max(A) + C + D
         max(B) + D
         max(C)
         max(C) - B + D
         */
        outArr[i] = max(outArr[i-3]+inArr[i-1]+inArr[i], outArr[i-2]+inArr[i], outArr[i-1])
    }
    
    return outArr.last!
}
print(dp())



