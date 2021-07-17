//BFS
//https://www.acmicpc.net/problem/2606

var isComVirus = Dictionary<Int, Bool>()
var comNetwork = Dictionary<Int, [Int]>()
for idx in 1...Int(readLine()!)! {
    isComVirus[idx] = false
    comNetwork[idx] = []
}
for _ in 0..<Int(readLine()!)! {
    let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
    comNetwork[input[0]]?.append(input[1])
    comNetwork[input[1]]?.append(input[0])
}

var queue = [1] //1번 컴퓨터는 걸림

while !queue.isEmpty {
    let pickComputer = queue.removeFirst()
    comNetwork[pickComputer]?.forEach { computer in
        if isComVirus[computer] == false {
            isComVirus[computer] = true
            queue.append(computer)
        }
    }
}
//1번 컴퓨터를 제외한 나머지
print(isComVirus.values.filter{$0 == true}.count-1)
