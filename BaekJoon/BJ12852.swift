//https://www.acmicpc.net/problem/12852

let N = Int(readLine()!)!
var arr = Array(repeating: 0, count: N+1)
var graphArr = Array(repeating: [Int](), count: N+1)

arr[0] = 0
arr[1] = 0
graphArr[0].append(0)
graphArr[1].append(1)

func dp(num: Int) -> Int {
    if num <= 1 {
        return 0
    }
    
    for i in 2..<arr.count {
        var minCount = 0
        let min1 = arr[i-1]
        let min2 = arr[i/2]
        let min3 = arr[i/3]

        if (i % 3) == 0 && (i % 2) == 0 {
            if min1 <= min2 && min1 <= min3 {
                minCount = min1
                graphArr[i] = graphArr[i-1]
                graphArr[i].insert(i, at: 0)
            }else if min2 <= min3 {
                minCount = min2
                graphArr[i] = graphArr[i/2]
                graphArr[i].insert(i, at: 0)
            }else {
                minCount = min3
                graphArr[i] = graphArr[i/3]
                graphArr[i].insert(i, at: 0)
            }

        }else if (i % 3) == 0  {
            if min1 <= min3 {
                minCount = min1
                graphArr[i] = graphArr[i-1]
                graphArr[i].insert(i, at: 0)
            }else {
                minCount = min3
                graphArr[i] = graphArr[i/3]
                graphArr[i].insert(i, at: 0)
            }
        }else if (i % 2) == 0  {
            if min1 <= min2 {
                minCount = min1
                graphArr[i] = graphArr[i-1]
                graphArr[i].insert(i, at: 0)
            }else {
                minCount = min2
                graphArr[i] = graphArr[i/2]
                graphArr[i].insert(i, at: 0)
            }
        }else {
            minCount = min1
            graphArr[i] = graphArr[i-1]
            graphArr[i].insert(i, at: 0)
        }
        arr[i] = minCount+1
    }
    return arr[arr.count-1]
}
print(dp(num: N))
for i in 0..<graphArr[N].count {
    print(graphArr[N][i], terminator: " ")
}
print("")

//100 50 25 24 8 4 2 1
