//https://www.acmicpc.net/problem/1463
import Foundation
func makeOne(_ v : Int, _ c : Int) -> Int{
    var count = c
    if v < 2 {
        return count
    }else{
        count += 1
        if v % 3 != 0 , v % 2 != 0{
            return makeOne(v - 1, count)
        }else if v % 6 == 0{
            return makeOne(v / 3, count) <= makeOne(v / 2, count) ? makeOne(v / 3, count) : makeOne(v / 2, count)
        }else if v % 3 == 0{
            return makeOne(v - 1, count) <= makeOne(v / 3, count) ? makeOne(v - 1, count) : makeOne(v / 3, count)
        }else{
            return makeOne(v - 1, count) <= makeOne(v / 2, count) ? makeOne(v - 1, count) : makeOne(v / 2, count)
        }
    }
}
let input = Int(readLine()!)!
print(makeOne(input, 0))
