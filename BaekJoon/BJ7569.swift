//https://www.acmicpc.net/problem/7569
let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let M = input[0] //col
let N = input[1] //row
let H = input[2] //height
let dR = [-1,1,0,0]
let dC = [0,0,-1,1]
let dH = [-1,1]
var cube = Array(repeating: Array(repeating: Array(repeating: 0, count: M), count: N), count: H)
var queue: [[Int]] = [] //익은 토마토들의 위치의 배열 [[H,N,M]]

for h in 0..<H {
    for r in 0..<N {
        let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
        for c in 0..<M where input[c] != 0 {
            if input[c] == 1 { queue.append([h,r,c]) }
            cube[h][r][c] = input[c]
        }
    }
}

func checkCube(cube: [[[Int]]]) -> Bool {
    for h in 0..<H {
        for r in 0..<N {
            for c in 0..<M where cube[h][r][c] == 0 {
                return false
            }
        }
    }
    return true
}

func BFS(queue:[[Int]]) -> Int {
    var minDay = 0
    var todayQueue = queue
    
    while !todayQueue.isEmpty {
        let queue = todayQueue
        todayQueue.removeAll()
        for i in 0..<queue.count {
            let element = queue[i]
            let cH = element[0]
            let cR = element[1]
            let cC = element[2]
            for d in 0..<4 {
                let nR = cR + dR[d]
                let nC = cC + dC[d]
                if (nR >= 0 && nC >= 0 && nR < N && nC < M) && cube[cH][nR][nC] == 0 {
                    cube[cH][nR][nC] = 1
                    todayQueue.append([cH,nR,nC])
                }
            }
            for d in 0..<2 {
                let nH = cH + dH[d]
                if (nH >= 0 && nH < H) && cube[nH][cR][cC] == 0 {
                    cube[nH][cR][cC] = 1
                    todayQueue.append([nH,cR,cC])
                }
            }
        }
        minDay = todayQueue.isEmpty == true ? minDay : minDay+1
    }
    //다 돌았는데도 불구하고 0(익지않은 토마토)이 존재한다면 -1 출력
    return checkCube(cube: cube) == true ? minDay : -1
}

print(BFS(queue: queue))
