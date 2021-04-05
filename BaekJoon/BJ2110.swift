//https://www.acmicpc.net/problem/2110

import Foundation

let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let n = input[0]
let c = input[1]
var cables = [Int]()
for _ in 0..<n {
    cables.append(Int(readLine()!)!)
}
cables = cables.sorted()

//print(n,c,cables)

func getCount(_ mid : Int) -> Int {
    var start = cables[0]
    var count = 1
    for idx in 1..<n {
        if (cables[idx] - start) >= mid {
            start = cables[idx]
            count += 1
        }
    }
    
    return count
}
func binarySearch() -> Int{
    var left = 1
    var right = cables.last! - cables.first!
    var ans = 0
    
    while left<=right {
        let mid = (left + right) / 2
        
        let result = getCount(mid)
        if c <= result {
            ans = result
            left = mid + 1
        }else{
            right = right - 1
        }
        
    }
    
    return ans
}

print(binarySearch())
