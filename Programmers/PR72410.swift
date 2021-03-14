//https://programmers.co.kr/learn/courses/30/lessons/72410
//2021 KAKAO BLINND RECRUITMENT

import Foundation

func solution(_ new_id:String) -> String {
    var recommendID = new_id
    
    // step1
    recommendID = recommendID.lowercased()
    
    //step2
    let specialSet = Set("abcdefghijklmnopqrstuvwxyz0123456789-_.")
    recommendID = recommendID.filter{ specialSet.contains($0)}
    
    //step3
    var recommendID_3 = ""
    
    recommendID.forEach {
        if $0 == "."{
            if recommendID_3.last != "." {
                recommendID_3 += String($0)
            }
        }else{
            recommendID_3 += String($0)
        }
    }
    
    recommendID = recommendID_3
    
    //step4
    if recommendID.first == "." {
        recommendID = String(recommendID.dropFirst())
    }
    if recommendID.last == "." {
        recommendID = String(recommendID.dropLast())
    }
    
    //step5
    if recommendID.count == 0 {
        recommendID = "a"
    }
    
    //step6
    if recommendID.count >= 16 {
        let endIdx: String.Index = recommendID.index(recommendID.startIndex, offsetBy: 15)
        recommendID = String(recommendID[..<endIdx])
    }
    if recommendID.last == "." {
        recommendID = String(recommendID.dropLast())
    }
    
    //step7
    if recommendID.count < 3 {
        for _ in recommendID.count ..< 3 {
            recommendID += String(recommendID.last!)
        }
    }
    
    
    return recommendID
}

//print(solution("...!@BaT#*..y.abcdefghijklm"))
//print(solution(""))

