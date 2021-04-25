//https://www.acmicpc.net/problem/11663

let nm = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let dots = readLine()!.split(separator: " ").compactMap{Int(String($0))}.sorted()
let n = nm[0]
let m = nm[1]

func lowerBoundBS(point : Int) -> Int{
    var left = 0
    var right = n - 1
    var ans = 0
    
    while left <= right {
        let mid = (left + right) / 2
//        let value = dots[mid]
        if dots[mid] > point {
            right = mid - 1
        }else if dots[mid] < point{
            ans = mid
            left = mid + 1
        }else { //같은 값이 나오진 않기때문에 더 할 필요 없다.
            return mid
        }
    }
    
    return ans
}

func upperBoundBS(point : Int) -> Int{
    var left = 0
    var right = n - 1
    var ans = 0
    
    while left <= right {
        let mid = (left + right) / 2
        if dots[mid] < point {
            ans = mid
            left = mid + 1
        }else if dots[mid] > point{
            right = mid - 1
        }else { //같은 값이 나오진 않기때문에 더 할 필요 없다.
            return mid
        }
    }
    
    return ans
}

func getDots(lhs : Int, rhs : Int) -> Int {

    let leftAns = lowerBoundBS(point: lhs)
    let rightAns = upperBoundBS(point: rhs)
        
    if dots[leftAns] < lhs && dots[rightAns] > rhs{
        return rightAns - leftAns - 1
    }else if dots[leftAns] < lhs || dots[rightAns] > rhs{
        return rightAns-leftAns
    }else{
        return rightAns-leftAns+1
    }
}

var results = [Int]()
for _ in 0..<m {
    let line = readLine()!.split(separator: " ").compactMap{Int(String($0))}
//    print(getDots(lhs: line[0], rhs: line[1]))
    results.append(getDots(lhs: line[0], rhs: line[1]))
}

for val in results {
    print(val)
}
