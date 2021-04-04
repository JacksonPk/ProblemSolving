//https://www.acmicpc.net/problem/1654

//N개보다 많이 만드는 것도 N개를 만드는 것에 포함된다. 이때 만들 수 있는 최대 랜선의 길이를 구하는 프로그램을 작성하시오.
//UpperBound
let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let needAns = input[1]
var lines = [Int]()
for _ in 0..<input[0] {
    lines.append(Int(readLine()!)!)
}

func cutLines(by num : Int ) -> Int {
    lines.reduce(0){$0 + $1/num}
}

func binarySearch() -> Int{
    var left = 1
    var right = lines.max()!
    var ans = 0
    while left <= right {
        let mid = (left + right) / 2
        
        if cutLines(by: mid) >= needAns {
            ans = mid
            left = mid + 1
        }else {
            right = mid - 1
        }
    }
    
    return ans
}

print(binarySearch())
