//https://programmers.co.kr/learn/courses/30/lessons/81301
enum letterToInt: String, CaseIterable {
    case zero
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
}

func solution(_ s:String) -> Int {
    
    var temp = ""
    var result = ""

    for value in s {

        if Int(String(value)) != nil {
            result += String(value)
            continue
        }

        temp += String(value)

        letterToInt.allCases.enumerated().forEach { idx, val in

            if temp == val.rawValue {
                result += String(idx)
                temp = ""
            }
        }
    }
    return Int(result) ?? 0
}

//print(solution("123zerozero"))
