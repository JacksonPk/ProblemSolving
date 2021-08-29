//https://www.acmicpc.net/problem/15683

import Foundation
//# 대신 -1 로 생각하기. 6번은 벽이고 각 결과마다 0이 몇개인지 체크하기.
let NM = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let N = NM[0]
let M = NM[1]
var arr = Array(repeating: Array(repeating: 0, count: M), count: N)
var minSize = N*M
var c1 = [[Int]]()
var c2 = [[Int]]()
var c3 = [[Int]]()
var c4 = [[Int]]()
var c5 = [[Int]]()

for i in 0..<N {
    let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
    for j in 0..<M where input[j] != 0 {
        switch input[j] {
        case 1:
            c1.append([i,j])
        case 2:
            c2.append([i,j])
        case 3:
            c3.append([i,j])
        case 4:
            c4.append([i,j])
        case 5:
            c5.append([i,j])
        default:
            break
        }
        arr[i][j] = input[j]
        minSize -= 1
    }
}

if minSize == 0 {
    print(minSize)
} else {
    var matrix = arr
    let cameras = c1+c2+c3+c4
    
    let c2Start = c1.count
    let c3Start = c2Start + c2.count
    let c4Start = c3Start + c3.count
    //directions = 톱니바퀴 or 4진수 라고 생각하기.
    //앞의 index가 4가 될때마다 다음 index는 1씩 증가하는 방식
    var directions = Array(repeating: 0, count: cameras.count)
    // 여기까지 init 단계

    func camera(pos:[Int], direction:Int) {
        let row = pos[0]
        let col = pos[1]
        switch direction {
        case 0:
            for i in stride(from: row-1, to: -1, by: -1) {
                if matrix[i][col] == 6 {
                    break
                }else if matrix[i][col] == 0 {
                    matrix[i][col] = -1
                }
            }
        case 1:
            for i in col+1..<M {
                if matrix[row][i] == 6 {
                    break
                }else if matrix[row][i] == 0 {
                    matrix[row][i] = -1
                }
            }
        case 2:
            for i in row+1..<N {
                if matrix[i][col] == 6 {
                    break
                }else if matrix[i][col] == 0 {
                    matrix[i][col] = -1
                }
            }
        case 3:
            for i in stride(from: col-1, to: -1, by: -1) {
                if matrix[row][i] == 6 {
                    break
                }else if matrix[row][i] == 0 {
                    matrix[row][i] = -1
                }
            }
        default:
            break
        }
    }
    
    func simulator() -> Int { //총 0이 몇개인지
        var count = 0
        for i in 0..<N {
            for j in 0..<M {
                if matrix[i][j] == 0 {
                    count += 1
                }
            }
        }
        return count
    }

    //5번카메라는 고정.
    while !c5.isEmpty { //5번 카메라는 경우의 수가 1개.
        let c = c5.removeLast()
        camera(pos: c, direction: 0)
        camera(pos: c, direction: 1)
        camera(pos: c, direction: 2)
        camera(pos: c, direction: 3)
    }
    arr = matrix
    
    //핵심부분 for문 각 카메라(1~4)마다 방향을 바꿈
    for i in 1...Int(pow(4, Double(directions.count))) {
        matrix = arr
        var fours = 1
        for idx in 0..<cameras.count {
            if i % fours == 0 {
                directions[idx] = (directions[idx]+1) % 4
            }
            fours *= 4
        }
        
        for cIdx in 0..<cameras.count{
            if cIdx<c2Start {
                camera(pos: cameras[cIdx], direction: directions[cIdx])
            }else if cIdx>=c2Start && cIdx<c3Start {
                camera(pos: cameras[cIdx], direction: directions[cIdx])
                camera(pos: cameras[cIdx], direction: (directions[cIdx]+2)%4)
            }else if cIdx>=c3Start && cIdx<c4Start {
                camera(pos: cameras[cIdx], direction: directions[cIdx])
                camera(pos: cameras[cIdx], direction: (directions[cIdx]+1)%4)
            }else {
                camera(pos: cameras[cIdx], direction: directions[cIdx])
                camera(pos: cameras[cIdx], direction: (directions[cIdx]+1)%4)
                camera(pos: cameras[cIdx], direction: (directions[cIdx]+2)%4)
            }
        }
        
        let result = simulator()
        if result == 0 {
            minSize = 0
            break
        }else {
            minSize = result < minSize ? result : minSize
        }
    }
    print(minSize)
}

//3 7
//0 0 0 0 0 0 0
//0 0 0 0 0 0 6
//0 0 0 0 0 6 1
//for i in 0..<N {
//    print(arr[i])
//}
//3 1
//0
//0
//0

//4 4
//0 6 0 3
//0 1 0 0
//0 0 1 6
//0 0 0 0


//5 2
//0 0
//0 0
//3 0
//0 0
//6 0
