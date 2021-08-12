//https://www.acmicpc.net/problem/14916
//2n+5m = n
//n+m -> min

func minCoin(n: Int) -> Int {
    var mult5 = 0
    var mult2 = 0
    var minCoins = -1
    mult5 = n / 5
    
    for i in 0...mult5 {
        if ((n-(5*i)) % 2) == 0 {
            mult2 = (n-(5*i)) / 2
            minCoins = i + mult2
        }
    }
    return minCoins
}

print(minCoin(n: Int(readLine()!)!))


