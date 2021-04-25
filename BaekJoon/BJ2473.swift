//https://www.acmicpc.net/problem/2473
//2470과 거의 흡사하다.
//단지 첫번째 값만 지정하고 나머지는 똑같다.
let n = Int(readLine()!)!
let solutions = readLine()!.split(separator: " ").compactMap{Int(String($0))}.sorted()

func binaryTwoPointerSearch() -> [Int] {
    var ans = [Int]()
    var first = 0
    var minSum = Int.max
    
    while first+2 <= solutions.count-1 { //3가지중 한가지는 픽한다. O(n)
                
        var left = first+1
        var right = solutions.count - 1
        
        //mid값이 따로 존재하지 않는다. 이분탐색같지만 조금은 다르다.
        while left < right {
            let sum = solutions[first] + solutions[left] + solutions[right]
            if sum > 0 {
                if abs(sum) < abs(minSum) {
                    ans = [solutions[first], solutions[left],solutions[right]]
                    minSum = sum
                }
                right -= 1
            }else if sum < 0 {
                if abs(sum) < abs(minSum) {
                    ans = [solutions[first], solutions[left],solutions[right]]
                    minSum = sum
                }
                left += 1
            }else { //if sum == 0
                return [solutions[first], solutions[left],solutions[right]]
            }
        }
        first += 1
    }
    return ans
}
let ans = binaryTwoPointerSearch()
//print(ans)
print("\(ans[0]) \(ans[1]) \(ans[2])")

//3
//-1 0 1 3 5 6 9 11 12 16 17 19 22 25 28

