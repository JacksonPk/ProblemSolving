//https://programmers.co.kr/learn/courses/30/lessons/67256
import Foundation

func numPostion(_ number: Int) -> [Int] {
    switch number {
    case 1:
        return [0,0]
    case 2:
        return [0,1]
    case 3:
        return [0,2]
    case 4:
        return [1,0]
    case 5:
        return [1,1]
    case 6:
        return [1,2]
    case 7:
        return [2,0]
    case 8:
        return [2,1]
    case 9:
        return [2,2]
    case 0:
        return [3,1]
    
    default:
        return [-1,-1]
    }
}

func solution(_ numbers:[Int], _ hand:String) -> String {
    var leftPos = [3,0]
    var rightPos = [3,2]
    var result = ""
    for number in numbers {
        let numPos = numPostion(number)
        if number == 1 || number == 4 || number == 7 {
            leftPos = numPos
            result += "L"
        }else if number == 3 || number == 6 || number == 9 {
            rightPos = numPos
            result += "R"
        }else {
            let leftDistance = abs(numPos[0]-leftPos[0]) + abs(numPos[1]-leftPos[1])
            let rightDistance = abs(numPos[0]-rightPos[0]) + abs(numPos[1]-rightPos[1])
            
            if leftDistance < rightDistance {
                leftPos = numPos
                result += "L"
            }else if leftDistance > rightDistance {
                rightPos = numPos
                result += "R"
            }else {// leftDistance == rightDistance
                if hand == "left" {
                    leftPos = numPos
                    result += "L"
                }else {
                    rightPos = numPos
                    result += "R"
                }
            }
        }
    }
    return result
}

let numbers = [7, 0, 8, 2, 8, 3, 1, 5, 7, 6, 2]
let hand = "left"

print(solution(numbers, hand))
//"LRLLRRLLLRR"
