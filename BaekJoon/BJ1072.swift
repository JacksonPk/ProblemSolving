//https://www.acmicpc.net/problem/1072

let xy = readLine()!.split(separator: " ").compactMap{Int(String($0))}


func binarySearch() -> Int {
    var left = 1
    var rigth = 1000000000
    let z = (xy[1]*100) / xy[0]
    var ans = -1
    
    while left <= rigth {
        let mid = (left + rigth) / 2
        
        if ((xy[1] + mid) * 100) / (xy[0] + mid ) > z {
            ans = mid
            rigth = mid - 1
        }else {
            left = mid + 1
        }
    }    
    return ans
}

print(binarySearch())
