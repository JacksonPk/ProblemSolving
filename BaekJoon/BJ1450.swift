//https://www.acmicpc.net/problem/1450
let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let (N,C) = (input[0],input[1])
let arr = readLine()!.split(separator: " ").compactMap{Int(String($0))}.sorted()
var leftArr = [Int]()
var rightArr = [Int]()
var allLeftArr = [Int]()
var allRightArr = [Int]()

for i in 0..<arr.count {
    if i <= N/2 {
        leftArr.append(arr[i])
    } else {
        rightArr.append(arr[i])
    }
}

func getSubArr(arr: [Int]) -> [Int] {
    var nArr = [Int]()

    func combination(idx: Int, sum: Int) {
        if idx >= arr.count || sum+arr[idx] > C {
            return
        }
        nArr.append(sum+arr[idx])

        combination(idx: idx+1, sum: sum)
        combination(idx: idx+1, sum: sum+arr[idx])
    }

    combination(idx: 0, sum: 0)
    return nArr.sorted()
}

func twoPointer(lhsArr: [Int], rhsArr: [Int]) -> Int {

    var count = 1 + lhsArr.count + rhsArr.count //가방에 아무것도 안 넣는 것도 방법이기에 + C가 넘는 경우수는 배재하고 각 배열을 만들었기에.
    var sRight = 0

    for i in 0..<lhsArr.count {
        sRight = 0
        let num = C - lhsArr[i]
        while sRight < rhsArr.count {
            if rhsArr[sRight] <= num {
                break
            }
            sRight += 1
        }
        count += (rhsArr.count - sRight)
    }

    return count
}

allLeftArr = getSubArr(arr: leftArr)
allRightArr = getSubArr(arr: rightArr).reversed()
print(twoPointer(lhsArr: allLeftArr, rhsArr: allRightArr))
