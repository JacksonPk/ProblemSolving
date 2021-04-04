////https://www.acmicpc.net/problem/10816
import Foundation
//UpperBound 문제 x Upper&Lower 둘 다 생각해야함. 이분탐색 맞는건가??
//맞다. Upper&Lower 둘 다 구현하기.

let _ = readLine()
let n = readLine()!.split(separator: " ").compactMap{Int(String($0))}.sorted()
let _ = readLine()
let cards = readLine()!.split(separator: " ").compactMap{Int(String($0))}

var results = ""

func lowerBound(_ target : Int) -> Int{
    var left = 0
    var right = n.count - 1
    var ans = -1
    
    while left <= right {
        let mid = (left + right) / 2
        
        if n[mid] < target {
            left = mid + 1
        }else{
            if n[mid] == target {
                ans = mid
            }
            right = mid - 1
        }
    }
    return ans
}

func upperBound(_ target : Int) -> Int{
    var left = 0
    var right = n.count - 1
    var ans = -1
    while left <= right {
        let mid = (left + right) / 2
        
        if n[mid] <= target { //n[mid]가 5이고 타겟이 6이다.
            if n[mid] == target {
                ans = mid
            }
            left = mid + 1
        }else{
            right = mid - 1
        }
    }
    
    return ans
}


cards.forEach{ val in
    let ub = upperBound(val)
    if ub >= 0 { //최소 한개 이상 가진 것을 확인해야하기에. <- ""여기가 에러임"". up/lb 둘다 0번째 index일때가 문제임.
        results.write(String(ub - lowerBound(val) + 1)+" ")
    }else{
        results.write("0 ")
    }
    
}

print(results)
