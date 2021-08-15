//https://www.acmicpc.net/problem/5427
//메모리초과 ,, 정답을 봐도 잘 모르겠다

var room: [[Character]] = [[]]
var pos = [[Int]]()
var fires = [[Int]]()
var curFire = [[Int]]()
var curPos = [[Int]]()
var count = 1
let dR = [-1,1,0,0]
let dC = [0,0,-1,1]

for _ in 0..<Int(readLine()!)! {
    let nm = readLine()!.split(separator: " ").compactMap{Int(String($0))}
    let n = nm[1]
    let m = nm[0]
    var shouldCallFunc = true
    pos = []
    fires = []
    count = 0
    room = []
    var isEnd = false
    for i in 0..<n {
        let input = Array(readLine()!)
        room.append([])
        if shouldCallFunc != false {
            for j in 0..<m {
                room[i].append(input[j])/// [j] =
                switch room[i][j] {
                case "@":
                    if (i == 0 || i == n-1 || j == 0 || j == m-1) { shouldCallFunc = false }
                    pos.append([i,j])
                case "*":
                    fires.append([i,j])
                default:
                    break
                }
            }
        }
    }
    if !shouldCallFunc { //이미 출구에 있다.
        print(1)
        shouldCallFunc = true
    } else {
        while !pos.isEmpty && !isEnd {
            curFire = fires
            curPos = pos
            fires = []//.removeAll()
            pos = []//.removeAll()
            
            curFire.forEach { fire in
                let cR = fire[0]
                let cC = fire[1]
                for d in 0..<4 {
                    let nR = cR+dR[d]
                    let nC = cC+dC[d]
                    if (nR >= 0 && nR < n && nC >= 0 && nC < m) && room[nR][nC] == "." {
                        room[nR][nC] = "*"
                        fires.append([nR,nC])
                    }
                }
            }
            for i in 0..<curPos.count {
                let cR = curPos[i][0]
                let cC = curPos[i][1]
                
                if (cR == 0 || cR == (n-1) || cC == 0 || cC == (m-1)) {
//                    return count
                    isEnd = true
                }
                for d in 0..<4 {
                    let nR = cR+dR[d]
                    let nC = cC+dC[d]
                    if (nR >= 0 && nR < n && nC >= 0 && nC < m) && room[nR][nC] == "." {
                        pos.append([nR,nC])
                    }
                }
            }
            count += 1
        }
        if !isEnd { //출구 못나옴
            print("IMPOSSIBLE")
        } else {
            print(count)
        }
        
        isEnd = false
    }
}
//5
//4 3
//####
//#*.@
//####
//7 6
//###.###
//#*#.#*#
//#.....#
//#.....#
//#..@..#
//#######
//7 4
//###.###
//#....*#
//#@....#
//.######
//5 5
//.....
//.***.
//.*@*.
//.***.
//.....
//3 3
//###
//#@#
//###
