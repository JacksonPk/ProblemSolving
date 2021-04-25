//https://www.acmicpc.net/problem/2470
let n = Int(readLine()!)!
let solutions = readLine()!.split(separator: " ").compactMap{Int(String($0))}.sorted()

func binaryTwoPointerSearch() -> [Int] {
    var ans = [Int]()
    var left = 0
    var right = solutions.count - 1
    var minSum = Int.max
    
    //mid값이 따로 존재하지 않는다. 이분탐색같지만 조금은 다르다.
    while left < right {
        let sum = solutions[left] + solutions[right]
        if sum > 0 {
            if abs(sum) < abs(minSum) {
                ans = [solutions[left],solutions[right]]
                minSum = sum
            }
            right -= 1
        }else if sum < 0 {
            if abs(sum) < abs(minSum) {
                ans = [solutions[left],solutions[right]]
                minSum = sum
            }
            left += 1
        }else { //if sum == 0
            return [solutions[left],solutions[right]]
        }
    }
    
    
    return ans
}
let ans = binaryTwoPointerSearch()
//print(ans)
print("\(ans[0]) \(ans[1])")

//3
//-1 0 1 3 5 6 9 11 12 16 17 19 22 25 28

