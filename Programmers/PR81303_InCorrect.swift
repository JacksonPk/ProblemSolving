//https://programmers.co.kr/learn/courses/30/lessons/81303

class Node {
    var value: Int?
    var prev: Node?
    var next: Node?
    
    init(value: Int?) {
        self.value = value
        self.prev = nil
        self.next = nil
    }
}

class DoubleLinkedList {
    var head: Node?
    var count: Int
    
    //이 문제용 커서, 스택
    private var currNode = Node(value: nil)
    private var stack = [Int]()
    
    init() {
        self.head = Node(value: nil)
        self.count = 0
    }
    
    func append(value: Int) { //가장 마지막까지 가면 되니까 tail 찾을 때까지
        let node = Node(value: value)
        
        if head?.value == nil {
            head = node
            currNode = node
        }else {
            var curr = head
            while curr?.next != nil {
                curr = curr?.next
            }
            curr?.next = node
            node.prev = curr
        }
        self.count += 1
    }
    
    
    func setCurrNode(idx: Int) {
        var node = currNode
        
        if idx > 0 {
            for _ in 0..<idx {
                guard let nexNode = node.next else { return }
                node = nexNode
            }
        }else {
            let absIdx = idx * -1
            for _ in 0..<absIdx {
                guard let prevNode = node.prev else { return }
                node = prevNode
            }
        }
        self.currNode = node
    }
    
    //이분탐색
    func restore(){
        let value = self.stack.removeFirst()
        var curNode = head
        let restoreNode = Node(value: value)
        
        var left = 0
        var right = self.count-1
        var prevMid = 0
        
        while left <= right {
            let mid = (left + right) / 2
            
            if mid > prevMid {
                for _ in 0 ..< (mid - prevMid) {
                    curNode = curNode?.next
                }
            }else {
                for _ in 0 ..< (prevMid - mid) {
                    curNode = curNode?.prev
                }
            }
            prevMid = mid
            
            guard let curValue = curNode?.value else { return }
            if curValue > value {
                right = mid - 1
            }else {
                left = mid + 1
            }
        }
        
        guard let curValue = curNode?.value else { return }
        if value > curValue {
            if curNode?.next == nil { //가장 뒤에 붙여야 하는 상황
                curNode?.next = restoreNode
                restoreNode.prev = curNode
            }else {
                restoreNode.prev = curNode
                restoreNode.next = curNode?.next
                curNode?.next?.prev = restoreNode
                curNode?.next = restoreNode
            }
        } else {
            if curNode?.prev == nil { //가장 앞에 붙여야 하는 상황
                restoreNode.next = self.head
                self.head?.prev = restoreNode
                self.head = restoreNode
                
            }else {
                restoreNode.prev = curNode?.prev
                restoreNode.next = curNode
                curNode?.prev?.next = restoreNode
                curNode?.prev = restoreNode
            }
        }
        
        self.count += 1
    }
    
    
    func deleteCurrNode() { //해당 value값 노드를 지운다.
        let temp = currNode
        guard let value = currNode.value else {return}
        self.stack.insert(value, at: 0)
        
        if temp.prev == nil { //커서가 현재 head
            self.head = self.head?.next
            self.head?.prev = nil
        } else if temp.next == nil { //커서가 현재 tail
            guard let prevNode = currNode.prev else { return }
            currNode.prev?.next = nil
            currNode = prevNode
        } else {
            guard let nextNode = temp.next else { return }
            currNode.prev?.next = temp.next
            currNode.next?.prev = temp.prev
            currNode = nextNode
        }
        
        self.count -= 1
    }
    
    func printNodes() {
        var curr = head
        while curr?.value != nil {
            if let val = curr?.value {
                print(val, terminator: " ")
            }
            curr = curr?.next
        }
        print(",k =", currNode.value!, ", ",stack)
        print("=====================")
    }
}

func solution(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
    var result = ""
    let doubleLinkedList = DoubleLinkedList()
    for i in 0..<n {
        doubleLinkedList.append(value: i)
    }
    doubleLinkedList.setCurrNode(idx: k)
    print("init")
    doubleLinkedList.printNodes()
    
    for val in cmd {
        
        let input = val.split(separator: " ").compactMap{String($0)}
        switch input[0] {
        case "U":
            doubleLinkedList.setCurrNode(idx: -Int(input[1])!)
        case "D":
            doubleLinkedList.setCurrNode(idx: Int(input[1])!)
        case "C":
            doubleLinkedList.deleteCurrNode()
            doubleLinkedList.printNodes()
        case "Z":
            doubleLinkedList.restore()
            doubleLinkedList.printNodes()
        default:
            break
        }
    }
    
    var currNode = doubleLinkedList.head
    var expectedNum = 0
        
    doubleLinkedList.printNodes()
    while currNode?.value != nil {
        if let currVal = currNode?.value {
            if expectedNum == currVal {
                result += "O"
            }else {
                for _ in 0..<(currVal-expectedNum) { //잘못된 부분.
                    result += "X"
                }
                result += "O"
            }
            expectedNum = currVal+1
        }
        currNode = currNode?.next
    }
    
    for _ in 0..<(n-expectedNum) { //노드가끝났을 때 잔여값이 남아있다면
        result += "X"
    }
    return result
}

let n = 8
let k = 2
//let cmd = ["D 2", "C", "U 3", "C", "D 4", "C", "U 2", "Z", "Z", "U 1", "C"]
//let cmd = ["D 2","C","U 3","C","D 4","C","U 2","Z","Z"]
let cmd = ["C","C","C","C","C","C","C","Z","Z","Z","Z"]

//var result = "OOOOXOOO"


print("결과값 =", solution(n, k, cmd))
//print("기대값 = OOXOXOOO")

//var doubleLinkedList = DoubleLinkedList<Int>(head:Node<Int>(value: 3, prev: nil, next: nil))

//var doubleLinkedList = DoubleLinkedList()

//var newnode1 = Node<Int>(value: 4, prev: nil, next: nil)
//var newnode2 = Node<Int>(value: 5, prev: nil, next: nil)


//for idx in 0..<10 {
//    doubleLinkedList.append(value: idx)
//}

//doubleLinkedList.setCurrNode(idx: 9) // 9
//doubleLinkedList.setCurrNode(idx: -3)
//doubleLinkedList.setCurrNode(idx: -2)


//doubleLinkedList.deleteCurrNode()
//doubleLinkedList.restore()
//doubleLinkedList.printNodes()
//doubleLinkedList.append(nodeVal: 5)
//doubleLinkedList.append(nodeVal: 4)
//doubleLinkedList.head?.next = Node<Int>(value: 4, prev: doubleLinkedList.head, doubl)
//doubleLinkedList.printNodes()




