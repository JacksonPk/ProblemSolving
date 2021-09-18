//https://www.acmicpc.net/problem/1062
//비트마스크 이용

let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let (N,K) = (input[0],input[1])
var words: [Int] = []
var maxCount = 0
var totalBits = 0 //입력받은 모든 bit를 저장

//Input
for _ in 0..<N {
    let word = readLine()!
    var givenBit = 0
    
    for letter in word {
        let shiftNum = letter.asciiValue! - Character("a").asciiValue!
        givenBit |= 1<<(shiftNum)
        totalBits |= 1<<(shiftNum)
    }
    words.append(givenBit) //해당 단어의 UInt32 bit값을 넣는다.
}

func getTotalChildBits(bits: Int) -> Int { //해당 부모비트가 포함하는 자식비트들의 수
    var count = 0
    
    for word in words where bits == (word | bits) {
        count += 1
    }
    return count
}

func getNumofOneBits(bits: Int) -> Int {
    var count = 0
    var compareBits: Int = 0
    var shift = 0
    while compareBits < bits {
        compareBits = 1<<shift
        count = (compareBits & bits) > 0 ? count + 1 : count
        shift += 1
    }
    return count
}

func recursion(bits: Int, count: Int, shift: Int ) -> Int {
    var maxCount = 0
    var compareBits: Int = 0
    var nshift = shift
    
    if count == K {
        return getTotalChildBits(bits: bits)
    }
    
    while compareBits < bits {
        compareBits = 1<<nshift
        switch compareBits & bits {
        case
            0,
            1<<(Int(Character("a").asciiValue!)-97),
            1<<(Int(Character("c").asciiValue!)-97),
            1<<(Int(Character("i").asciiValue!)-97),
            1<<(Int(Character("n").asciiValue!)-97),
            1<<(Int(Character("t").asciiValue!)-97):
            break
        default:
            maxCount = max(maxCount,recursion(bits: bits & ~compareBits, count: count-1, shift: nshift))
        }
        nshift+=1
    }
    return maxCount
}
if K < 5 {
    print(0)
} else {
    let totalOneBits = getNumofOneBits(bits: totalBits)
    if totalOneBits <= K { //입력으로 받은 1비트의 갯수보다 선택할 수가 많으면 N개 전부 고를 수 있다.
        print(N)
    } else {
        print(recursion(bits: totalBits, count: totalOneBits, shift: 0))
    }
}
