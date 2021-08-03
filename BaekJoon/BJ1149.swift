//https://www.acmicpc.net/problem/1149

//3
//26 40 83
//49 60 57
//13 89 99

//두개의 2차원 테이블 이용
//mins[0] : homes[0][0] , homes[0][1], homes[0][2]
//mins[1] : [0][49+ min(mins[0][1],mins[0][2])]
//          [1][60+ min(mins[0][0],mins[0][2])]
//          [2][57+ min(mins[0][0],mins[0][1])]
// and so on...
// 마지막에는 min(mins[N-1][0],mins[N-1][1],mins[N-1][2])


//테이블
let N = Int(readLine()!)!
var homes = Array(repeating: Array(repeating: 0, count: 3), count: N)
var mins = Array(repeating: Array(repeating: 0, count: 3), count: N)
for i in 0..<N {
    let RGB = readLine()!.split(separator: " ").compactMap{Int(String($0))}
    for j in 0..<3 {
        homes[i][j] = RGB[j]
    }
}

func DP() -> Int {
    mins[0][0] = homes[0][0]
    mins[0][1] = homes[0][1]
    mins[0][2] = homes[0][2]
    
    if N == 1 { //1개만 있으면 return
        return mins[N-1].min()!
    }
    
    for i in 1..<N {
        mins[i][0] = homes[i][0] + min(mins[i-1][1], mins[i-1][2])
        mins[i][1] = homes[i][1] + min(mins[i-1][0], mins[i-1][2])
        mins[i][2] = homes[i][2] + min(mins[i-1][0], mins[i-1][1])
    }
    
    return mins[N-1].min()!
}

print(DP())
