//https://www.hackerrank.com/challenges/diagonal-difference/problem
import Foundation

func diagonalDifference(arr: [[Int]]) -> Int {
    // Write your code here
    var index = 0
    var sumLR = 0
    var sumRL = 0
    while index < arr.count{
        sumLR += arr[index][index]
        sumRL += arr[index][(arr.count - 1) - index]
        index += 1
    }
    
    return (sumLR - sumRL) < 0 ? -1 * (sumLR - sumRL) : (sumLR - sumRL)
}
