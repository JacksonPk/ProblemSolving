////https://www.acmicpc.net/problem/2580
var arr = [Int]()
var isUsed = [Bool]()
var solveArr = [Int]()
for i in 0..<9 {
    let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
    for j in 0..<input.count {
        if input[j] == 0 {
            isUsed.append(false)
            solveArr.append(9*i + j)
        }
        arr.append(input[j])
    }
}

func isAllTrue() -> Bool {
    for i in 0..<isUsed.count {
        if isUsed[i] == false {
            return false
        }
    }
    return true
}
func checkSudoku(index: Int, val: Int) -> Bool {
    //스도쿠 빈 곳은 3가지 경우를 만족해야함
    //같은 행에 같은 값은 존재하면 안된다.(1~9)
    //같은 열에 같은 값 존재 안된다.(1~9)
    //같은 3x3안에 같은 값 존재 안된다(1~9)

    if index == 19 {
        print("")
    }
    let row = (index/9)*9
    let col = index%9
    let posRow = row/27*27
    let posCol = col/3*3

    //같은 행 체크
    for i in row ..< row+9 {
        if index == i {
            continue
        }
        if val == arr[i] {
            return false
        }
    }

    //같은 열 체크
    for i in 0..<9 {
        if index == col + (i*9) {
            continue
        }
        if arr[col + (i*9)] == val {
            return false
        }
    }

    //같은 3x3 매트릭스 체크
    for i in 0..<3 {
        let startRow = (posRow)+(i*9)
        for j in 0..<3 {
            if index == startRow+(posCol+j) {
                continue
            }
            if arr[startRow+(posCol+j)] == val {
                return false
            }
        }
    }
    return true
}

func backTracking(index: Int) {
    if isAllTrue() {
        return
    }

    for i in index..<solveArr.count {
        if isUsed[i] == false {
            for val in 1...9 {
                if checkSudoku(index: solveArr[i], val: val) {
                    isUsed[i] = true
                    arr[solveArr[i]] = val
                    backTracking(index: index+1)
                    if isAllTrue() {
                        return
                    }
                }
            }
            isUsed[i] = false
            arr[solveArr[i]] = 0
            return
        }
    }
}
backTracking(index: 0)

for i in 0..<9 {
    for j in (i*9)..<(i*9)+9 {
        print(arr[j], terminator: " ")
    }
    print("")
}

//체크 함수
//var ans = [Int]()
//for _ in 0..<9 {
//    let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
//    for j in 0..<input.count {
//        ans.append(input[j])
//    }
//}
//print(arr == ans)
