//https://www.acmicpc.net/problem/15954

// 부르트 포스 개념 적용해야함 :  k가 3이 최소일뿐 n까지 모두 봐야한다.
import Foundation

var min = -1.0
var arr : [Int] = []


func stdev(elements : [Int]) -> Double {
    let avg : Double = Double(elements.reduce(0, +))/Double(elements.count)
    var sumOfDeviation : Double = 0
    var varience : Double = 0
    
    for element in elements {
        sumOfDeviation += pow(Double((Double(element) - avg)), 2)
    }
    varience = sumOfDeviation / Double(elements.count)
    
    return varience.squareRoot()
}


let inputNandK = readLine()!.split(separator: " ").compactMap{Int($0)}
let n = inputNandK[0]
let k = inputNandK[1]
let inputArr = readLine()!.split(separator: " ").compactMap{Int($0)}

for i in 0...n-k {
    
    var resultVal = 0.0
    arr = []
    
    for j in i..<n {
        arr.append(inputArr[j])
        if arr.count >= k {
            
            resultVal = stdev(elements: arr)
            if min == -1 || min > resultVal {
                
                min = resultVal
            }
        }
    }
    
}

print(min)
