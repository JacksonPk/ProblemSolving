//https://www.acmicpc.net/problem/11663
/*
 주어진 선분은 일단 정렬되어 있다고 가정한다. -> 정렬하기.
 1 3 10 20 30
 
 Lower Bound를 이용하였다.
 */
let nm = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let dots = readLine()!.split(separator: " ").compactMap{Int(String($0))}.sorted()
let n = nm[0]
let countOfDots = nm[1]


func binarySearch(lhs : Int, rhs : Int) -> Int {
    var left = 0
    var right = countOfDots - 1
    var lowAns = 0
    var rightAns = 0
    
    while left<=right {
        let mid = (left+right) / 2
        if dots[mid] <= lhs {
            lowAns = mid
            left = mid + 1
        }else {
            right = mid - 1
        }
    }

    left = 0
    right = countOfDots - 1
    
    while left<=right {
        let mid = (left+right) / 2
        if dots[mid] <= rhs {
            rightAns = mid
            left = mid + 1
        }else {
            right = mid - 1
        }
    }


    /*실제 주어진 점들과 인풋점들을 비교하여 총 개수를 조정한다.*/
    if dots[lowAns] < lhs && dots[rightAns] > rhs{
        return rightAns - lowAns - 1
    }else if dots[lowAns] < lhs || dots[rightAns] > rhs{
        return rightAns-lowAns
    }else{
        return rightAns-lowAns + 1
    }
}

for _ in 0..<n {
    let line = readLine()!.split(separator: " ").compactMap{Int(String($0))}
    print(binarySearch(lhs: line[0], rhs: line[1]))
}

/* 테스트 한 코드
 5 10
 1 3 7 10 15 16 20 28 39 40
 1 2
 1 4
 1 10
 10 11
 15 20
 start =  1 end = 2
 lowAns =  0 rightAns =  0
 1
 start =  1 end = 4
 lowAns =  0 rightAns =  1
 2
 start =  1 end = 10
 lowAns =  0 rightAns =  3
 4
 start =  10 end = 11
 lowAns =  3 rightAns =  3
 1
 start =  15 end = 20
 lowAns =  4 rightAns =  6
 3
 Program ended with exit code: 0
 
 */
