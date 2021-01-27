//https://www.acmicpc.net/problem/1052
func toBuyBottles(){

    let input = readLine()?.components(separatedBy: " ")
    var nBottles = Int(input![0])!
    let kBottles = Int(input![1])!
    var powerOfTwoArr = [Int]()
    var countBuyingBttles = 0

    if !(nBottles > 0 && nBottles < 10000000) && !(kBottles > 0 && kBottles <= 1000) {
        //print("OutOfRange")
        exit(0)
    }

    //    print("nBottles = ", nBottles, " and kBottles = " ,kBottles)

    if kBottles >= nBottles { //K bottles을 넘지 않으면 되니까 굳이 살 필요도 없다.

        //countBuyingBttles = 0//kBottles-nBottles
        print(0)
        return

    }else{ //n > k 이 때는 n을 처리해 주어야 한다. 2^n으로


        var greaterThan = 1
        var lessThan = 2

        while true { //nBottles를 배열처리화 시킴
            if nBottles == 0 {
                break
            }
            if nBottles >= greaterThan && nBottles < lessThan { //범위 안에 있는지
                nBottles = nBottles - greaterThan
                powerOfTwoArr.append(greaterThan)

                greaterThan = 1
                lessThan = 2
            }else {
                greaterThan *= 2
                lessThan *= 2
            }

        }

//        print(powerOfTwoArr) //test
    }

    if powerOfTwoArr.count <= kBottles { //K bottles을 넘지 않으면 되니까 굳이 살 필요도 없다.
        //print("here")
        //countBuyingBttles = kBottles - powerOfTwoArr.count
        print(0)
    }else{
        /*
        //가장 마지막 두 개의 index값을 비교하면서 필요한만큼 물병을 산다.
        var sumOfRemainVals = 0
        for i in 1..<powerOfTwoArr.count {
            sumOfRemainVals += powerOfTwoArr[i]
        }
//        print("sumOfRemainVals = ",sumOfRemainVals)
        countBuyingBttles = powerOfTwoArr[0] - sumOfRemainVals
        print(countBuyingBttles)
        */


        while true { //1번째 방법.
            countBuyingBttles += 1
            powerOfTwoArr.append(1)

            while powerOfTwoArr[powerOfTwoArr.count-1] == powerOfTwoArr[powerOfTwoArr.count-2]{
                var newVal = powerOfTwoArr[powerOfTwoArr.count-1]
                newVal *= 2

                //두 개의 값을 지우고 마지막 값의 두배를 배열에 넣어준다.
                powerOfTwoArr.removeLast()
                powerOfTwoArr.removeLast()
                powerOfTwoArr.append(newVal)

                if powerOfTwoArr.count == kBottles { //줄여가면서 kBottles와 맞는지 테스트
                    print(countBuyingBttles)
                    return
                }
            }
        }

    }

    //nBottles이 2^n승이면 정답 0


}


//다른 풀이 방법
/*
func mergedBottles(_ answer: Int) -> Int {

    var value = answer
    var count = 0
    while value != 0 {
        if value % 2 == 1 { count += 1 }
        value /= 2
    }

    return count
}


let input = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
let N = input[0]
let K = input[1]

var answer = N
while true {
    if mergedBottles(answer) <= K { break } // 합쳐지는 병의 개수가 K개 이하면 정답
    answer += 1
}

print(answer - N)


*/
