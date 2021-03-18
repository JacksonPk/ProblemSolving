//https://programmers.co.kr/learn/courses/30/lessons/68644

import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var temp = [Int]()
    for firstIdx in 0 ..< numbers.count {
        for secondIdx in firstIdx+1 ..< numbers.count {
            temp.append(numbers[firstIdx] + numbers[secondIdx])
        }
    }
    return Array(Set(temp)).sorted()
}

