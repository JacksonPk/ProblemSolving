//https://www.acmicpc.net/problem/11729

/*print let TimeOut, need to use write, read*/
var fileTxt : String = ""
func hanoi(_ numOfDisk : Int , _ poleA : String , _ poleB : String, _ poleC : String){
    
    if numOfDisk > 0 {
        hanoi(numOfDisk - 1, poleA, poleC, poleB)

        fileTxt.write(poleA+" "+poleC+"\n")
        
        hanoi(numOfDisk - 1, poleB, poleA, poleC)
    }
    
}

let diskN = Int(readLine()!)!
var base = 2
for _ in 0 ..< diskN - 1 {
    base = base * 2
}
print(base - 1)
hanoi(diskN, "1", "2", "3")
print(fileTxt)
