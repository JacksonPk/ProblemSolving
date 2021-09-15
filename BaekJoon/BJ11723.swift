//https://www.acmicpc.net/problem/11723
//비트마스킹을 이용한 정답
import Foundation

class FileIO {
    @inline(__always) private var buffer: [UInt8] = Array(FileHandle.standardInput.readDataToEndOfFile()) + [0], byteIdx = 0
    
    @inline(__always) private func readByte() -> UInt8 {
        defer { byteIdx += 1 }
        return buffer.withUnsafeBufferPointer { $0[byteIdx] }
    }
    
    @inline(__always) func readInt() -> Int {
        var number = 0, byte = readByte(), isNegative = false
        while byte == 10 || byte == 32 { byte = readByte() }
        if byte == 45 { byte = readByte(); isNegative = true }
        while 48...57 ~= byte { number = number * 10 + Int(byte - 48); byte = readByte() }
        return number * (isNegative ? -1 : 1)
    }
    
    @inline(__always) func readStirngSum() -> Int {
        var byte = readByte()
        while byte == 10 || byte == 32 { byte = readByte() }
        var sum = Int(byte)
        while byte != 10 && byte != 32 && byte != 0 { byte = readByte(); sum += Int(byte) }
        return sum - Int(byte)
    }
    
    @inline(__always) private func write(_ output: String) {
        FileHandle.standardOutput.write(output.data(using: .utf8)!)
    }
}
let fileIO = FileIO()
let N = fileIO.readInt()
var ans = ""
var S: UInt32 = 0
for _ in 0..<N {
    switch fileIO.readStirngSum() {
    case 297: //"add"
        S |= 1<<(fileIO.readInt()-1)
    case 654: //"remove"
        S &= ~(1<<(fileIO.readInt()-1))
    case 510: //"check":
        ans.write(S & 1<<(fileIO.readInt()-1) > 0 ? "1\n" : "0\n")
    case 642: //"toggle":
        S = ~(S ^ ~(1<<(fileIO.readInt()-1)))
    case 313: //"all":
        S = ~0
    case 559: //"empty":
        S = 0
    default:
        break
    }
}
print(ans)
