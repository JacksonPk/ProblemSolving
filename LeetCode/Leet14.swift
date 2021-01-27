//https://leetcode.com/problems/longest-common-prefix/


class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        
        var minLengthStr : String = ""
        
        //MARK:Constrains
        if strs.count == 0 { //배열의 길이가 0이면 nil
            return ""
        }else{
            minLengthStr = strs[0]
            for index in 0 ..< strs.count{
                if strs[index].count == 0 { //배열의 값중 하나라도 문자열길이가 0이면 nil
                    return ""
                }else{  //문자열중 가장 작은 문자열을 고르는 작업 추후 작업에 편해짐
                    
                    if minLengthStr.count > strs[index].count {
                        minLengthStr = strs[index]
                    }
                }
            }
        }
        
        //인덱스 하나씩 추가하면서 비교함.
        for i in 0 ..< minLengthStr.count {
            let endIndex = minLengthStr.index(minLengthStr.startIndex , offsetBy: i)
            
            for j in 0 ..< strs.count{
                if minLengthStr[...endIndex] != strs[j][...endIndex]{ //하나라도 minLenthStr과 같지않으면 리턴
                    return String(minLengthStr[..<endIndex])
                }
            }
        }
        
        //이 return은 배열 모든 값들이 minLengthStr 과 모두 똑같다.
        return minLengthStr
    }
}

