//https://programmers.co.kr/learn/courses/30/lessons/43165?language=swift
import Foundation

var count = 0
//var negativeNumbers : [Int] = []
//var flagNumbers : [Bool] = []
func solution(_ numbers:[Int], _ target:Int) -> Int {

    
    recursion(0,numbers, 1,target)
    recursion(0,numbers,-1,target)
    
    return count
}

func recursion(_ sum : Int, _ remainNumbers : [Int], _ addOrSub : Int, _ target : Int) {
    var numbers = remainNumbers
    var newSum = sum
    
    if addOrSub == 1 {
        newSum += numbers.removeFirst()
    }else{
        newSum -= numbers.removeFirst()
    }
    
    if numbers.isEmpty {
        if newSum == target {
            count += 1
            return
        }else{
            return
        }
    }else{
        recursion(newSum, numbers, 1, target)
        
        recursion(newSum, numbers, -1, target)
    }
}

print(solution([1,1,1,1,1], 3))


