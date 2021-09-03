//https://www.acmicpc.net/problem/12100
let N = Int(readLine()!)!

var initMatrix = Array(repeating: Array(repeating: 0, count: N), count: N)
for i in 0..<N {
    let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
    for j in 0..<N {
        initMatrix[i][j] = input[j]
    }
}
var maxNum = 0
var directionArr = Array(repeating: 0, count: 5)

func playGame(arr: [Int]) -> [Int] {
    if arr.count == 0 {
        return []
    }
    var arr = arr
    var reducedArr = [Int]()
    var curr = 0
    var next = 1
    var currVal = arr[curr]

    while next < arr.count {
        
        if arr[next] != currVal { //값이 다르다면 기준점과 기준값을 현재로 바꾼다.
            curr = next
            currVal = arr[next]
        } else { //현재값과 동일하다면
            arr[curr] = currVal<<1 //피봇값 2배
            arr[next] = 0 //해당 값은 0
            curr = next
            currVal = arr[curr]
        }
        next += 1
    }
    
    //0이 존재[원소 합 생김]한다면 없앤다.
    for i in 0..<arr.count where arr[i] != 0 {
        reducedArr.append(arr[i])
    }
    arr = reducedArr
    reducedArr = []
    
    return arr
}

func simulation(matrix: [[Int]], direction: Int) -> [[Int]] {
    var currMatrix = matrix
    var arr = [Int]()
    var changedMatrix = [Int]()
    
    switch direction {
    case 0: //UP
        for col in 0..<N {
            arr = []
            for row in 0..<N where matrix[row][col] != 0 {
                arr.append(matrix[row][col])
            }
            changedMatrix = playGame(arr: arr)
            for i in 0..<changedMatrix.count {
                currMatrix[i][col] = changedMatrix[i]
            }
            for i in changedMatrix.count..<N { //나머지는 0으로 채운다.
                currMatrix[i][col] = 0
            }
        }
    case 1: //Right
        for row in 0..<N {
            arr = []
            for col in 0..<N where matrix[row][col] != 0 {
                arr.append(matrix[row][col])
            }
            changedMatrix = playGame(arr: arr.reversed()).reversed()
            for i in 0..<(N-changedMatrix.count) { //먼저 0으로 채운다.
                currMatrix[row][i] = 0
            }
            for i in 0..<changedMatrix.count {
                currMatrix[row][i+(N-changedMatrix.count)] = changedMatrix[i]
            }
        }
    case 2: //Down
        for col in 0..<N {
            arr = []
            for row in 0..<N where matrix[row][col] != 0 {
                arr.append(matrix[row][col])
            }
            changedMatrix = playGame(arr: arr.reversed()).reversed()
            for i in 0..<(N-changedMatrix.count) { //먼저 0으로 채운다.
                currMatrix[i][col] = 0
            }
            for i in 0..<changedMatrix.count {
                currMatrix[i+(N-changedMatrix.count)][col] = changedMatrix[i]
            }
        }
    case 3: //Left
        for row in 0..<N {
            arr = []
            for col in 0..<N where matrix[row][col] != 0 {
                arr.append(matrix[row][col])
            }
            changedMatrix = playGame(arr: arr)
            for i in 0..<changedMatrix.count {
                currMatrix[row][i] = changedMatrix[i]
            }
            for i in changedMatrix.count..<N { //나머지는 0으로 채운다.
                currMatrix[row][i] = 0
            }
        }
    default:
        break
    }
    return currMatrix
}
func getMaxNum(matirx: [[Int]], directionArr: [Int]) -> Int {
    var curMatrix = matirx
    var maxNum = 0
    for i in 0..<directionArr.count {
        curMatrix = simulation(matrix: curMatrix, direction: directionArr[i])
    }
    for i in 0..<N {
        for j in 0..<N where curMatrix[i][j] > maxNum {
            maxNum = curMatrix[i][j]
        }
    }
    return maxNum
}

func backTracking(idx: Int) {
    if idx == 5 {
        let result = getMaxNum(matirx: initMatrix, directionArr: directionArr)
        maxNum = maxNum < result ? result : maxNum
        return
    }
    
    for i in 0..<4 { //where !(idx != 0 && directionArr[idx-1] == i) {
        directionArr[idx] = i
        backTracking(idx: idx+1)
    }
}

backTracking(idx: 0)
print(maxNum)
