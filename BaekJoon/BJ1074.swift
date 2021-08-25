//https://www.acmicpc.net/problem/1074

let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let N = input[0]
let r = input[1]
let c = input[2]
var num = 0
func recursion(n: Int, r: Int, c: Int) -> Int { //r, c가 어느 사사분면인지를 알아야한다.
    if n == 0 {
        return 0
    }

    let mid = 1<<(n-1)
    let subMatrix = mid*mid
    
    if r < mid && c < mid {
        return recursion(n: n-1, r: r, c: c)
    } else if r < mid && c >= mid {
        return subMatrix + recursion(n: n-1, r: r, c: c-mid)
    } else if r >= mid && c < mid {
        return 2*subMatrix + recursion(n: n-1, r: r-mid, c: c)
    } else {
        return 3*subMatrix + recursion(n: n-1, r: r-mid, c: c-mid)
    }
    
}

print(recursion(n: N, r: r, c: c))


