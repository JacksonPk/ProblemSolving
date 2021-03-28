//https://www.acmicpc.net/problem/10815
//이분탐색
let _ = readLine()
let intArr = readLine()!.split(separator: " ").compactMap{Int($0)}.sorted()
let _ = readLine()
let targets = readLine()!.split(separator: " ").compactMap{Int($0)}
var resultstr = ""
func binarySearch(_ target : Int){
    var start = 0
    var end = intArr.count - 1

    while start <= end {

        let mid = (start + end) / 2

        if target == intArr[mid] {
            resultstr.write("1")
            return
        }else if target > intArr[mid] {
            start = mid + 1
        }else {
            end = mid - 1
        }
    }

    resultstr.write("0")
    return
}

for v in targets {
    binarySearch(v)
    resultstr.write(" ")
}
print(resultstr)

