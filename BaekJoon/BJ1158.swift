//https://www.acmicpc.net/problem/1158

let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let N = input[0]
let K = input[1]

var values = Array(1...N)
var outputs = Array<String>()
var curPos = 0

while values.count > 0 {

    curPos += (K-1)
    curPos = curPos % values.count
    
    if values.count == N , values.count == 1 {
        outputs.append("<"+String(values.remove(at: curPos))+">")
    }else if values.count == N {
        outputs.append("<"+String(values.remove(at: curPos)))
    }else if values.count == 1 {
        outputs.append(String(values.remove(at: curPos))+">")
    }else {
        outputs.append(String(values.remove(at: curPos)))
    }
    
}

for i in 0..<outputs.count {
    if i == outputs.count-1 {
        print(outputs[i])//, terminator: " ")
    }else {
        print(outputs[i], terminator: ", ")
    }
    
}

//7 3
//<3, 6, 2, 7, 5, 1, 4>


//1 2 3 4 5 6 7     []
//1 2 3 4 5 7       [6]



