//https://leetcode.com/problems/two-sum/

import Foundation

class Leet1_Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        
        //빅오 노테이션 O(n^2)
        for fIndex in 0 ..< nums.count-1 { //끝까지 가면 sIndex에서 OOR 에러
            for sIndex in (fIndex+1) ..< nums.count{
                if nums[fIndex] + nums[sIndex] == target {
                    return [fIndex,sIndex]
                }
            }
        }
        return [-1] //존재하지 않을경우
    }
}



