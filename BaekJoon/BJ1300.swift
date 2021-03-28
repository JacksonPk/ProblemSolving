//https://www.acmicpc.net/problem/1300

let matrixIdx = Int(readLine()!)!
let targetIdx = Int(readLine()!)!



func binarySearch(_ targetIdx : Int) -> Int {
    var startIdx = 1
    var backIdx = targetIdx
    var result = 0
    
    while startIdx <= backIdx {
        let midIdx = (startIdx + backIdx) / 2
        
        //핵심부분
        var countOfLessThanMid = 0
        for idx in 1...matrixIdx {
            countOfLessThanMid += min(matrixIdx, midIdx / idx)
        }
        
        if countOfLessThanMid >= targetIdx {
            result = midIdx
            backIdx = midIdx - 1
        }else {
            startIdx = midIdx + 1
        }
    }
    
    return result
    
}

print(binarySearch(targetIdx))
