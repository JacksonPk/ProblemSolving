//https://www.acmicpc.net/problem/7453
/*Meet me in the middle
 각 Set의 원소를 하나씩 비교하려면 n*n*n*n -> O(n^4) 이다.
 하지만 (A,B)와 (C,D)를 나누어서(A,C / B,D 도 상관없다 두 개씩 나누면 된다.) 각 원소들의 총 합을 새로운 Set X, Y로 만든다면 이 과정에서는
 2*O(N^2) 이 걸린다. (A, (B,C,D)) 로 나누면 O(n) , O(n^3) 이라서 시간이 더 걸림.
 그리고 x,y에서 합이 0이되는 경우(O^2)를 찾으면 답이 나온다.
 물론 여기서 x의 원소를 하나고를 때 y를 정렬하여서 0이 나오는 순간부터 끝나는 순간까지만 두포인터로 계산하면 조금 더 시간을 절약할 수 있을 것이라고 본다.(혹은 이분탐색)
 */
let N = Int(readLine()!)!
var count = 0
var A = Array(repeating: 0, count: N)
var B = Array(repeating: 0, count: N)
var C = Array(repeating: 0, count: N)
var D = Array(repeating: 0, count: N)
var X = [Int]()
var Y = [Int]()

for i in 0..<N {
    let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
    A[i] = input[0]
    B[i] = input[1]
    C[i] = input[2]
    D[i] = input[3]
}

func getNewSet(lhsArr: [Int], rhsArr: [Int]) -> [Int] {
    var arr = [Int]()
    for i in 0..<lhsArr.count {
        for j in 0..<rhsArr.count {
            arr.append(lhsArr[i]+rhsArr[j])
        }
    }
    return arr
}

//lower bound를 구하고 거기서 부터 시작해서 같은 원소가 아닐때까지 ans를 더하면 된다.
//upperbound - lowerbound 방법도 있지만 시도해보지 않았다.
func binarySearch(lhsArr: [Int], rhsArr: [Int]) -> Int {
    var count = 0
    var left = 0
    var right = 0
    var num = 0
    var startIdx = -1
    var endIdx = 0
    var targetNum = 0
    var ans = 0
    var mid = 0
    
    for i in 0..<lhsArr.count {
        
        //해당 원소 숫자가 그 전 값과 같다면 그 전 ans값을 더하고 다음 값으로
        if i >= 1 && lhsArr[i] == lhsArr[i-1] {
            count += ans
            continue
        }

        startIdx = -1
        num = lhsArr[i]
        ans = 0
        left = 0
        right = rhsArr.count-1
        
        //합이 0이 되는 최초의 idx를 구함
        while left <= right {
            mid = (left+right) / 2
            if rhsArr[mid] + num == 0 {
                startIdx = mid
                right = mid - 1
            } else if rhsArr[mid] + num < 0 {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }

        if startIdx == -1 { //합이 0이되는 해당 원소는 존재하지 않음
            continue
        } else {
            targetNum = rhsArr[startIdx]
            endIdx = startIdx + 1
            ans = 1
            while endIdx < rhsArr.count && targetNum == rhsArr[endIdx] {
                ans += 1
                endIdx += 1
            }
        }

        count += ans
    }
    return count
}
X = getNewSet(lhsArr: A, rhsArr: B).sorted()
Y = getNewSet(lhsArr: C, rhsArr: D).sorted().reversed()
print(binarySearch(lhsArr: X, rhsArr: Y))

