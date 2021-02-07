//https://www.acmicpc.net/problem/1003

import Foundation

class Fib{
    
    //Index 0 = count Of 0
    //Index 1 = count Of 1
    var memoization = [[Int]](repeating: [0,0], count: 41) //[Int,Int]
    var indexArr = [Int]() //for output
    
    init(){
        memoization[0] = [1,0]
        memoization[1] = [0,1]
        fibonacci()
    }
    
    func fibonacci(){
        for i in 2..<41{
            memoization[i][0] = memoization[i - 1][0] + memoization[i - 2][0]
            memoization[i][1] = memoization[i - 1][1] + memoization[i - 2][1]
        }
    }
    
}

let fib = Fib()
for _ in 0 ..< Int(readLine()!)!{
    fib.indexArr.append(Int(readLine()!)!)
}
for item in fib.indexArr{
    print(fib.memoization[item][0],fib.memoization[item][1])
}

