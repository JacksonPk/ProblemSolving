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

 캐릭터들을 Ascii로 변환해서 처리하기.
 */

let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let (N,K) = (input[0],input[1])
var addedBitSet:Set<UInt32> = Set()
var defaultChars: [Character] = ["a","c","i","n","t"]
var defaultBits: [UInt32] = []
var allWords: [UInt32] = []
var initBit: UInt32 = 0 //["a","c","i","n","t"] 가 들어있는 bit
let standardChar: Character = defaultChars[0] //a를 기준으로 몇칸 떨어져 있는지 알기위해서
let standardIdx: UInt8 = 25 //알파벳 수 기준 Idx
var shiftbit:UInt32 = 0
var isRequired = true

//Init Bit, append [a,c,i,n,t]
for ch in defaultChars {
    defaultBits.append(1<<(standardIdx - (ch.asciiValue! - standardChar.asciiValue!)))
    initBit |= defaultBits.last!
}

for _ in 0..<N {
    let word = Array(readLine()!)
    var bit:UInt32 = 0
    
    for i in 0..<word.count {
        isRequired = true
        shiftbit = UInt32(standardIdx - (word[i].asciiValue! - standardChar.asciiValue!))
        bit |= 1<<shiftbit
        for j in 0..<defaultBits.count where (defaultBits[j] == 1<<shiftbit) {
            isRequired = false //"a,c,i,n,t가 있으면 넣지 않는다.
        }
        if isRequired {
            addedBitSet.insert(shiftbit)
        }
    }
    allWords.append(bit) //해당 단어의 2진수를 넣는다.
}

func getTotalPossible(arr: [UInt32]) -> Int {
    var count = 0
    var nBit = initBit

    //백트래킹으로 가져온 비트들을 더하는 작업
    for i in 0..<arr.count {
        nBit |= 1<<(arr[i])
    }
    //OR연산해도 nBit면 word는 nBit에 포함관계
    for word in allWords where nBit == (word | nBit) {
        count += 1
    }
    
    return count
}

func bitMasking(chars: [UInt32]) -> Int {
    var maxCount = 0
    var isUsed = Array(repeating: false, count: chars.count)
    var arr = [UInt32]()

    if K < 5 {
        return maxCount
    }

    func backTracking(idx: Int) { //nCr 백트래킹
        if arr.count == K-5 {
            //입력된 문자bits를 가장 많이 포함된 bit의 값 저장
            maxCount = max(maxCount,getTotalPossible(arr: arr))
            return
        }
        for i in idx..<chars.count where !isUsed[i] {
            isUsed[i] = true
            arr.append(chars[i])
            backTracking(idx: idx+1)
            isUsed[i] = false
            arr.removeLast()
        }
    }

    backTracking(idx: 0)
    return maxCount
}

print(bitMasking(chars: Array(addedBitSet)))


