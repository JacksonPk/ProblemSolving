//https://programmers.co.kr/learn/courses/30/lessons/81303
//정확성만 맞춤. 효율성은 0
//배열로 푼 문제
//import Foundation

func solution(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
    var initVar = [Int]()
    var storedIdx = [Int]()
    var storedVar = [Int]()
    
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
            storedIdx.insert(cur, at: 0)
            storedVar.insert(val, at: 0)
            if cur == initVar.count { //마지막 행이라면 커서idx 1 감소
                cur -= 1
            }
            
        case "Z":
            //저장되 있던 해당값과 idx 복귀

            print("test ",initVar[cur])
            let idx = storedIdx.removeFirst()
            let val = storedVar.removeFirst()
            initVar.insert(val, at: idx)
            if idx <= cur { //저장된 값의 idx가 커서보다 낮은값이면 커서idx 1 증가
                cur += 1
            }
            
        default:
            print("not")
        }
        print("stored idx",storedIdx)
        print("stored idx",storedIdx)
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
//var result = "OOOOXOOO"


print("결과값 =", solution(n, k, cmd))
print("기대값 = OOXOXOOO")
