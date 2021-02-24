////https://www.acmicpc.net/problem/10872
import Foundation

func factorial(_ num : Int) -> Int {
    if num <= 1 {
        return 1
    }
    return num * factorial(num-1)
}

print(factorial(Int(readLine()!)!))
