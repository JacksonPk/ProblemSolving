//https://www.acmicpc.net/problem/5585

func remainder(){
    var price = 1000 - Int(readLine()!)!
    var countOfCoins = 0
    let coins = [500,100,50,10,5,1]
    var index = 0
    while price != 0 {
    
        if price - coins[index] >= 0 {
            countOfCoins += 1
            price = price - coins[index]
        }else{
            index += 1
        }
        
    }
    
    print(countOfCoins)
}
