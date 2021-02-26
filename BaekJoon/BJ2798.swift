//https://www.acmicpc.net/problem/2798
import Foundation


func combination(_ maxNum : Int, _ intArr : [Int]) -> Int{
//while , for 문 말고 다른게 있나?
    var nearestVal = 0
    
    for i in 0 ..< intArr.count - 2 {
        for j in i+1 ..< intArr.count - 1 {
            for k in j+1 ..< intArr.count {
                let value = intArr[i] + intArr[j] + intArr[k]
                if value > nearestVal , value <= maxNum {
                    nearestVal = value
                }
            }
        }
    }
    
    return nearestVal
}

//main
let firstInput = readLine()!.split(separator: " ").compactMap(){Int($0)}
let secondInput = readLine()!.split(separator: " ").compactMap(){Int($0)}

print(combination(firstInput[1], secondInput))

