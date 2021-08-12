//https://www.acmicpc.net/problem/10989
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
}

let fileIO = FileIO()
var arr = Array(repeating: 0, count: 10000)
var result = ""
for _ in 0..<fileIO.readInt() {
    arr[fileIO.readInt()-1] += 1
}
for i in 0..<arr.count where arr[i] > 0{
    result.write(String(repeating: "\(i+1)\n", count: arr[i]))
}
print(result)
