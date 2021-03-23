//https://www.acmicpc.net/problem/15953

let firstArr = [1:500,2:300,3:200,4:50,5:30,6:10]
let sortfirstDict = Array(firstArr.keys).sorted( by: < )

let secondArr = [1:512,2:256,4:128,8:64,16:32]
let sortsecondDict = Array(secondArr.keys).sorted( by: < )

func getPrize(rank : Int, _ Arr : [Int:Int], _ sortDict : [Int]) -> Int {
    if rank == 0 {
        return 0
    }
    var playerRank = rank
    for rankKey in sortDict {
        playerRank = playerRank - rankKey
        if playerRank <= 0 {
            return Arr[rankKey]!
        }
    }
    return 0
}

for _ in 0..<Int(readLine()!)! {
    let input = readLine()!.split(separator: " ").compactMap{Int($0)}
    print((getPrize(rank: input[0], firstArr, sortfirstDict)+getPrize(rank: input[1], secondArr, sortsecondDict))*10000)
}

