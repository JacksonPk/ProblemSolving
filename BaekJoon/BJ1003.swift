//https://www.acmicpc.net/problem/1003
//
//  main.swift
//  PS
//
//  Created by jinseo park on 2/6/21.
//

import Foundation

class Fib{
    
    //Index 0 = count Of 0
    //Index 1 = count Of 1
    var memoization = [[Int]](repeating: [0,0], count: 41) //[Int,Int]
    var memoizationTD = [[Int]](repeating: [0,0], count: 41) //[Int,Int]
    var indexArr = [Int]() //for output
    
    init(){
        //Bottom-UP
        memoization[0] = [1,0]
        memoization[1] = [0,1]
        fibonacci()

        
        //Top-Down
        memoizationTD[0] = [1,0]
        memoizationTD[1] = [0,1]
        fibonacci_TD(40)
    }
    
    //Bottom-Up
    func fibonacci(){
        for i in 2..<41{
            memoization[i][0] = memoization[i - 1][0] + memoization[i - 2][0]
            memoization[i][1] = memoization[i - 1][1] + memoization[i - 2][1]
        }
    }
    
    //Top-Down
    @discardableResult
    func fibonacci_TD(_ input : Int) -> [Int]{
        if input <= 1 {
            return memoizationTD[input]
        }else{
            
            if memoizationTD[input] != [0,0]{
                return memoizationTD[input]
            }else{
                let first = fibonacci_TD(input - 1)
                let second = fibonacci_TD(input - 2)
                
                memoizationTD[input][0] = first[0] + second[0]
                memoizationTD[input][1] = first[1] + second[1]
                
                return memoizationTD[input]
            }
        }
        
    }
    
}

let fib = Fib()
//print(fib.memoization)
//print(fib.memoizationTD)
//print(fib.memoization == fib.memoizationTD)

for _ in 0 ..< Int(readLine()!)!{
    fib.indexArr.append(Int(readLine()!)!)
}
for item in fib.indexArr{
    print(fib.memoization[item][0],fib.memoization[item][1])
}

