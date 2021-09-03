
//https://www.acmicpc.net/problem/15686

let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let N = input[0]
let M = input[1]
var stores: [[Int]] = []
var homes: [[Int]] = []
var pickedStores: [[Int]] = []
var isUsed: [Bool]
var minTotalDistance = (N+N)*(2*N) //worst Case : 각 집(0,0)이 모두 하나의 가게(N,N)와 가장 멀리 떨어진 경우 distance = (N+N) * 총 집의 개수(2N)
for i in 0..<N {
    let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
    for j in 0..<N where input[j] != 0 {
        if input[j] == 1 { homes.append([i,j]) }
        if input[j] == 2 { stores.append([i,j]) }
    }
}

isUsed = Array(repeating: false, count: stores.count)

//하나의 집 기준으로 가장 가까운 상점의 거리를 계산해 총 도시거리를 계산하는 함수
func getDistance(stores: [[Int]]) -> Int {
    var totalDistance = 0
    for i in 0..<homes.count {
        let home = homes[i]
        var minDistance = 2*N
        for j in 0..<pickedStores.count {
            let store = pickedStores[j]
            let curDistance = (abs(store[0]-home[0]) + abs(store[1]-home[1]))
            minDistance = curDistance < minDistance ? curDistance : minDistance
        }
        totalDistance += minDistance
    }
    return totalDistance
}

func backTracking(idx: Int) {
    if pickedStores.count == M {
        let result = getDistance(stores: pickedStores)
        minTotalDistance = result < minTotalDistance ? result : minTotalDistance
        return
    }

    for i in (idx)..<stores.count where !isUsed[i] {
        isUsed[i] = true
        pickedStores.append(stores[i])
        backTracking(idx: i+1)
        isUsed[i] = false
        pickedStores.removeLast()
    }
}

backTracking(idx: 0)
print(minTotalDistance)
