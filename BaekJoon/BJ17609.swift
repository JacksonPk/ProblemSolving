//https://www.acmicpc.net/problem/17609

func isPseudo(arr: [String], left: Int, right: Int) -> Bool {
    var left = left
    var right = right
    
    while left < right {
        if arr[left] != arr[right] {
            return false
        }
        left += 1
        right -= 1
    }
    return true
}

func twoPointer(arr: [String]) -> Int {
    var left = 0
    var right = arr.count - 1

    while left < right {
        if arr[left] != arr[right] {
            if isPseudo(arr: arr, left: left+1, right: right) || isPseudo(arr: arr, left: left, right: right-1) {
                return 1
            } else {
                return 2
            }
        }
        left += 1
        right -= 1
    }
    return 0
}

for _ in 0..<Int(readLine()!)! {
    print(twoPointer(arr: readLine()!.compactMap{String($0)}))
}

