//https://www.acmicpc.net/problem/1062
//비트마스크 이용

let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let (N,K) = (input[0],input[1])
var words: [UInt32] = []
var maxCount = 0
var isUsed: [Bool] = []
var allShiftNumsSet:Set<UInt32> = []
var allShiftNumsArr:[UInt32] = []
var selectedShiftNumsArr:[UInt32] = []

//Input
for _ in 0..<N {
    let word = readLine()!
    var givenBit:UInt32 = 0

    for letter in word {
        let shiftNum = letter.asciiValue! - Character("a").asciiValue!
        switch shiftNum {
        case 0,2,8,13,19: //a,c,i,n,t 제외
            break
        default:
            allShiftNumsSet.insert(UInt32(shiftNum))
            givenBit |= 1<<(shiftNum)
        }
    }

    if howManyOneBits(bit: givenBit) <= (K-5) {
        words.append(givenBit) //해당 단어의 UInt32 bit값을 넣는다.
    }
}

func howManyOneBits(bit: UInt32) -> Int { //해당 비트에 1비트가 총 몇개인지 구하는 함수
    var shiftbit = 0
    var compareBit:UInt32 = 0
    var count = 0

    while bit > compareBit {
        compareBit = 1 << shiftbit
        count = (compareBit & bit) > 0 ? count + 1 : count
        shiftbit += 1
    }
    return count
}

func getTotalChildBits(shiftArr: [UInt32]) -> Int { //해당 부모비트가 포함하는 자식비트들의 수
    var count = 0
    var bits:UInt32 = 0
    for shift in shiftArr {
        bits |= 1 << shift
    }
    for word in words where bits == (word | bits) {
        count += 1
    }
    return count
}

func backTracking(idx: Int) {
    if selectedShiftNumsArr.count == (K-5) {
        maxCount = max(maxCount, getTotalChildBits(shiftArr: selectedShiftNumsArr))
        return
    }

    for i in idx..<allShiftNumsArr.count where !isUsed[i] {
        isUsed[i] = true
        selectedShiftNumsArr.append(allShiftNumsArr[i])
        backTracking(idx: idx+1)
        isUsed[i] = false
        selectedShiftNumsArr.removeLast()
    }
}

allShiftNumsArr = Array(allShiftNumsSet)
isUsed = Array(repeating: false, count: allShiftNumsArr.count)
backTracking(idx: 0)
print(maxCount)
