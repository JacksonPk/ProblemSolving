let N_C = readLine()!.split(separator: " ").compactMap{ Int(String($0)) }
var homes = [Int]()
for _ in 0..<N_C[0] {
    homes.append(Int(readLine()!)!)
}
homes.sort()

//1 2 4 8 9
func binarySearch() -> Int {
    var left = 0 //
    var right = homes[homes.count - 1]
    var ans = 0
    
    while left <= right {
        var cnt = 1
        let mid = (left + right) / 2
        var ex = homes[0]
        for idx in 1..<homes.count {
            if homes[idx] - ex >= mid {
                ex = homes[idx]
                cnt += 1
            }
        }
        if cnt >= N_C[1] { //조건에 충족하거나 더 크면.
            ans = mid
            left = mid + 1
        } else {
            right = mid - 1
        }
        
    }
    
    return ans
}

print(binarySearch())

//1 2 4 8 9

