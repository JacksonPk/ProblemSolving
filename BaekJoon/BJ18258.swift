//https://www.acmicpc.net/problem/18258
import Foundation
//원래는 Class 처리가 없으셨지만 내가 임시로 구현했다.
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
var arrayQueue: [Int] = []
var curIdx = 0
var result = ""
for _ in 0 ..< fileIO.readInt() {

    switch fileIO.readStirngSum() {
    case 448: //push
        arrayQueue.append(fileIO.readInt())
    case 335: //pop
        if (arrayQueue.count - curIdx) == 0 {
            result.write("-1\n")
        }else {
            result.write(String(arrayQueue[curIdx])+"\n")
            curIdx += 1
        }
    case 443: //size
        result.write(String(arrayQueue.count - curIdx)+"\n")
    case 559: //empty
        if (arrayQueue.count - curIdx) == 0 {
            result.write("1\n")
        }else{
            result.write("0\n")
        }
    case 553: //front
        if (arrayQueue.count - curIdx) == 0 {
            result.write("-1\n")
        }else {
            result.write(String(arrayQueue[curIdx])+"\n")
        }
    case 401: //back
        if (arrayQueue.count - curIdx) == 0 {
            result.write("-1\n")
        }else {
            result.write(String(arrayQueue.last!)+"\n")
        }
    default: break
    }
}
print(result)

