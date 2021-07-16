//https://programmers.co.kr/learn/courses/30/lessons/81303
//정확성만 맞춤. 효율성은 0
//배열로 푼 문제
//import Foundation

func solution(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
    var initVar = [Int]()
    var stackVar = [Int]()
    var cur = k
    var result = ""
    
    for idx in 0..<n {
        initVar.append(idx)
    }
    
    for val in cmd {
        
        let input = val.split(separator: " ").compactMap{String($0)}
        switch input[0] {
        case "U":
            cur -= Int(input[1])!
        case "D":
            cur += Int(input[1])!
        case "C":
            let val = initVar.remove(at: cur)
            
            stackVar.insert(val, at: 0)
            if cur == initVar.count { //마지막 행이라면 커서idx 1 감소
                cur -= 1
            }
        case "Z": //이분탐색
            let stackVal = stackVar.removeFirst()
            
            var left = 0
            var right = initVar.count - 1
            var ans = 0
            
            while left <= right {
                let mid = (left+right) / 2
                let currVar = initVar[mid]
                if currVar > stackVal {
                    right = mid+1
                }else {
                    left = mid+1
                }
                ans = mid
            }
            
            if initVar[cur] < stackVal {
                initVar.insert(stackVal, at: ans+1)
            } else {
                initVar.insert(stackVal, at: ans)
                cur += 1
            }
            
        default:
            print("not")
        }
    }
    
    var expectedNum = 0
    initVar.forEach { value in
        if value == expectedNum {
            result += "O"
            expectedNum = value+1
        }else {
            for _ in 0..<(value-expectedNum) {
                result += "X"
            }
            result += "O"
            expectedNum = value+1
        }
    }
    
    for _ in 0..<(n-expectedNum) {
        result += "X"
    }
    
    return result
}

let n = 8
let k = 2
let cmd = ["D 2", "C", "U 3", "C", "D 4", "C", "U 2", "Z", "Z", "U 1", "C"]
//let cmd = ["D 2","C","U 3","C","D 4","C","U 2","Z","Z"]
//let cmd = ["C", "C", "C", "C", "C", "C"]
//var result = "OOOOXOOO"


//print("결과값 =", solution(n, k, cmd))
//print("기대값 = OOXOXOOO")

//var a = [1,2,3,4,5]
//a.insert(7, at: 1)
