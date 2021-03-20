//https://www.acmicpc.net/problem/18258

import Foundation


class Node  {
    private var value : Int
    private var next : Node?
    
    init(_ val : Int, _ next : Node?) {
        self.value = val
        self.next = next
    }
    
    func getValue() -> Int {
        return self.value
    }
    
    func setNextNode(_ newNode : Node){
        self.next = newNode
    }
    
    func getNextNode() -> Node? {
        return self.next
    }
}

class LinkedQueue {
    
    private var frontNode : Node
    private var backNode : Node
    private var length : Int
    
    private var fileRead : String = "" //BOJ 제출용
    init(){
        frontNode = Node.init(-1, nil)
        backNode = frontNode
        length = 0
        
    }
    
    func push(_ num : Int) {
        let newNode = Node(num, nil)
        
        if length == 0 {
            frontNode = newNode
            backNode = frontNode
        }else {
            backNode.setNextNode(newNode)
            backNode = backNode.getNextNode()!
        }
        length += 1
    }
    func pop(){
        if length == 0 {
            //            print("-1")
            fileRead.write("-1\n")
        }else{
            //            print(frontNode.getValue())
            fileRead.write(String(frontNode.getValue())+"\n")
            frontNode = frontNode.getNextNode() ?? backNode
            length -= 1
        }
    }
    func size(){
        //        print(length)
        fileRead.write(String(length)+"\n")
    }
    func empty(){
        if length == 0 {
            //            print("1")
            fileRead.write("1\n")
        }else{
            //            print("0")
            fileRead.write("0\n")
        }
    }
    func front(){
        if length == 0 {
            //            print("-1")
            fileRead.write("-1\n")
        }else{
            //            print(frontNode.getValue())
            fileRead.write(String(frontNode.getValue())+"\n")
        }
    }
    func back(){
        if length == 0 {
            //            print("-1")
            fileRead.write("-1\n")
        }else{
            //            print(backNode.getValue())
            fileRead.write(String(backNode.getValue())+"\n")
        }
    }
    
    func printResult() {
        print(fileRead)
    }
}

let q = LinkedQueue()

for _ in 0 ..< Int(readLine()!)! {
    let command = readLine()!.split(separator: " ")
    
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
q.printResult()


