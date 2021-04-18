//https://www.acmicpc.net/problem/2417
import Foundation
/*
입력 n = 122333444455555
출ㄹ력 q = 11060446
q^2 >= n을 만족하는 최소의 q를 구하기. LowerBound
 
right 값을 정하는게 가장 애매했음.
 //Int.max - 1 //9223372036854775808//Int(pow(Double(2), Double(63)))
 
left 또한 1이 아닌 0이다. 정수는 양의정수,0,음의정수 이다.
 음이 아닌 정수는 0과 자연수이다.
*/

let n = Double(readLine()!)!

func binarySearch() -> Int {
    var left = Double(0)
    var right = pow(Double(2),Double(63))
    var ans = Double(0)
    
    while left<=right {
        let mid = Double( (left + right) / 2 )

        if mid * mid >= n {
            ans = mid
            right = mid - 1
        }else{
            left = mid + 1
        }
        
    }
    
    return Int(ans)
}

//print(Int.max)
print(binarySearch())


