//
//  baekjoon1076.swift
//  2021CodeSquadMasters
//
//  Created by jinseo park on 1/6/21.
//  Copyright © 2021 JacksonKR. All rights reserved.
//

import Foundation

func calculateResistance(){

    var decimalVal : Int = -1
    var unitVal : Int = -1
    var multiVal : Int = -1
    var powerMath : Int = 0
    var resistanceVal : Int = 0

    let colorsDict : Dictionary<String, Int> = ["black" : 0, "brown" : 1, "red" : 2, "orange" : 3, "yellow" : 4, "green" : 5, "blue" : 6, "violet" : 7, "grey" : 8, "white" : 9]


    /* 함수를 이용해서 코드 수를 줄일 수 있지만 프로세스에 맞게 한단계씩 접근해 입력값이 딕셔너리에 저장되었는지 확인을 한다.*/
    if let firstColor = readLine(){
        for key in colorsDict.keys{
            if firstColor == key {
                decimalVal = colorsDict[key]!
            }
        }
    }
    if decimalVal == -1 {
        return
    }


    if let secondColor = readLine(){
        for key in colorsDict.keys{
            if secondColor == key {
                unitVal = colorsDict[key]!
            }
        }
    }
    if unitVal == -1 {
        return
    }


    if let thirdColor = readLine(){
        for key in colorsDict.keys{
            if thirdColor == key {
                multiVal = colorsDict[key]!
            }
        }
    }
    if multiVal == -1 {
        return
    }


    powerMath = Int(pow(10.0, Double(multiVal)))
    //print("1,2,3, powerMath = ",decimalVal, unitVal, multiVal, powerMath)

    resistanceVal = ((decimalVal * 10) + (unitVal)) * powerMath
    print(resistanceVal)


}



