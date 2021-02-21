//https://www.acmicpc.net/problem/1874
import Foundation

class SequenceStack {
    
    var maximumInt : Int
    var currentInt : Int
    var intStack : [Int]
    var resultStore : [Character]
    var flag : Bool
    
    init(_ max : Int) {
        maximumInt = max
        currentInt = 0
        intStack = []
        resultStore = []
        flag = true //Purpose not to calculate remaining readline when false
    }
    
    func process(){
        getReadLine()
        result()
    }
    
    func getReadLine(){
        for _ in 0 ..< maximumInt {
            if flag {
                checkSequenc(Int(readLine()!)!)
            }else{
                if let _ = readLine(){
//                    print("continue")
                } //Just get readline without anyPurpose, this means answer is NO
            }
        }
    }
    
    func checkSequenc(_ num : Int) {
        if currentInt < num {
            for _ in 0 ..< (num - currentInt) {
                currentInt += 1
                push(currentInt)
            }
            pop()
        }else if currentInt > num {
            if num == intStack.last! {
                pop()
            }else{
                flag = false
            }
        }else { //currentInt == num
            flag = false
        }
        
//        print(currentInt, intStack)
    }
    
    func push(_ num : Int){
        intStack.append(num)
        resultStore.append("+")
    }
    
    func pop(){
        intStack.removeLast()
        resultStore.append("-")
    }
    
    func result(){
        if flag {
            for char in resultStore {
                print(char)
            }
        }else{
            print("NO")
        }
    }
}

//Main

let s = SequenceStack(Int(readLine()!)!)
s.process()


