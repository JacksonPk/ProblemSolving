//https://www.acmicpc.net/problem/22857
//DP 점화식이 생각이 안나서 투 포인터로 해결한 문제
let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let (S,K) = (input[0],input[1])
var arr = readLine()!.split(separator: " ").compactMap{Int(String($0))}

func twoPointer() -> Int {
    var maxLength = 0
    var length = 0
    var evenSub = [Int]()
    var count = K
    var flag = true
    for i in 0..<arr.count { //where arr[i] % 2 == 0 {
        if arr[i]%2 == 0 && flag {
            evenSub.append(i) //짝수 원소 시작점
            flag = false
        }
        if arr[i]%2 != 0 && !flag {
            flag = true
        }
    }
    
    for i in 0..<evenSub.count {
        length = 0
        count = K
        var curIdx = evenSub[i]
        while count >= 0 && curIdx < arr.count {
            if arr[curIdx] % 2 != 0 {
                count -= 1
            } else {
                length += 1
            }
            curIdx += 1
        }
//        print("시작점",i, "마지막 curIdx",curIdx,"총 길이",length)
        maxLength = max(maxLength,length)
    }

    return maxLength
}
print(twoPointer())

//25 3
//1 2 1 2 2 2 2 2 2 2 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2
