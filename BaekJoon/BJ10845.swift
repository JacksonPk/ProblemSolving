//https://www.acmicpc.net/problem/10845

import Foundation

class Queue {

    var queueArr = [Int]()
    var resultStr = ""
    
    func push(_ num : Int) {
        queueArr.append(num)
    }
    func pop(){
        if queueArr.count > 0 {
            print(queueArr.removeFirst())
//            resultStr.write(String(queueArr.popLast()!))
        }else{
//            resultStr.write("-1")
            print("-1")
        }
    }
    func size(){
//        resultStr.write(String(queueArr.count))
        print(queueArr.count)
    }
    func empty(){
        if queueArr.count > 0 {
//            resultStr.write("0")
            print("0")
        }else {
//            resultStr.write("1")
            print("1")
        }
    }
    func front(){
        if queueArr.count > 0 {
//            resultStr.write(String(queueArr.first!))
            print(queueArr.first!)
        }else {
//            resultStr.write("-1")
            print("-1")
        }
    }
    func back(){
        if queueArr.count > 0 {
//            resultStr.write(String(queueArr.last!))
            print(queueArr.last!)
        }else {
//            resultStr.write("-1")
            print("-1")
        }
    }
}

let q = Queue()
for _ in 0 ..< Int(readLine()!)! {
    let command = readLine()!.components(separatedBy: " ")
    
    switch command[0] {
    case "push" :
        q.push(Int(command[1])!)
    case "pop" :
        q.pop()
    case "size" :
        q.size()
    case "empty" :
        q.empty()
    case "front" :
        q.front()
    case "back" :
        q.back()
        
    default: break
        
    }
    
}


