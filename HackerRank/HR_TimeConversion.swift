//https://www.hackerrank.com/challenges/time-conversion/problem

import Foundation

func timeConversion(s: String) -> String {
    /*
     * Write your code here.
     */
    var a = s.components(separatedBy: ":")

    let subIndex : String.Index = a[2].index(a[2].startIndex, offsetBy: 2)
    
    if String(a[2][subIndex...]) == "AM"{
        if Int(a[0])! == 12{
            a[0] = "00"
        }
    }else if String(a[2][subIndex...]) == "PM"{
        a[0] = Int(a[0])!+12 == 24 ? String(12) : String(Int(a[0])!+12)
    }else{

    }
    a[2] = String(a[2][..<subIndex])
    return a.joined(separator: ":")
}
