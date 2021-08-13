//https://www.acmicpc.net/problem/7576
let nm = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let n = nm[1]
let m = nm[0]
var arr = Array(repeating: Array(repeating: 0, count: m), count: n)
let dR = [-1,1,0,0]
let dC = [0,0,-1,1]
var numOfZero = 0
for i in 0..<n {
    let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
    for j in 0..<m {
        if input[j] == 0 { numOfZero += 1 }
        arr[i][j] = input[j]
    }
}

func BFS() -> Int {
    var min = -1
    var queue = [[Int]]()

    //Case1. non raw tomato
    if numOfZero == 0 {
        return 0
    }
    //check init ripen tomato
    for i in 0..<n {
        for j in 0..<m {
            if arr[i][j] == 1 {
                queue.append([i,j])
            }
        }
    }
    
    //ripping tomatos
    while !queue.isEmpty {
        let curQ = queue
        queue.removeAll()
        
        for i in 0..<curQ.count {
            let cR = curQ[i][0]
            let cC = curQ[i][1]
            for j in 0..<4 {
                let nR = cR+dR[j]
                let nC = cC+dC[j]
                if (nR >= 0 && nR < n && nC >= 0 && nC < m) && arr[nR][nC] == 0 {
                    arr[nR][nC] = 1
                    numOfZero -= 1
                    queue.append([nR,nC])
                }
            }
        }
        min += 1
    }
    //Return Case2 or Case3
    //Case2. can't ripping all tomatos
    //Case3. min dates when all tomatos got rippen.
    return numOfZero == 0 ? min : -1
}
print(BFS())

//반례
//4 3
//1 -1 -1 1
//-1 0 0 -1
//-1 -1 -1 -1
