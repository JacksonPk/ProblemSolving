//https://www.acmicpc.net/problem/11652

var arr = [Int]()
for _ in 0 ..< Int(readLine()!)! {
    arr.append(Int(readLine()!)!)
}
arr.sort()

var fPick = arr[0]
var fCount = 1

var isSPick = false
var sPick = 0
var sCount = 0

for i in 1..<arr.count {
    if arr[i] == fPick { //첫번째 카드와 같다면 증가
        fCount += 1
    }else {
        if !isSPick { // 두번째 카드를 고른상태 체크
            sPick = arr[i]
            sCount += 1
            isSPick = true
        } else { //이미 두번째 카드가 골라진상태이면
            if arr[i] == sPick { //현재 카드가 두번째 카드와 같은지
                sCount += 1
            } else { //그게 아니라면 첫번째카드와 두번째카드 상태를 확인
                if fCount < sCount { //두번째 카드가 카운트 더 많으면 fPick 변경
                    fPick = sPick
                    fCount = sCount
                }
                sPick = arr[i]
                sCount = 1
            }
        }
    }
}

if fCount >= sCount {
    print(fPick)
}else {
    print(sPick)
}

//print(fPick, fCount, sPick, sCount)
////var arr = [1, 1, 1, 2, 2, 3, 4, 5, 6, 6, 6, 6,7, 7,8,8,8,8,8,8,8]
