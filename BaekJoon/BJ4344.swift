
//https://www.acmicpc.net/problem/4344
import Foundation

//Float을 쓰지 않고 오로지 int와 string으로만 구현.
//이유는 float 쓸 생각을 못했다.
class OverAverage{
    var resultArr = [String]()

    func calcStudentOverAvg(_ input : [Int]){
        let avg = input[1...].reduce(0, +) / input[0]
        var count = 0
        
        for index in 1 ..< input.count{
            if input[index] > avg {
                count += 1
            }
        }
        
        rateOverAvg(count , input[0])
    }
    
    func rateOverAvg(_ quotient : Int , _ divNum : Int){
        
        var result = ""
        var sumOfNums = quotient * 100
        
        for count in 0 ..< 4{

            if count == 0 {
                result += String(sumOfNums/divNum)+"."

            }else if count == 3 {

                let temp = (sumOfNums % divNum) * 10 / divNum

                if temp >= 5 {
                    result += String(sumOfNums/divNum + 1)+"%"
                }else{
                    result += String(sumOfNums/divNum)+"%"
                }
                
            }else{
                result += String(sumOfNums/divNum)
            }
            sumOfNums = (sumOfNums % divNum) * 10
            
        }
        resultArr.append(result)
        
    }
    
    func storeInput(){
        for _ in 0 ..< Int(readLine()!)!{
            calcStudentOverAvg(readLine()!.split(separator: " ").compactMap{Int($0)})
        }
    }
    
    func printAll(){
        for element in resultArr{
            print(element)
        }
    }
}

let oa = OverAverage()

oa.storeInput()
oa.printAll()



//print("\(String(format: "%.3f", 33.44450))%") 스위프트 반올림
