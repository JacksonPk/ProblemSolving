//https://www.acmicpc.net/problem/11047

func minCoins(){
    guard let firstRead = readLine()?.components(separatedBy: " ")else{return}
    let coinsKind = Int(firstRead[0])!
    var sumCoins = Int(firstRead[1])!
    var arrCoins = [Int]()
    var countCoin = 0
    
    for _ in 0 ..< coinsKind{ //둘째 줄부터 N개의 줄에 동전의 가치 Ai가 오름차순으로 주어진다 ->즉, 솔팅할 필요 없음.
        arrCoins.append(Int(readLine()!)!)
    }
    
    for item in arrCoins.reversed(){
                
        if item > sumCoins { //크면 의미없다.
            continue
        }else{ //합계보다 해당 item이 작을때.
            countCoin += sumCoins/item
            sumCoins = sumCoins % item //나머지
            if sumCoins == 0 {
                print(countCoin)
                return
            }
        }
    }
    
}
