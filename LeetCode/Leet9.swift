//
//  Leet9.swift
//  Algorithm_By_Baekjoon_LeetCode
//
//  Created by jinseo park on 1/13/21.
//
//MARK: 링크 https://leetcode.com/problems/palindrome-number/

//빅오 = O(n^2) 일듯하다.
class Leet9Solution_1 {
    func isPalindrome(_ x: Int) -> Bool {
                
        var stringX : [String] = String(x).map{ String($0)}
        
        while stringX.count > 1 { //카운트 1개는 return true이다. O(n)
            
            if stringX.first == stringX.last {
                stringX.removeFirst() //O(n)
                stringX.removeLast() //O(n)
            }else{
                return false
            }
        }
        return true
    }
}

//MARK: 더 나은 솔루션을 보고 푼 문제
class Leet9Solution_2 {
    func isPalindrome(_ x: Int) -> Bool {
                      
        //x의 나머지가 없다는 것은 이미 palindrome에 벗어난다.
        if (x < 0) || ( (x % 10 == 0) && (x != 0) )  {
            return false
        }
        
        var halfLastNum = 0
        var halfFirstNum = x
        
        while halfFirstNum > halfLastNum {
            halfLastNum = (halfLastNum * 10) + (halfFirstNum % 10)
            halfFirstNum = halfFirstNum / 10
        }
        return (halfFirstNum == halfLastNum) || (halfFirstNum == (halfLastNum / 10))
    }
}


