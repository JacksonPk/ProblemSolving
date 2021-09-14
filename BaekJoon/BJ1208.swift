//https://www.acmicpc.net/problem/1208

/* 중앙에서 만나기
 배열을 나누는 것을 배열을 정렬해서 중앙값을 기준으로 나누었다.
 평균적인 case = O(n^N/2)
 worst case = O(n^N/2) 모든 배열의 원소가 같을때
 현재 코드가 시간초과면 중앙값 혹은 평균값을 이용하기.
 
 그냥 전체 배열의 수의 절반으로 나눈다면? -> 이게 맞지않나?
 무조건 O(n^N/2)이지 않을까. 그렇다.
 */
let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let (N,S) = (input[0],input[1])
let arr = readLine()!.split(separator: " ").compactMap{Int(String($0))}
var leftArr = [Int]() //arr.count / 2 이하
var rightArr = [Int]() //arr.count / 2 초과

var allLeftArr = [Int]() //leftArr 의 모든 합 배열
var allRightArr = [Int]() //rightArr 의 모든 합 배열

for i in 0..<arr.count {
    if i <= N/2 {
        leftArr.append(arr[i])
    } else {
        rightArr.append(arr[i])
    }
}

func getAllPossibleNums(arr: [Int]) -> [Int] { //콤비네이션 DFS 개념을 사용
    var nArr = [Int]()
    
    func dfs(idx: Int, sum: Int) {
        if idx >= arr.count {
            return
        }
        nArr.append(sum+arr[idx])
        dfs(idx: idx+1, sum: sum)
        dfs(idx: idx+1, sum: sum+arr[idx])
    }
    dfs(idx: 0, sum: 0)
    return nArr.sorted()
}

//func getAllPossibleNums2(arr: [Int]) -> [Int] { //백트래킹 사용 시간이 조금 더 걸린다.
//    var isUsed = Array(repeating: false, count: arr.count)
//    var nArr = [Int]()
//    var temp = [Int]()
//
//    func backTracking(idx: Int) {
//        if temp.count > arr.count {
//            return
//        }
//
//        if temp.count != 0 { //원소를 하나 이상 고른다면 nArr에 추가하기
//            nArr.append(temp.reduce(0, {$0 + $1}))
//        }
//
//        for i in idx..<arr.count where !isUsed[i] {
//            isUsed[i] = true
//            temp.append(arr[i])
//            backTracking(idx: i+1)
//            isUsed[i] = false
//            temp.removeLast()
//        }
//    }
//    backTracking(idx: 0)
//    return nArr.sorted()
//}
func twoPointer(lhsArr: [Int], rhsArr: [Int]) -> Int {
    var count = 0 //결과값
    var lSIdx = 0
    var rSIdx = 0
    
    while lSIdx < lhsArr.count && rSIdx < rhsArr.count {
        
        if lhsArr[lSIdx] + rhsArr[rSIdx] == S {
            var leftSameVals = 1
            var rightSameVals = 1
            var lEIdx = lSIdx+1
            var rEIdx = rSIdx+1
            
            while lEIdx < lhsArr.count {
                if lhsArr[lEIdx] == lhsArr[lSIdx] {
                    leftSameVals += 1
                } else {
                    break
                }
                lEIdx += 1
            }
            
            while rEIdx < rhsArr.count {
                if rhsArr[rEIdx] == rhsArr[rSIdx] {
                    rightSameVals += 1
                } else {
                    break
                }
                rEIdx += 1
            }
            count += leftSameVals * rightSameVals
            lSIdx = lEIdx
            rSIdx = rEIdx
        } else if lhsArr[lSIdx] + rhsArr[rSIdx] < S {
            lSIdx += 1
        } else {
            rSIdx += 1
        }
    }
    
    for i in 0 ..< lhsArr.count where lhsArr[i] == S {
        count += 1
    }
    
    for i in 0 ..< rhsArr.count where rhsArr[i] == S {
        count += 1
    }
    
    return count
}

allLeftArr = getAllPossibleNums(arr: leftArr)
allRightArr = getAllPossibleNums(arr: rightArr).reversed()
print(twoPointer(lhsArr: allLeftArr, rhsArr: allRightArr))
