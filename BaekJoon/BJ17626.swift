//https://www.acmicpc.net/problem/17626
import Foundation
var arr = Array(repeating: 4, count: Int(readLine()!)! + 1)

func dp() -> Int {
    arr[0] = 0
    for i in 1..<arr.count {
        let sqrtNum = Int(sqrt(Double(i)))
        if i == sqrtNum*sqrtNum {
            arr[i] = 1
            continue
        }
        for j in 1...sqrtNum {
            arr[i] = min(arr[i],1+arr[i-(j*j)]) //1은 선택한 제곱수.
        }
    }
    return arr.last!
}
print(dp())
