//https://leetcode.com/problems/palindrome-number/
class Solution {
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
//        print("halfFirstNum = ", halfFirstNum, "halfLastNum = ", halfLastNum)
        return (halfFirstNum == halfLastNum) || (halfFirstNum == (halfLastNum / 10))
    }
}


