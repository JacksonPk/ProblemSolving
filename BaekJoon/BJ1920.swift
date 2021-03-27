//https://www.acmicpc.net/problem/1920

let _ = readLine()
let intArr = readLine()!.split(separator: " ").compactMap{Int($0)}.sorted()
let _ = readLine()
let targets = readLine()!.split(separator: " ").compactMap{Int($0)}

//이분탐색 함수.
func binarySearch(_ target : Int) -> Int{
    var start = 0
    var end = intArr.count - 1
    
    while start <= end {
        
        let mid = (start + end) / 2
        
        if target == intArr[mid] {
            return 1
        }else if target > intArr[mid] {
            start = mid + 1
        }else {
            end = mid - 1
        }
    }
    
    return 0
}
for v in targets {
    print(binarySearch(v))
}

