//https://www.acmicpc.net/problem/1052

let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
var (N,K) = (input[0],input[1])
var curHas = 0 //현재 물병의 총 갯수
var count = 0 //몇 개의 물병을 사야할지의 변수
var bit = 1 //비트마스킹을 위한 변수

while true {
    bit = 1
    curHas = 0
    while N > bit { //해당 p에 1이 있는지 체크. 있다는 것은 물병이 있다.
        curHas = (N & bit) > 0 ? curHas+1 : curHas
        bit <<= 1
    }

    if curHas > K { //현재 물병갯수가 K보다 많은지 체크
        count += 1
        N += 1 //물병 하나 더 사기
    } else { //K개보다 물병이 더 적다.
        break
    }
}

print(count)
