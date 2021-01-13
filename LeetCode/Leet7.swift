//
//  ReverseInteger.swift
//  Algorithm_By_Baekjoon_LeetCode
//
//  Created by jinseo park on 1/13/21.
//

import Foundation

class Leet7_Solution {
    
    func reverse(_ x: Int) -> Int {
        
        var negativeFlag = 1
        var stringX : [String] = String(x).map{ String($0)}.reversed()
        var sumString = ""        

        if stringX.last! == "-" {
            negativeFlag = -1
            stringX.removeLast()
        }
        
        for item in stringX {
            sumString+=item
        }
        
        
        if Int(sumString)! >= INT32_MAX { /*제약조건*/
            
            return 0
        }
        
        if negativeFlag == -1 {
            return Int(sumString)! * negativeFlag
        }else{
            return Int(sumString)!
        }
        
    }
}



