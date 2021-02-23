//https://www.acmicpc.net/problem/9184
import Foundation

var results = [String]()
var d = Dictionary<[Int],Int>()

func w(_ a : Int, _ b: Int, _ c : Int) -> Int{
    if a == -1 , b == -1 , c == -1 {
        exit(0)
    }
    
    if d[[a,b,c]] != nil {
        return d[[a,b,c]]!
    }else{
        if a <= 0 || b <= 0 || c <= 0 {
            
            d[[a,b,c]] = 1
            return d[[a,b,c]]!
        }else if a > 20 || b > 20 || c > 20 {
            
            d[[a,b,c]] = w(20, 20, 20)
            return d[[a,b,c]]!
        }else if a < b , b < c {
            
            d[[a,b,c-1]] = w(a, b, c-1)
            d[[a,b-1,c-1]] = w(a, b-1, c-1)
            d[[a,b-1,c]] = w(a, b-1, c)
            return d[[a,b,c-1]]! + d[[a,b-1,c-1]]! - d[[a,b-1,c]]!
        }else {
            
            d[[a-1,b,c]] = w(a-1, b, c)
            d[[a-1,b-1,c]] = w(a-1, b-1, c)
            d[[a-1,b,c-1]] = w(a-1, b, c-1)
            d[[a-1,b-1,c-1]] = w(a-1, b-1, c-1)
            return d[[a-1,b,c]]! + d[[a-1,b-1,c]]! + d[[a-1,b,c-1]]! - d[[a-1,b-1,c-1]]!
            
        }
    }
    
}

while true{
    let command = readLine()!.split(separator: " ").compactMap(){Int($0)}
    if command[0] == -1 , command[1] == -1, command[2] == -1 {
        for result in results {
            print(result)
        }
        break
    }
    results.append("w(\(command[0]), \(command[1]), \(command[2])) = \(w(command[0], command[1], command[2]))")
}
