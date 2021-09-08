//https://www.acmicpc.net/problem/20922
let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let (N,K) = (input[0],input[1])
let arr = readLine()!.split(separator: " ").compactMap{Int(String($0))}
var numArr = Array(repeating: [Int](), count: 100001) //숫자는 10만이하의 숫자

func twoPointer() -> Int {
    var left = 0
    var right = 0
    var maxLength = 0
    var curLength = 0
        
    while right < N {
        numArr[arr[right]].append(right)

        if numArr[arr[right]].count > K { //해당 원소가 K개 초과일 경우  현재 length 구하기\
            maxLength = max(curLength,maxLength)
            //초과된 원소의 idx가 현재 Left 보다 낮으면 left Idx를 바꾸지 않는다.
            left = max(numArr[arr[right]].removeFirst() + 1, left)
        }
        right += 1
        curLength = (right - left)
    }
    return max(curLength,maxLength)
}

print(twoPointer())
