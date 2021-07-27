//https://www.acmicpc.net/problem/15649

let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
var arr = [Int]()
var isUsed = [Bool]()

for _ in 0..<input[1] {
    arr.append(0)
}
for _ in 0..<input[0] {
    isUsed.append(false)
}

func getItem(index: Int) {

    if index == input[1] {
        arr.forEach { val in
            print(val, terminator: " ")
        }
        print("")
        return
    } else {
        for i in 1...input[0] {
            if isUsed[i-1] == false {
                arr[index] = i
                isUsed[i-1] = true
                getItem(index: (index+1))
                isUsed[i-1] = false
            }
        }
    }
}

getItem(index: 0)
