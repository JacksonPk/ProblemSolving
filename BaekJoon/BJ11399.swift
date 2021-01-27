//https://www.acmicpc.net/problem/11399
import Foundation

func minWaiting(){
    var sum = 0
    var arrTTPP = [Int]()
    let totalPeople = Int(readLine()!)!
    if let taskTimePerPerson = readLine()?.components(separatedBy: " "){
        for i in 0 ..< totalPeople{
            arrTTPP.append(Int(taskTimePerPerson[i])!)
        }
        arrTTPP = arrTTPP.sorted() //소팅해야 차례대로 계산이 가능함.
        
        for i in 0 ..< arrTTPP.count{ //정렬된 순서대로
            sum += arrTTPP[i] * (arrTTPP.count - i)
        }
        print(sum)
    }
    
    
}
