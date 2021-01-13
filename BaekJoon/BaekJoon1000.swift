//
//  baekjoon1000.swift
//  2021CodeSquadMasters
//
//  Created by jinseo park on 1/6/21.
//  Copyright © 2021 JacksonKR. All rights reserved.
//

import Foundation

//MARK: 백준 알고리즘 문제 1000번

func addInteger(){
    if let twoValues = readLine()?.components(separatedBy: " "){
        if twoValues.count != 2{
            exit(0)
        }
        let firstInt = Int(twoValues[0]) ?? -1
        let secondInt = Int(twoValues[1]) ?? 11

        if firstInt>0 , secondInt<10 {
            print(firstInt+secondInt)
        }
    }

}

// 테스트 케이스
//addInteger()
