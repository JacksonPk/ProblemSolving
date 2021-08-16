//https://www.acmicpc.net/problem/1697

let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
var isVisited = Array(repeating: false, count: 100001)
let N = input[0]
let K = input[1]
var arr = [N]
isVisited[N] = true
var count = 0
func BFS() -> Int {
    var start = 0
    var end = 1
    var diff = 0

    //while 문을 안돌아도 되는 2가지 경우
    if N == K {
        return 0
    }else if N > K {
        return N - K
    }else {
        while true {
            diff = 0
            for i in start..<end {
                let curr = arr[i]
                let add = curr+1
                let sub = curr-1
                let mul = curr*2
                                
                if curr == K {
                    return count
                } else if add == K || sub == K || mul == K { //이걸 안붙이면 시간초과. 붙이면 틀림
                    return count+1
                }
                
                if add <= 100000 && !isVisited[add] {
                    arr.append(add)
                    isVisited[add] = true
                    diff += 1
                }
                if sub >= 0 && !isVisited[sub] {
                    arr.append(sub)
                    isVisited[sub] = true
                    diff += 1
                }
                if mul <= 100000 && !isVisited[mul] {
                    arr.append(mul)
                    isVisited[mul] = true
                    diff += 1
                }
            }
            count += 1
            start = end
            end += diff
        }
    }
}
print(BFS())
