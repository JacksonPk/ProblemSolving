//https://www.acmicpc.net/problem/3020
//N은 짝수 즉 bottoms/tops 갯수는 동일함.
let NandH = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let N = NandH[0]
let H = NandH[1]
var bottoms = [Int]()
var tops = [Int]()

for idx in 0..<N { //석순 = bottoms, 종유석 = tops 최소 1이상이다. 최대 H-1
    if idx % 2 == 0 {
        bottoms.append(Int(readLine()!)!)
    }else{
        tops.append(Int(readLine()!)!)
    }
}

bottoms.sort()
tops.sort()

func getTotalBroked(by height: Int) -> Int {
    
    var bottomCount = 0
    var topCount = 0
    
    var fIdx = 0
    var lIdx = N/2
    
    //LowBound
    while fIdx < lIdx {
        let mIdx = (fIdx+lIdx) / 2
        if bottoms[mIdx] < height {
            fIdx = mIdx + 1
        }else {
            lIdx = mIdx
        }
    }
    
    bottomCount = N/2 - fIdx
    
    fIdx = 0
    lIdx = N/2
        
    //UpperBound
    while fIdx < lIdx {
        let mIdx = (fIdx+lIdx) / 2
        if tops[mIdx] + height <= H {
            fIdx = mIdx + 1
        }else {
            lIdx = mIdx
        }
    }
    
    topCount = N/2 - lIdx

    return bottomCount + topCount
}

var ans = N/2
var ansCount = 2

for newH in 2...H-1 {
    let result = getTotalBroked(by: newH)
    if result < ans {
        ans = result
        ansCount = 1
    }else if result == ans {
        ansCount += 1
    }
}
    
print(ans, ansCount)
