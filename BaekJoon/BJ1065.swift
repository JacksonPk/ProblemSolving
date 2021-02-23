//https://www.acmicpc.net/problem/1065
import Foundation

func numOfAP(_ num : Int) -> Int {
    if num < 100 {
        return num
    }else{
        //등차등비를 구해야함.
        var count = 99
        let max = num == 1000 ? 999 : num //1000은 등차수열이 되지 않는다.
        
        for number in 100 ... max {
            let _100Digit = number / 100
            let _10Digit = (number - _100Digit*100) / 10
            let _1Digit = (number - _100Digit*100) % 10
            
            let sequence = _10Digit - _100Digit
            
            if _10Digit + sequence == _1Digit {
                count += 1
            }
        }
        return count
    }
}

print(numOfAP(Int(readLine()!)!))
