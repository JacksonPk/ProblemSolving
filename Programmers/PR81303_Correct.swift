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
    var updateVar = initVar
    
    for val in cmd {
        
        let input = val.split(separator: " ").compactMap{String($0)}
        switch input[0] {
        case "U":
            cur -= Int(input[1])!
        case "D":
            cur += Int(input[1])!
        case "C":
            
            let val = updateVar.remove(at: cur)
            storedIdx.insert(cur, at: 0)
            storedVar.insert(val, at: 0)
            if cur == updateVar.count { //마지막 행이라면 커서idx 1 감소
                cur -= 1
            }
            
        case "Z":
            //저장되 있던 해당값과 idx 복귀

            let idx = storedIdx.removeFirst()
            let val = storedVar.removeFirst()
            
            updateVar.insert(val, at: idx)
            if idx <= cur { //저장된 값의 idx가 커서보다 낮은값이면 커서idx 1 증가
                cur += 1
            }
        default:
            print("not")
        }
    }
    
    for idx in storedIdx { //비교를 위해 나머지 스택 넣어주기
        updateVar.insert(-1, at: idx)
    }
    
    for idx in 0..<initVar.count {
        if initVar[idx] == updateVar[idx] {
            result += "O"
        }else{
            result += "X"
        }
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
