//https://www.acmicpc.net/problem/11728
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
        var now = read()
        
        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        
        let beginIndex = self.index - 1
        
        while now != 10,
              now != 32,
              now != 0 {
            now = read()
        }
        
        return String(bytes: buffer[beginIndex..<self.index], encoding: .ascii)!
    }
    
    @inline(__always) func readDataWithoutSpaceAndLineFeed() -> [UInt8] {
        var now = read()
        
        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        
        let beginIndex = self.index - 1
        
        while now != 10,
              now != 32,
              now != 0 {
            now = read()
        }
        
        while now != 10,
              now != 32,
              now != 0 { now = read() }
        
        return Array(buffer[beginIndex..<self.index])
    }
}

let fIO = FileIO()

let numberOfN = fIO.readInt()
let numberOfM = fIO.readInt()

var nArray = Array(repeating: 0, count: numberOfN)
var mArray = Array(repeating: 0, count: numberOfM)

for idx in 0..<numberOfN {
    nArray[idx] = fIO.readInt()
}
for idx in 0..<numberOfM {
    mArray[idx] = fIO.readInt()
}

func twoPointer(){
    
    var nStart = 0
    var mStart = 0
    var cStart = 0
    var str = ""
    
    while nStart < numberOfN , mStart < numberOfM {
        
        if nArray[nStart] <= mArray[mStart] {
            str.write(String(nArray[nStart])+" ")
            nStart += 1
        }else {
            str.write(String(mArray[mStart])+" ")
            mStart += 1
            
        }
        cStart+=1
    }
    if nStart == numberOfN {
        
        for idx in mStart ..< numberOfM {
            str.write(String(mArray[idx])+" ")
            
        }
    }else {
        
        for idx in nStart ..< numberOfN {
            str.write(String(nArray[idx])+" ")
            
        }
    }
    
    print(str)
}

twoPointer()

