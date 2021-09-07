//https://www.acmicpc.net/problem/1821
import Foundation
let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let (N,F) = (input[0], input[1])
var isUsed = Array(repeating: false, count: N+1)
var arr = [Int]()

func simulation(arr: [Int]) {
    var curArr = arr
    while curArr.count != 1 {
        var temp = [Int]()
        for i in 0..<curArr.count - 1 {
            temp.append(curArr[i]+curArr[i+1])
        }
        curArr = temp
    }
    
    if curArr[0] == F {
        for i in 0..<arr.count {
            print(arr[i],terminator: " ")
        }
        exit(0)
    }
}

func backTracking(idx: Int) {
    if arr.count == N {
        simulation(arr: arr)
        return
    }
    
    for i in 1...N where !isUsed[i] {
        isUsed[i] = true
        arr.append(i)
        backTracking(idx: i+1)
        isUsed[i] = false
        arr.removeLast()
    }
}

backTracking(idx: 0)

