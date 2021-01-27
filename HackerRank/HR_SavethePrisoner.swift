//https://www.hackerrank.com/challenges/save-the-prisoner/

import Foundation
func saveThePrisoner(n: Int, m: Int, s: Int) -> Int {
    let calc = (m % n) + (s-1)
    
    if calc == 0 {
        return n
    }else if calc > n { //이 부분을 생각 못함. 나머지를 합쳤을때 한바퀴를 돌 수 있다는 케이스.
        return calc - n
    }else{
        return calc
    }
    
}
