//https://www.acmicpc.net/problem/1094
print(Array(String(Int(readLine()!)!, radix: 2)).filter{$0 == "1"}.count) //내가 푼 방식.
/*비트마스킹 개념
 x &= x-1
 만약 x가 20일때 비트연산자를 쓸 경우 2진수의 비트를 체크한다.
 20 -> 10100
 19 -> 10011
 20 & 19 (& 연산자는 and연산자로 둘 다 1 일때 1이고 나머지는 0)
 따라서 결과는 10000

 이 방식으로 답을 구할 수 있다.
 */

func bitMasking(num: Int) -> Int {
    var count = 0
    var num = num
    while num > 0 {
        num &= (num - 1)
        count += 1
    }
    return count
}
