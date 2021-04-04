// https://www.acmicpc.net/problem/2805

import Foundation


let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let needAns = input[1]
let trees = readLine()!.split(separator: " ").compactMap{Int(String($0))}

func getTrees(by saw : Int) -> Int {
    trees.reduce(0){$0 + max(0, ($1 - saw))}
}

func binarySearch() -> Int {
    var left = 0 //절단기에 설정할 수 있는 높이는 양의 정수 또는 0이다.
    var right = trees.max()!
    var ans = 0
    
    while left <= right {
        let mid = (left+right) / 2
        
        /*Upper bound = 정답조건을 유지하면서 pivot을 최대치로 늘리기 */
        if getTrees(by: mid) >= needAns { //주어진 톱날높이로 원하는 값 이상을 가져갔을 때
            ans = mid
            left = mid + 1 //톱날높이 더 높이기.
        }else{
            right = mid - 1
        }
    }
  
    return ans
}

print(binarySearch())
