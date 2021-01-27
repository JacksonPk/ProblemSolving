//https://www.acmicpc.net/problem/2938
enum bagsKind : Int{
    case three = 3
    case five = 5
}
func getMinBags(){
    var minBags = -1
    guard let inputInt = Int(readLine()!) else{ return} //수 입력받기
    
    let maxTimeThree = inputInt / bagsKind.three.rawValue
    let maxTimeFive = inputInt / bagsKind.five.rawValue
    
//    print(maxTimeThree , maxTimeSix)
    
    if inputInt % bagsKind.five.rawValue == 0 { //6으로 나누어지면 이 값이 최소이다.
        print(maxTimeFive)
        return
    }else{ //하나씩 추가하기
        
        for i in 0...maxTimeThree{
            for j in 0...maxTimeFive{
                
                //1. 3n + 5m = N 일 때
                //2. n+M 이 기존 minBags보다 작으면 바꾸기.
                if (bagsKind.three.rawValue*i) + (bagsKind.five.rawValue*j) == inputInt{
                    if i+j < minBags || minBags == -1{
                        minBags = i+j
                    }
                }
            }
        }
        
    }
    
    print(minBags)
    return

}

func getMinBags2(){
    guard let inputInt = Int(readLine()!) else{ return} //수 입력받기
    var fiveTimes = inputInt / bagsKind.five.rawValue
    while fiveTimes >= 0 {
        
        let remainder = inputInt - (fiveTimes * bagsKind.five.rawValue)
        
        if remainder % bagsKind.three.rawValue == 0{
            print(fiveTimes + remainder/bagsKind.three.rawValue)
            return
        }
        fiveTimes -= 1 //하나줄이기
    }
    print(-1)
    return
}

