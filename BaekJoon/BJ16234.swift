//https://www.acmicpc.net/problem/16234

let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let N = input[0]
let L = input[1]
let R = input[2]
var matrix = Array(repeating: Array(repeating: 0, count: N), count: N)
var isOpend = Array(repeating: Array(repeating: false, count: N), count: N)
for i in 0..<N {
    let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
    for j in 0..<N {
        matrix[i][j] = input[j]
    }
}

func movePeople(allZones: [[[Int]]]) { //인접한 구역끼리의 인구 이동
    var maxPeople = 0
    var dividePeople = 0
    
    for i in 0..<allZones.count {
        maxPeople = 0
        for j in 0..<allZones[i].count {
            let country = allZones[i][j]
            let row = country[0]
            let col = country[1]
            maxPeople += matrix[row][col]
        }
        dividePeople = maxPeople / allZones[i].count
        
        for j in 0..<allZones[i].count {
            let country = allZones[i][j]
            let row = country[0]
            let col = country[1]
            matrix[row][col] = dividePeople
        }
    }
}

func findAllZones(isOpend: [[Bool]]) -> [[[Int]]] { //인접한 국가들의 구역을 구함
    var allZones = [[[Int]]]() //한 인접한 구역의 모든 나라들의 위치 [row,col]
    var dailyIsOpend = isOpend
    
    func BFS(row: Int, col: Int) -> [[Int]] {
        let dR = [-1,1,0,0]
        let dC = [0,0,-1,1]
        var zone = [[Int]]()
        var queue = [[row,col]]
        
        while !queue.isEmpty {
            let country = queue.removeLast()
            let cR = country[0]
            let cC = country[1]
            zone.append([cR,cC])
            dailyIsOpend[cR][cC] = true
            for d in 0..<4 {
                let nR = cR + dR[d]
                let nC = cC + dC[d]
                if (nR >= 0 && nC >= 0 && nR < N && nC < N) && !dailyIsOpend[nR][nC] &&
                    (abs(matrix[nR][nC]-matrix[cR][cC]) >= L && abs(matrix[nR][nC]-matrix[cR][cC]) <= R) {
                    dailyIsOpend[nR][nC] = true
                    queue.append([nR,nC])
                }
            }
        }
        return zone
    }
    
    for r in 0..<N {
        for c in 0..<N where !dailyIsOpend[r][c] {
            let zones = BFS(row: r, col: c)
            if zones.count != 1 {
                allZones.append(zones)
            }
        }
    }

    return allZones
}
func simulation() -> Int {
    var days = 0
    var allZones = findAllZones(isOpend: isOpend)
    
    while allZones.count > 0 {
        days += 1
        movePeople(allZones: allZones)
        allZones = findAllZones(isOpend: isOpend)
    }
        
    return days
}
print(simulation())
