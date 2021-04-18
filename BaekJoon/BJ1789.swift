//https://www.acmicpc.net/problem/1789

/*
 서로 다른 N개의 자연수의 합이 S라고 한다. S를 알 때, 자연수 N의 최댓값은 얼마일까?
 
 예시
 s = 200
 n = 19
 
 1부터 n까지를 더해서 나온 값이 s이하이여야 한다?라고 가정해야 할듯하다. 그렇지 않고서는 문제의 의도를 모르겠다.
 이유 = 서로 다른 자연수 100과 99, 혹은 101과 99를 더하면 200이고 최대값은 101이 될텐데 19이면
 1부터 19까지 더했을때 190으로 200에 최대에 근접한 값이기에 이렇게 19가 최대값이라고 가정을 해야 할 것 같다.
 
 */
let s = Int(readLine()!)!

func binarySearch() -> Int {
    var left = 1
    var right = 4294967295
    var ans = 0
    
    while left <= right {
        let mid = ( left + right ) / 2
        var sum = 0
        for i in 1...mid {
            sum += i
            if sum > s {
                break
            }
        }
        if sum > s {
            right = mid - 1
        }else {
            ans = mid
            left = mid + 1
        }
    }
    return ans
}


print(binarySearch())
