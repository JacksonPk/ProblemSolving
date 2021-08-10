//https://www.acmicpc.net/problem/2751
//머지 정렬
var arr = [Int]()
for _ in 0 ..< Int(readLine()!)! {
    arr.append(Int(readLine()!)!)
}
var temp = Array(repeating: 0, count: arr.count)

func merge(left: Int, right: Int) {
    let mid = (left+right) / 2
    var lIdx = left
    var rIdx = mid
    
    for i in left..<right {
        if rIdx == right { //오른쪽 끝이 남.
            temp[i] = arr[lIdx]
            lIdx += 1
        } else if lIdx == mid { //왼쪽 끝이 남
            temp[i] = arr[rIdx]
            rIdx += 1
        } else {
            if arr[lIdx] < arr[rIdx] {
                temp[i] = arr[lIdx]
                lIdx += 1
            } else {
                temp[i] = arr[rIdx]
                rIdx += 1
            }
        }
    }
    for i in left..<right {
        arr[i] = temp[i]
    }
}
func mergeSort(left: Int, right: Int) {
    if left+1 == right {
        return
    }
    let mid = (left+right) / 2
    mergeSort(left: left, right: mid)
    mergeSort(left: mid, right: right)
    merge(left: left, right: right)
}
mergeSort(left: 0, right: arr.count)

for i in 0..<arr.count {
    print(arr[i])
}

