//https://www.acmicpc.net/problem/15954
import Foundation


func stdev(elements : [Int]) -> Double {
    let avg = elements.reduce(0, +)/elements.count
    var sumOfDeviation : Double = 0
    var varience : Double = 0
        
    for element in elements {
        print("curr elem = ",element)
        sumOfDeviation += pow(Double((element - avg)), 2)
    }
    varience = sumOfDeviation / Double(elements.count)
    
    print("avg : ",avg)
    print("sumOfDeviation : ",sumOfDeviation)
    print("varience : ",varience)
    return varience.squareRoot()
}
var min = 0
var arr : [Int] = []


let inputNandK = readLine()!.split(separator: " ").compactMap{Int($0)}
let n = inputNandK[0]
let k = inputNandK[1]
let inputArr = readLine()!.split(separator: " ").compactMap{Int($0)}

for i in 0...n-k {

    arr = []
//    print("===============================")
    for j in i..<n {
        arr.append(inputArr[j])
        
        if arr.count >= k {
            print(arr)
            print(stdev(elements: arr))
        }
    }
//    print(arr)
    
}


// 부르트 포스 개념 적용해야함 :  k가 3이 최소일뿐 n까지 모두 봐야한다.
//5 3
//1 2 3 3 1
