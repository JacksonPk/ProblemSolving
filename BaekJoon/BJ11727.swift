//https://www.acmicpc.net/problem/11727

let N = Int(readLine()!)!
var outArr = Array(repeating: 0, count: N+1)

func dp() -> Int{
    if N == 1 {
        return 1
    } else if N == 2 {
        return 3
    }
    outArr[1] = 1
    outArr[2] = 3 //1.2x1 2개, 2.1x2, 3.2x2 3개
    
    for i in 3...N {
        //이 점화식은 i칸에서 1칸을 뺀 나머지
        outArr[i] = (outArr[i-1]+2*outArr[i-2]) % 10007
    }
    return outArr.last!
}
print(dp())
