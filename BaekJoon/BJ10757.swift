//https://www.acmicpc.net/problem/10757

import Foundation

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
