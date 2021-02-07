//https://www.acmicpc.net/problem/2748

import Foundation


var fibArr = [Int](repeating: -1, count: 91)
//print(fibArr)
fibArr[0] = 0
fibArr[1] = 1

@discardableResult
func fib(_ input : Int) -> Int {
    if input <= 1 {
        return fibArr[input]
    }else{
        if fibArr[input] != -1 {
            return fibArr[input]
        }else{
            fibArr[input] = fib(input - 1) + fib(input - 2)
            return fibArr[input]
        }
    }
}


//print(fibArr.count)
let input = Int(readLine()!)!
fib(input)
print(fibArr[input])


//print(fibArr[90])


