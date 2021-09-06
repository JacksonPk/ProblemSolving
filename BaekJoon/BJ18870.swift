//https://www.acmicpc.net/problem/18870
let _ = readLine()
let arr = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let sortedArr = Array(Set(arr)).sorted()
var result = ""

func binarySearch(num: Int) -> String {
    var left = 0
    var right = sortedArr.count-1
    var ans = 0
    
    while left<=right { //lower
        let mid = (left+right) / 2
        
        if num <= sortedArr[mid] {
            ans = mid
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    
    return String(ans)
}
for i in 0..<arr.count {
    result.write(binarySearch(num: arr[i]) + " ")
}
print(result)
