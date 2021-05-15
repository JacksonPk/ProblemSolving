
//https://www.acmicpc.net/problem/2143

//nArray와 mArrray의 부 배열은 각 배열에 최소 한개의 원소를 가지고 있어야한다.
//부 배열은 A[i], A[i+1], …, A[j-1], A[j] (단, 1 ≤ i ≤ j ≤ n)
//위와 같은 의미는 i,j는 이어져야 한다. 즉 a[1],a[2],a[3] 과 같은 존재, a[1],a[3]은 부 배열이 아니다.

//이분탐색이지만 투 포인터로 풀어보기.
let T = Int(readLine()!)!
let countN = Int(readLine()!)!
let nArray = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let countM = Int(readLine()!)!
let mArray = readLine()!.split(separator: " ").compactMap{Int(String($0))}

func makeSubSumArray(length : Int , array: [Int]) -> [Int] {
    var subSumArray = [Int]()
    for idx in 0..<length {
        var sum = 0
        for jdx in idx..<length {
            sum += array[jdx]
            subSumArray.append(sum)
        }
    }
    return subSumArray.sorted()
}

//func searchUpperBinary(dest : Int, subSumArray: [Int]) -> Int {
//    var left = 0
//    var right = subSumArray.count-1
//
//    while left < right {
//        let mid = (left + right) / 2
//        if subSumArray[mid] <= dest {
//            left = mid + 1
//        }else {
//            right = mid
//        }
//    }
//    return right
//}
//func searchLowerBinary(dest : Int, subSumArray: [Int]) -> Int {
//    var left = 0
//    var right = subSumArray.count-1
//
//    while left < right {
//        let mid = (left+right) / 2
//        if subSumArray[mid] < dest { //원하는 값 이하 여야 한다.
//            left = mid + 1
//        }else {
//            right = mid
//        }
//    }
//    return right
//}

var subNArray = makeSubSumArray(length: countN, array: nArray)
var subMArray = makeSubSumArray(length: countM, array: mArray)

var totalCount: Int = 0

var nIdx = 0
var mIdx = subMArray.count - 1

while nIdx<subNArray.count , mIdx >= 0 {
    let currN = nIdx
    let currM = mIdx
    let sumOfSubN = subNArray[currN]
    let sumOfSubM = subMArray[currM]
    let sum = sumOfSubN + sumOfSubM
    
    if sum == T {
        
        var countOfSameNVal = 0
        var countOfSameMVal = 0
        
        while nIdx<subNArray.count, sumOfSubN==subNArray[nIdx] {
            countOfSameNVal += 1
            nIdx += 1
        }
        
        while mIdx>=0, sumOfSubM==subMArray[mIdx] {
            countOfSameMVal += 1
            mIdx -= 1
        }
        
        totalCount += countOfSameNVal*countOfSameMVal
        
    }else if sum > T { //T보다 원래 값이 크다
        mIdx -= 1
    }else { // T보다 원래 갑이 작다.
        nIdx += 1
    }
}

print(totalCount)
//for subSum in subNArray {
//
//    let surplus = T - subSum
//    let upperBound: Int = searchUpperBinary(dest: surplus, subSumArray: subMArray)
//    let lowerBound: Int = searchLowerBinary(dest: surplus, subSumArray: subMArray)
////    print(upperBound, lowerBound)
//    totalCount += upperBound - lowerBound
//}
//print(String(totalCount))
//print(String()
//print(String(format: "%.f", totalCount))

//5
//6
//1 3 1 2 5 7
//6
//1 3 2 -1 -2 0

//5
//4
//5 5 5 5
//3
//1 3 2
