//https://www.acmicpc.net/problem/10870

var fibArr = Array(repeating: -1, count: 21)

func fib(_ num : Int) -> Int {
    if num <= 1 {
        fibArr[num] = num
    }
    
    if fibArr[num] != -1 {
        return fibArr[num]
    }else {
        fibArr[num - 1] = fib(num - 1)
        fibArr[num - 2] = fib(num - 2)
        fibArr[num] = fibArr[num - 1] + fibArr[num - 2]
        return fibArr[num]
    }
        
}

print(fib(Int(readLine()!)!))

