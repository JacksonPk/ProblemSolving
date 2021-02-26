//https://www.acmicpc.net/problem/1016
import Foundation

func primeNum(_ max : Int) -> [Int]{
    var primeNums = [Int]()
        
    (2...Int(sqrt(Double(max)))).forEach{ num in
        primeNums.append(num)
    }
//    print(primeNums.count)
    var curIdx = 0
    
    while true {
        if curIdx == primeNums.count{
            break
        }else{
            primeNums = primeNums.filter{$0 % primeNums[curIdx] != 0 || $0 == primeNums[curIdx]}
            curIdx += 1
        }
    }
//    print("curIdx",curIdx)

    return primeNums.map(){$0 * $0}
}

//1차 방안. 여기서 오래걸림
func countOfSqrts(_ min : Int, _ max : Int, _ powPrime : [Int]) -> Int {
    var eratos = [Int]()
    (min...max).forEach { value in
        eratos.append(value)
    }
    print(eratos.count)
    for pp in powPrime {
        eratos = eratos.filter{$0 % pp != 0}
    }
    return eratos.count
}
let firstInput = readLine()!.split(separator: " ").compactMap(){Int($0)}
print(countOfSqrts(firstInput[0], firstInput[1], primeNum(firstInput[1])))
