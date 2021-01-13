//
//  baekjoon10757.swift
//  2021CodeSquadMasters
//
//  Created by jinseo park on 1/6/21.
//  Copyright © 2021 JacksonKR. All rights reserved.
//

//MARK: 버그가 존재 컴파일에서는 되나 백준에서 틀림.
import Foundation


//2bytes 기준으로 자르기
/*
func calculateBigNum(){

    var firstBigNumArr = [Int]()
    var secondBigNumArr = [Int]()
    var sumOfBigNumArr = [String]()
    var carry : Int = 0
    var count : Int = 0

    let readBigNums = readLine()!.components(separatedBy: " ")

    var firstBigNum = readBigNums[0]
    var secondBigNum = readBigNums[1]

    //print(firstBigNum, secondBigNum)

    while firstBigNum.count > 16 {

        let firstIndex = firstBigNum.index(firstBigNum.endIndex, offsetBy: -16)
        let lastIndex = firstBigNum.index(firstBigNum.endIndex, offsetBy: 0)

        firstBigNumArr.append(Int(String(firstBigNum[firstIndex ..< lastIndex]))!)
        firstBigNum = String(firstBigNum[..<firstIndex])
    }
    firstBigNumArr.append(Int(String(firstBigNum))!)

    while secondBigNum.count > 16 {

        let firstIndex = secondBigNum.index(secondBigNum.endIndex, offsetBy: -16)
        let lastIndex = secondBigNum.index(secondBigNum.endIndex, offsetBy: 0)

        secondBigNumArr.append(Int(String(secondBigNum[firstIndex ..< lastIndex]))!)
        secondBigNum = String(secondBigNum[..<firstIndex])
    }
    secondBigNumArr.append(Int(String(secondBigNum))!)


    //    print("fArr = ",firstBigNumArr)
    //    print("sArr = ",secondBigNumArr)
    count = firstBigNumArr.count >= secondBigNumArr.count ? firstBigNumArr.count : secondBigNumArr.count

    //    print("count = ", count)
    for i in 0 ..< count {
        //        print("i = ", i)
        var sum : Int = 0
        if !firstBigNumArr.indices.contains(i) {
            //            print("첫번째거 더 이상 없음, 현재 carry = ", carry)
            //sumOfBigNumArr.append(String(secondBigNumArr[i] + carry))
            //carry = 0

            //고친 이유 99 + 1을 해도 carry가 1 발생할수 있으니까.
            sum = secondBigNumArr[i] + carry
        }else if !secondBigNumArr.indices.contains(i){
            //            print("두번째거 더 이상 없음, 현재 carry = ", carry)
            //sumOfBigNumArr.append(String(firstBigNumArr[i] + carry))
            //carry = 0

            sum = firstBigNumArr[i] + carry
        }else {
            //print("양쪽 잇음, 현재 carry = ", carry)
            //let sum = firstBigNumArr[i] + secondBigNumArr[i] + carry
            sum = firstBigNumArr[i] + secondBigNumArr[i] + carry
        }

        //print("sum = ", sum)

        //16자리보다 크다는 것은 carryOut 1 발생.
        if String(sum).count > 16 {
            carry = 1

            //한 자리만 빼고 나머지 수를 String 화 시켜서 넣음.
            let firstIndex = String(sum).index(String(sum).startIndex, offsetBy: 1)
            sumOfBigNumArr.append(String(String(sum)[firstIndex...]))
            //print("sumOfBigNumArr = ", sumOfBigNumArr)
        }else {
            carry = 0
            sumOfBigNumArr.append(String(sum))
        }

        //}

    }

    //한발 남았다! 마지막에 carry가 1이면 1의자리를 추가시켜야 한다.
    //print("check carry? = ", carry)

    if carry == 1 {
        sumOfBigNumArr.append("1")
    }

    //    print(sumOfBigNumArr)
    //    print(sumOfBigNumArr[1]+sumOfBigNumArr[0])

    sumOfBigNumArr =  sumOfBigNumArr.reversed()

    var bigNumStr = String()

    for i in 0 ..< sumOfBigNumArr.count{
        bigNumStr += sumOfBigNumArr[i]
    }

    print(bigNumStr)
}


*/
//MARK: adder 가산기 함수
func adder(_ intA : Int, _ intB : Int, _ carryIn : Int) -> [Int]{

    let sum = (intA + intB + carryIn) % 10
    let carryOut = (intA + intB + carryIn) / 10

    return [sum,carryOut]
}

//MARK: 큰수 합치기
func sumBigNum(){
    let readBigNums = readLine()!.components(separatedBy: " ")

    //let firstBigNumArr = Array(readBigNums[0].reversed())
    var firstBigNumArr : [String] = readBigNums[0].map {String($0)}
    var secondBigNumArr : [String] = readBigNums[1].map {String($0)}
    var sumOfBigNums = [String]()
    var carryIn : Int = 0 //Init


    firstBigNumArr = firstBigNumArr.reversed()
    secondBigNumArr = secondBigNumArr.reversed()

    let count = firstBigNumArr.count >= secondBigNumArr.count ? firstBigNumArr.count : secondBigNumArr.count

    /*print(count)
     print("firstBigNumArr = ", firstBigNumArr)
     print("secondBigNumArr = ", secondBigNumArr)
     */


    for i in 0 ..< count {

        if !firstBigNumArr.indices.contains(i) {

            sumOfBigNums.append(String(adder(0, Int(secondBigNumArr[i])!, carryIn)[0]))
            carryIn = adder(0, Int(secondBigNumArr[i])!, carryIn)[1]


        }else if !secondBigNumArr.indices.contains(i){

            sumOfBigNums.append(String(adder(Int(firstBigNumArr[i])!, 0, carryIn)[0]))
            carryIn = adder(Int(firstBigNumArr[i])!, 0, carryIn)[1]


        }else {

            sumOfBigNums.append(String(adder(Int(firstBigNumArr[i])!, Int(secondBigNumArr[i])!, carryIn)[0]))
            carryIn = adder(Int(firstBigNumArr[i])!, Int(secondBigNumArr[i])!, carryIn)[1]

        }
    }

    if carryIn == 1 {   //마지막 남은 carry가 1이면 추가.
        sumOfBigNums.append(String(1))
    }

    sumOfBigNums = sumOfBigNums.reversed()

    var bigNum = ""

    if sumOfBigNums[0] == "0" { //가장 처음이 0이면 더이상 배열의 크기는 의미 없기때문에 0으로 출력
        print("0")
    }else {
        for i in 0 ..< sumOfBigNums.count {
            bigNum += sumOfBigNums[i]
        }
        print(bigNum)
    }

    //    print(sumOfBigNums)
}
//print("d = ", Adder(5, 8, 1))
