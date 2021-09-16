//https://www.acmicpc.net/problem/1062
import Foundation
//비트마스크 이용
/*
 알파벳 수는 총 26개
 모든 문자는 anta ... tica 로 시작된다. 최대를 만드려면 이 단어들은 무조건 있어야 한다.
 따라서 a,c,i,t,n은 필수
 K는 0<=K<=26. 따라서 K가 5보다 작으면 가능성 자체가 없다.

 모든 단어에서 a,c,i,t,n을 제외한 char를 백트래킹으로 최대한 많이 가질수 있는 것을 이용하면 될듯?
 a,c,i,t,n은 UInt32에서 각각 1로 입력하기. a를 26번째 자리로 넣기.
 */

let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let (N,K) = (input[0],input[1])
var charSet:Set<Character> = Set()
var defaultChars: [Character] = ["a","c","i","n","t"]
var word: [Character]
var allWords: []
var isRequired = true
var minBit: UInt32 = 0
let standardChar: Character = defaultChars[0] //a를 기준으로 몇칸 떨어져 있는지 알기위해서
let standardIdx: UInt8 = 25

for _ in 0..<N {
    word = Array(readLine()!)
    for i in 4..<word.count-4 { //"anta" "tica"를 뺀 중간값만 확인
        isRequired = true
        for j in 0..<defaultChars.count where defaultChars[j] == word[i] {
            isRequired = false //중간 값에 "a,c,i,n,t가 있으면 넣지 않는다.
        }
        if isRequired {
            charSet.insert(word[i])
        }
    }
}

func getTotalPossible(arr: [UInt32]) -> Int {
    var count = 0
    var nbit = minBit

    for i in 0..<arr.count {
        nbit |= 1<<(arr[i])
    }

    for i in 0..<

    return count
}

func bitMasking(chars: [Character]) -> Int {
    var maxCount = 0
    var isUsed = Array(repeating: false, count: chars.count)
    var arr = [UInt32]()

//    print("char",chars)
//    for i in 0..<chars.count {
//        print(UInt32(standardIdx - (chars[i].asciiValue! - standardChar.asciiValue!)))
//    }
    if K < 5 {
        return maxCount
    }

    func backTracking(idx: Int) {
        if arr.count == K-5 {
            print(arr)
            return
        }
        for i in idx..<chars.count where !isUsed[i] {
            isUsed[i] = true
            arr.append(UInt32(standardIdx - (chars[i].asciiValue! - standardChar.asciiValue!)))
            backTracking(idx: idx+1)
            isUsed[i] = false
            arr.removeLast()
        }
    }

    backTracking(idx: 0)
    return maxCount
}

//Init minBit
for ch in defaultChars {
    minBit |= 1<<(standardIdx - (ch.asciiValue! - standardChar.asciiValue!))
}
//print(minBit)
//print(String(minBit,radix: 2))

print(bitMasking(chars: Array(charSet)))


