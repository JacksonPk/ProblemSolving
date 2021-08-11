//https://www.acmicpc.net/problem/5052
//해쉬를 이용해야한다.

func isConsistency(phones: [String]) -> String {
    var hashMap = [String:Bool]()
    hashMap[phones[0]] = true
    for i in 1..<phones.count {
        let phoneArr = Array(String(phones[i]))
        var key = ""
        for j in 0..<phoneArr.count {
            key += String(phoneArr[j])
            if hashMap[key] != nil {
                return "NO"
            }
        }
        hashMap[key] = true
    }
    return "YES"
}

for _ in 0..<Int(readLine()!)! {
    var phones = [String]()
    for _ in 0..<Int(readLine()!)! {
        phones.append(readLine()!)
    }
    print(isConsistency(phones: phones.sorted{ $0.count < $1.count}))
}
