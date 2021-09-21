//https://www.acmicpc.net/problem/9465

/*
 입력예시 :
 0 0 0 0 0
 0 0 0 0 0
 
 누적합은 아래 두 예시 중 max값을 선택
 "0" 0 "0" 0 "0"
  0 "0" 0 "0" 0
 
  0 "0" 0  0 "0"
 "0" 0 "0" 0  0
 
 */
func dp(inputMatrix: [[Int]]) -> Int {
    var matrix = inputMatrix
    let count = inputMatrix[0].count
    if count == 1 {
        return max(matrix[0][0], matrix[1][0])
    } else if count == 2 {
        return max(matrix[0][0] + matrix[1][1], matrix[1][0] + matrix[0][1])
    }
    
    matrix[0][1] += matrix[1][0]
    matrix[1][1] += matrix[0][0]
    
    for i in 2..<count {
        matrix[0][i] = max(matrix[1][i-1], matrix[1][i-2]) + matrix[0][i]
        matrix[1][i] = max(matrix[0][i-1], matrix[0][i-2]) + matrix[1][i]
    }
    
    return max(matrix[0][count-1],matrix[1][count-1])
}
for _ in 0..<Int(readLine()!)! {
    var matrix = Array(repeating: Array(repeating: 0, count: Int(readLine()!)!), count: 2)
    let firstRow = readLine()!.split(separator: " ").compactMap{Int(String($0))}
    let secondRow = readLine()!.split(separator: " ").compactMap{Int(String($0))}
    for i in 0..<matrix[0].count {
        matrix[0][i] = firstRow[i]
        matrix[1][i] = secondRow[i]
    }
    
    print(dp(inputMatrix: matrix))
}
//
////입력이 이럴때
//50 10 100 20 40 1000
//30 50 70 10 60 0
//
//"50" 10 "100" 20 40
//30 "50" 70 10 "60"
//
////50,50,100,10
////50,50,100,60
//
//4번째까지는 이게 높은데
//"50" 10 "100" 20
//30 "50" 70 "10"
//
//5번째는
//50 50 100 60 으로 하ㅗㄱ
//
//6번째는 다시
//50 50 100 10 1000이 맞다
//4개의 합과 현재의 합 40이랑 3번째까지의 합과 현재idx의 max값
//
//50 10 100 20 40 0 80
//30 50 70  10 60 0 50
//
//"50" 10 "100" 20 40  0 "80"
//30 "50" 70   10 "60" 0 50
//
//50 10 100 20 40 0 80
//30 50 70  10 60 0 50
//
//
