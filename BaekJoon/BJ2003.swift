//https://www.acmicpc.net/problem/2003
let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let (N,M) = (input[0],input[1])
let arr = readLine()!.split(separator: " ").compactMap{Int(String($0))}

func sumElements(left: Int, right: Int) -> Int {
    var sum = 0
    for i in left...right {
        sum += arr[i]
    }
    return sum
}

func twoPointer() -> Int {
    var count = 0
    var left = 0
    var right = 0
    var sum = 0

    while right < arr.count {
        if left > right {
            right += 1
            continue
        }
        sum = sumElements(left: left, right: right)
        if sum == M {
            count += 1
            left += 1
            right += 1
        } else if sum > M {
            left += 1
        } else { //sum < M
            right += 1
        }
    }
    
    return count
}
print(twoPointer())



//2번째 풀이 =====
/*https://www.acmicpc.net/problem/2003
let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let (N,M) = (input[0],input[1])
let arr = readLine()!.split(separator: " ").compactMap{Int(String($0))}

func twoPointer() -> Int {
    var count = 0
    var rightIdx = 0
    var sum = 0

    //두 포인터에서는 for문을 이용하자!!!
    for leftIdx in 0..<arr.count {
        sum = 0
        rightIdx = leftIdx

        while rightIdx < arr.count {
            sum += arr[rightIdx]
            
            if sum == M {
                count += 1
            } else if sum > M {
                break
            }
            rightIdx += 1
        }
    }
    return count
}
print(twoPointer())
*/

