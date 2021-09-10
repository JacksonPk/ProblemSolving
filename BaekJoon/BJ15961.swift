//https://www.acmicpc.net/problem/15961
import Foundation

final class FileIO {
    private let buffer: Data
    private var index: Int = 0
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        self.buffer = try! fileHandle.readToEnd()! // 인덱스 범위 넘어가는 것 방지
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer {
            index += 1
        }
        guard index < buffer.count else { return 0 }
        
        return buffer[index]
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }


    @inline(__always) func readString() -> String {
            var str = ""
            var now = read()

            while now == 10
                    || now == 32 { now = read() } // 공백과 줄바꿈 무시

            while now != 10
                    && now != 32 && now != 0 {
                str += String(bytes: [now], encoding: .ascii)!
                now = read()
            }

            return str
        }
}

let fileIO = FileIO()
let (N,d,k,c) = (fileIO.readInt(),fileIO.readInt(),fileIO.readInt(),fileIO.readInt())
var arr = Array(repeating: 0, count: N)
var numCountDict = [Int:Int]()
for i in 0..<N {
    arr[i] = fileIO.readInt()
}

for i in 1...d {
    numCountDict[i] = 0 //모든 초밥 초기화
}

func twoPointer() -> Int {
    var maxVal = 0
    var left = 0
    var right = k
    var count = 0
        
    for i in left..<right {
        if numCountDict[arr[i]]! == 0 {
            numCountDict[arr[i]] = 1
            count += 1
        } else {
            numCountDict[arr[i]]! += 1
        }
    }
    maxVal = numCountDict[c] != 0 ? count : count+1
    if maxVal == k+1 { return k+1 }
    numCountDict[arr[left]]! -= 1
    count = numCountDict[arr[left]]! == 0 ? count - 1 : count
    left += 1
        
    while left < arr.count {
        if numCountDict[arr[right % N]] == 0  { //처음 나온 초밥이면 추가
            numCountDict[arr[right % N]] = 1
            count += 1
        } else {
            numCountDict[arr[right % N]]! += 1 //다시 나왔으면 횟수 추가
        }
        
        maxVal = max(maxVal, numCountDict[c]! != 0 ? count : count+1)
        if maxVal == k+1 { return k+1 }
        numCountDict[arr[left % N]]! -= 1
        count = numCountDict[arr[left % N]]! == 0 ? count - 1 : count
        left += 1
        right += 1
    }
    return maxVal
}
print(twoPointer())
