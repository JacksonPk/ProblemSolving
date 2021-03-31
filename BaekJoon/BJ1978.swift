//https://www.acmicpc.net/problem/1978
import Foundation
let _ = readLine()
let arrayOfNumbers = readLine()!.split(separator: " ").compactMap{Int($0)}
var countOfPrime = 0

let max = 1001
var primeNumbers : [Bool] = Array(repeating: true, count: 1001)

func makeEratos() {
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
makeEratos()

func isPrime(with number : Int) -> Bool {
    return primeNumbers[number]
}


for num in arrayOfNumbers {
    countOfPrime = isPrime(with: num) ? (countOfPrime + 1) : countOfPrime
}

print(countOfPrime)


