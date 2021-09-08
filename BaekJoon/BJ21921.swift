//https://www.acmicpc.net/problem/21921
let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let (N,X) = (input[0],input[1])
let arr = readLine()!.split(separator: " ").compactMap{Int(String($0))}

func twoPointer() {
    var maxVisit = 0
    var days = 1
    var left = 0
    var right = X
    var curVisit = 0
    
    //Init subSum
    for i in left..<right {
        curVisit += arr[i]
    }
    maxVisit = max(maxVisit,curVisit)
        
    while right < arr.count {
        curVisit = curVisit - arr[left] + arr[right]
        left += 1
        right += 1
        
        if curVisit > maxVisit {
            maxVisit = curVisit
            days = 1
        } else if curVisit == maxVisit {
            days += 1
        } else {
            continue
        }
    }

    if maxVisit == 0 {
        print("SAD")
    } else {
        print("\(maxVisit)\n\(days)")
    }
}

twoPointer()
