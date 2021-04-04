////https://www.acmicpc.net/problem/10816
import Foundation
//UpperBound 문제 x Upper&Lower 둘 다 생각해야함. 이분탐색 맞는건가??

let _ = readLine()
let n = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let _ = readLine()
let cards = readLine()!.split(separator: " ").compactMap{Int(String($0))}

var results = ""
var nDict = [Int:Int]()

n.forEach{ val in
    if nDict[val] == nil {
        nDict[val] = 1
    }else{
        nDict[val]! += 1
    }
}

cards.forEach{ val in
    if nDict[val] != nil {
        results.write(String(nDict[val]!)+" ")
    }else{
        results.write("0 ")
    }
    
}
print(results)
