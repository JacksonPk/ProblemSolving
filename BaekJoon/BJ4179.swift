//https://www.acmicpc.net/problem/4179

var count = 0
let dR = [-1,1,0,0]
let dC = [0,0,-1,1]
var shouldCallFunc = true
var isEnd = false
var pos = [[Int]]()
var fires = [[Int]]()
var fs = 0
var fe = 0
var ps = 0
var pe = 0
var fdiff = 0
var pdiff = 0

let nm = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let n = nm[0]
let m = nm[1]
var room: [[String]] = [[String]].init(repeating: [String].init(repeating: " ", count: m), count: n)
count = 0
shouldCallFunc = true
isEnd = false
pos = []
fires = []

for i in 0..<n {
    let input = Array(readLine()!)
    if shouldCallFunc != false {
        for j in 0..<m {
            room[i][j] = String(input[j])
            switch room[i][j] {
            case "J":
                if (i == 0 || i == n-1 || j == 0 || j == m-1) {
                    shouldCallFunc = false
                    break
                }
                pos.append([i,j])
            case "F":
                fires.append([i,j])
            default:
                break
            }
        }
    }
}
if !shouldCallFunc { //이미 출구에 있다.
    print("1")
} else {
    fs = 0
    ps = 0
    fe = fires.count
    pe = pos.count
    while ps<pe && !isEnd {
        fdiff = 0
        pdiff = 0
        for i in fs..<fe {
            let fire = fires[i]
            let cR = fire[0]
            let cC = fire[1]
            for d in 0..<4 {
                let nR = cR+dR[d]
                let nC = cC+dC[d]
                if (nR >= 0 && nR < n && nC >= 0 && nC < m) && (room[nR][nC] == "." || room[nR][nC] == "J") {
                    room[nR][nC] = "F"
                    fires.append([nR,nC])
                    fdiff += 1
                }
            }
        }
        
        fs = fe
        fe += fdiff
        
        for i in ps..<pe {
            let curPos = pos[i]
            let cR = curPos[0]
            let cC = curPos[1]
            
            if (cR == 0 || cR == (n-1) || cC == 0 || cC == (m-1)) {
                isEnd = true
                break
            }
            for d in 0..<4 {
                let nR = cR+dR[d]
                let nC = cC+dC[d]
                if (nR >= 0 && nR < n && nC >= 0 && nC < m) && room[nR][nC] == "." {
                    room[nR][nC] = "J"
                    pos.append([nR,nC])
                    pdiff += 1
                }
            }
        }
        
        ps = pe
        pe += pdiff
        
        count += 1
    }
    if !isEnd {
        print("IMPOSSIBLE")
    } else {
        print(count)
    }
}
