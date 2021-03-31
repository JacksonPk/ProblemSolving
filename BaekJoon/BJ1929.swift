//https://www.acmicpc.net/problem/1929
import Foundation
let minAndMaxNumbers = readLine()!.split(separator: " ").compactMap{Int($0)}

let max = 1000001
var primeNumbers : [Bool] = Array(repeating: true, count: 1000001)

func makeEratosthenes() {
    /*0,1은 소수가 아님*/
    primeNumbers[0] = false
    primeNumbers[1] = false

    for i in 2...max-1 {
        if primeNumbers[i] {
            for j in stride(from: i*i, to: max, by: i){
                primeNumbers[j] = false
            }
        }
    }
}
makeEratosthenes()

func getPrime(from minNum : Int, by maxNum : Int){
    for i in minNum...maxNum {
        if primeNumbers[i] == true {
            print(i)
        }
    }
}

getPrime(from: minAndMaxNumbers[0], by: minAndMaxNumbers[1])


