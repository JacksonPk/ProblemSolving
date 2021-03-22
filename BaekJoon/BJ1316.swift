//https://www.acmicpc.net/problem/1316


var countOfGroupded = 0
var storeCharArr = Array<Character>()

func isGrouped(using inputCharArr : Array<Character>) -> Bool {
    //Reset storeCharArr
    storeCharArr = []
    for index in 0..<inputCharArr.count {
        //값이 없으면 무조건 넣기
        if !storeCharArr.contains(inputCharArr[index]) {
            storeCharArr.append(inputCharArr[index])
        }else{ //이미 있을 때, 바로 전 인덱스가 지금값과 다르면 틀림.
            if inputCharArr[index] != inputCharArr[index-1] {
                return false
            }else{
                continue
            }
        }
    }
    return true
}


for _ in 0..<Int(readLine()!)! {
    if isGrouped(using: Array<Character>(readLine()!)) {
        countOfGroupded += 1
    }
}

print(countOfGroupded)
