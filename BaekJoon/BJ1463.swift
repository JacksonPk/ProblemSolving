//https://www.acmicpc.net/problem/1463

import Foundation
//메모이제이션 바텀업

func makeOne(_ input : Int){
    
    var dfArr = [Int]()
    dfArr.append(0) //0부터 시작해서 직관적으로 보고자 넣었다.
    dfArr.append(0) //1은 그대로 1이기에 카운트 0
    
    if input <= 1{
        print(dfArr[1])
        return
    }
    for i in 2...input{
        if i%2 != 0 , i%3 != 0{ // 2 , 3으로 안나눠진다는 것은 1을 무조건 빼야함
            dfArr.append(dfArr[i-1]+1)
        }else if i%6 == 0{ //6으로 나눠지는것은 3가지 모두 해봐야 한다.
            let num = dfArr[i/3] <= dfArr[i/2] ? (dfArr[i/3] <= dfArr[i-1] ? dfArr[i/3] : dfArr[i-1] ) : (dfArr[i/2] <= dfArr[i-1] ? dfArr[i/2] : dfArr[i-1] )
            dfArr.append(num+1)
        }else if i%3 == 0{ //3은 /3 or -1 비교
            let num = dfArr[i/3] <= dfArr[i-1] ? dfArr[i/3] : dfArr[i-1]
            dfArr.append(num+1)
        }else{ //2는 /2 or -1 비교
            let num = dfArr[i/2] <= dfArr[i-1] ? dfArr[i/2] : dfArr[i-1]
            dfArr.append(num+1)
        }
    }
    print(dfArr[input])
}


let input = Int(readLine()!)!
makeOne(input)

