//https://www.acmicpc.net/problem/18808
let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let N = input[0]
let M = input[1]
var matrix = Array(repeating: Array(repeating: 0, count: M), count: N)
let numOfStickers = input[2]
var stickers = [[[Int]]]()
var sizeOfStickers = [Int]()
var answer = 0 //문제의 정답

//입력
for _ in 0..<numOfStickers {
    let rowNCol = readLine()!.split(separator: " ").compactMap{Int(String($0))}
    var sticker = Array(repeating: Array(repeating: 0, count: rowNCol[1]), count: rowNCol[0])
    var sizeOfSticker = 0
    for i in 0..<rowNCol[0] {
        let vals = readLine()!.split(separator: " ").compactMap{Int(String($0))}
        for j in 0..<rowNCol[1] where vals[j] == 1 {
            sticker[i][j] = vals[j]
            sizeOfSticker += 1
        }
    }
    //예외처리 - matrix Size를 벗어나면 입력받을 필요없음.
    if max(rowNCol[0],rowNCol[1]) <= max(N,M) {
        stickers.append(sticker)
        sizeOfStickers.append(sizeOfSticker)
    }
}

func rotate(sticker: [[Int]]) -> [[Int]] { //스티커 시계방향 90도 회전
    let row = sticker.count
    let col = sticker[0].count
    var rotateSticker = Array(repeating: Array(repeating: 0, count: row), count: col)
    for r in 0..<row {
        for c in 0..<col {
            rotateSticker[c][(row-1)-r] = sticker[r][c]
        }
    }
    return rotateSticker
}

func attachSticker(matrix: [[Int]], sticker: [[Int]]) -> ([[Int]],Bool) { //체크 및 스티커 붙이기, tuple 반환이유는 체크와 동시에 true이면 완성된 모눈종이를 그대로 가져오는게 편해서
    
    func availableToAttach(sRow: Int, sCol:Int) -> ([[Int]],Bool) {
        var newMatrix = matrix
        for i in 0..<sticker.count {
            for j in 0..<sticker[0].count where sticker[i][j] == 1{
                if matrix[sRow+i][sCol+j] == 1 { //겹치면 바로 종료
                    return ([[]],false)
                } else {
                    newMatrix[sRow+i][sCol+j] = 1
                }
            }
        }
        return (newMatrix,true)
    }
    //sRow, sCol 스티커를 모눈종이 위에 붙일 수 있는 범위
    for sRow in 0...(N - sticker.count) {
        for sCol in 0...(M - sticker[0].count) {
            let result = availableToAttach(sRow: sRow, sCol: sCol)
            if result.1 == true {
                return (result.0,true)
            }
        }
    }
    return ([[]],false)
}

for i in 0..<stickers.count {
    var sticker = stickers[i]
    for _ in 0..<4 { //방향변경
        if sticker.count > N || sticker[0].count > M { //스티커 사이즈가 벗어나면 회전만 하기
            sticker = rotate(sticker: sticker)
            continue
        }
        let result = attachSticker(matrix: matrix, sticker: sticker)
        if result.1 == true {
            matrix = result.0
            answer += sizeOfStickers[i] //해당스티커의 사이즈 추가
            break
        }
        sticker = rotate(sticker: sticker)
    }
}

//출력
print(answer)

/*
 고민한 흔적거리
 일단 스티커는 순서가 있다.
 다 붙인다고 해도 스티커의 규격(row,col 귀퉁이가 없거나 스티커는 오로지 하나의 스티커만 존재)해당하지 않으면 그건 완성 X
  O(4^k*4(direction)*NM(matrix size)) k=numOfStickers.
 worst (O(4*100)^10)???? 그건 아니고
 일단 붙일수있으면 붙이고 아니면 넘어가고 절대 400^10 은 아니라
 첫번째는 무조건 왼족위. 돌리는 케이스까지 생각하면 총 두번. N*M 에서 M*N으로 한번안에 결과가 나옴.
 두번째부터는 얘기가 조금 달라지긴하는데 돌리는거(4)* 위치잡기(위치는 N*M 내에서 k의 size를 비율을 따져서 n*m/N*M 해야할듯 1/100 이 worst= 스티커사이즈는 1x1이고 모눈종이는 10*10일때
 따라서 2* 근데 1x1은 회전을해도 같긴한데..  최소 2x2부터 4회전이 생길수 있다 ex) ㄱ, ㄴ ..
 그러면 4/100 = 1* (25번 * 4) 100^9 라는건가? 근데 한번 하면 끝나기때문에
 100 * 9 가 맞지 않을까
 첫번째 스티커는 공간만 있으면 무조건 왼쪽 위. 뿐만 아니라 모든 스티커들이 공간이 있다면 회전을 안할듯? ㅇㅇ
 중간에 스티커가 공간이 아예없으면 그냥 버림
 불필요한 공간이 생기도록 완성된 스티커는 그냥 버리기? 이 부분을 모르겠음.
 헷갈리는 부분
 완성을 했는데 스티커가 아니면 그대로 에러일지 <-이것이라고본다

 */
