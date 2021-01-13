//
//  baekjoon1009.swift
//  2021CodeSquadMasters
//
//  Created by jinseo park on 1/6/21.
//  Copyright © 2021 JacksonKR. All rights reserved.
//


import Foundation

//MARK: 백준 알고리즘 문제 1009번

//문제 : Double로도 한계가 있다 99^999999 는 inf 로 처리가 됨. 1009번 문제에 부합하지 않는다.
/*func recursionPower(_ base : Double , _ power : Int) -> Double{
 //print("현재 power = ", power)

 if power == 1 {
 return base
 }else if power%2 == 0 { //power가 현재 짝수
 return recursionPower(base, power/2) * recursionPower(base, power/2)
 }else if power%2 == 1 { //power가 현재 홀수
 return recursionPower(base, power/2) * recursionPower(base, power/2) * base
 }else{
 return 1
 }
 }*/



/*
 pattern을 찾는다. int형, double 형으로 실제 a^b를 구하려고 해도 결국 한계값을 넘어가는 것을 파악하고,
 각 수마다 일의자리가 규칙성이 있다는 점을 파악하여 구현했다.
 */
func findPattern( _ base : Int , _ power : Int) -> Int{

    var patternArr = [Int]()
    var nTimesBase : Int

    //init 맨 처음 base의 1의자리를 배열에 저장함.
    patternArr.append(Int(base % 10))
    nTimesBase = base * base

    //find pattern : 배열[0]의 자리와 동일할 때까지 base * base 하여 규칙성을 찾아낸다.
    while patternArr[0] != (nTimesBase % 10) {

        patternArr.append(nTimesBase % 10)
        nTimesBase = nTimesBase * base

    }

    //divided by count : power를 패턴의 수 만큼 나눈 나머지로 배열값 찾기.
    let remainder : Int = (power-1) % patternArr.count //(power-1)은 index값을 맞추기 위해

    //이곳에서 문제의도를 잘 못 파악해서 틀림. 컴퓨터는 1부터 10인데 밑의 조건문이 없으면 10번째 컴퓨터에 해당하는 값이 0이라 채점결과가 다름
    if patternArr[remainder] == 0 {
        return 10
    }else{
        return patternArr[remainder]
    }


}

/*
 테스트 횟수를 입력받고, 다음 줄 부터 각각의 값을 받아 답을 저장한 후 한번에 보여주게 하는 함수.
 */
func checkInteger(){

    if let testTimes = readLine(){
        let times = Int(testTimes) ?? 0

        if times < 1 {
            return
        }else{

            var answersArr = [Int]()

            for _ in 0 ... times-1 {

                if let twoValues = readLine()?.components(separatedBy: " "){
                    if twoValues.count != 2{
                        return
                    }
                    let base = Int(twoValues[0]) ?? 0
                    let power = Int(twoValues[1]) ?? 0

                    if (base >= 1 && base < 100) && (power >= 1 && power < 1000000) {
                        answersArr.append(findPattern(base, power))
                    }else{
                        return
                    }
                }
            }

            for i in 0 ... answersArr.count-1 {
                print(answersArr[i])
            }
        }

    }
}

