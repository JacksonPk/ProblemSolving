//https://www.acmicpc.net/problem/9095
import Foundation


/*
 1 = 1 =>1
 2 = 1+1, 2 =>2
 3 = 1+1+1, 1+2, 2+1, 3 => 4
 4 = 1+1+1+1 , 1+1+2 ,1+2+1 ,2+1+1, 2+2, 1+3, 3+1 =>7
 5 = 1+1+1+1+1 , 2+1+1+1+1+1, ...
 */
class OneTwoThree{
    var count : Int = 0
    
    func initCount() {
        count = 0
    }
    
    func sumOf123(_ value : Int){
        if value >= 3{
            sumOf123(value-3)
            sumOf123(value-2)
            sumOf123(value-1)
        }else if value >= 2 {
            sumOf123(value-2)
            sumOf123(value-1)
        }else if value >= 1{
            sumOf123(value-1)
        }else{
            count += 1
            return
        }
    }
}

var arr = [Int]()
for _ in 0 ..< Int(readLine()!)!{
    arr.append(Int(readLine()!)!)
}
let test = OneTwoThree()
for i in 0 ..< arr.count{

    test.sumOf123(arr[i])
    print(test.count)
    test.initCount()
}
