//https://www.acmicpc.net/problem/10828
import Foundation
//Stack 구현

enum stackFunc : String {
    case push = "push"
    case pop = "pop"
    case size = "size"
    case empty = "empty"
    case top = "top"
}

class Stack{
    
    var valueArr : [Int]
    var resultStore : [Int]
    
    init() {
        valueArr = []
        resultStore = []
    }
    
    func push(_ value : Int ){
        valueArr.append(value)
    }
    
    func pop() -> Int {
        return valueArr.count >= 1 ? valueArr.removeLast() : -1
    }
    
    func size() -> Int {
        return valueArr.count
    }
    
    func empty() -> Int {
        return valueArr.count >= 1 ? 0 : 1
    }
    
    func top() -> Int {
        return valueArr.count >= 1 ? valueArr.last! : -1
    }

}

let s = Stack()
for _ in 0 ..< Int(readLine()!)! {
    let command = readLine()!.split(separator: " ")

    let funcstack = stackFunc(rawValue: String(command[0]))
    switch funcstack{
    case .push:
        s.push(Int(command[1])!)
    case .pop:
        s.resultStore.append(s.pop())
    case .size:
        s.resultStore.append(s.size())
    case .empty:
        s.resultStore.append(s.empty())
    case .top:
        s.resultStore.append(s.top())
    default:
        exit(0)
    }
}
for result in s.resultStore {
    print(result)
}
