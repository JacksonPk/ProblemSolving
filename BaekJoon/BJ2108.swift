//https://www.acmicpc.net/problem/2108
import Foundation

var arr = [Int]()
//var arr = [0, 0, 0, 0, 0, 1, 1, 1, 2, 2, 3, 3, 4, 4, 4, 4, 4, 4, 8,8,8,8,8,8,8, 9,9,9,9,9,9,9]
//var arr = [1,2,3]

func maxCount(_ arr : [Int]) -> Int {
    var hash = [Int:Int]()
    var result = [Int]()
    var max = 0
    arr.forEach { val in
        if hash[val] == nil {
            hash[val] = 1
        } else {
            hash[val]! += 1
        }
    }
    max = hash.values.max()!
    for val in hash {
        if val.value == max {
            result.append(val.key)
        }
    }
    result.sort()
    return result.count > 1 ? result[1] : result[0]
}
for _ in 0..<Int(readLine()!)! { //N always odd.
    arr.append(Int(readLine()!)!)
}
arr.sort()

print(Int(round(Double(arr.reduce(0, {$0+$1})) / Double(arr.count)))) //avg
print(arr[arr.count/2]) //medium
print(maxCount(arr)) //second most same value comes out.
print(arr[arr.count-1] - arr[0]) //max to min range


