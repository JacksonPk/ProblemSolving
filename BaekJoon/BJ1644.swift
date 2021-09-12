////https://www.acmicpc.net/problem/1644
let N = Int(readLine()!)!

func getPrimeNums(N: Int) -> [Int] { //소수 구하기
    var isPrimeNum = Array(repeating: true, count: N+1)
    var arr = [Int]()
    var count = 2
    
    for i in 2..<isPrimeNum.count where isPrimeNum[i] {
        let prime = i
        count = 2
        while prime * count <= N {
            isPrimeNum[prime*count] = false
            count += 1
        }
    }
    
    for i in 2...N where isPrimeNum[i] {
        arr.append(i)
    }
    
    return arr
}

func twoPointer (arr: [Int], N: Int) -> Int {
    var left = 0
    var right = 0
    var count = 0
    var sum = 0
    
    while left <= right && right < arr.count {
        sum += arr[right]
        
        if sum == N {
            count += 1
            sum -= arr[left]
            left += 1
            right += 1
        } else if sum < N {
            right += 1
        } else {
            sum = sum - (arr[left] + arr[right])
            left += 1
        }
    }
    return count
}

if N == 1 {
    print(0)
} else {
    print(twoPointer(arr: getPrimeNums(N: N), N: N))
}
