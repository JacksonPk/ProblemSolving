//https://www.acmicpc.net/problem/2512
import Foundation

let count = Int(readLine()!)!
var requestArr = readLine()!.split(separator: " ").compactMap{Int(String($0))}.sorted()
let budget = Int(readLine()!)!

func calc(by budget : Int) -> Int {
    requestArr.reduce(0){ $0 + min($1,budget)}
}

func maxBudget() -> Int {
    var sum = requestArr.reduce(0, +)
    
    if sum <= budget {
        return requestArr[count - 1]
    }else{
        var left = 1 //requestArr[0] 으로 하면 틀린생각.
        var right = requestArr[count - 1]
        var ans = 0 //최대 예산안 값
        
        while left<=right {
            let mid = (left+right) / 2
            sum = calc(by: mid)
            if  sum <= budget {
                left = mid + 1
                ans = mid
            }else {
                right = mid - 1
            }
        }
        return ans
    }
    
    
}

print(maxBudget())

//4
//120 110 140 150
//485

//4
//5 5 5 5
//4
