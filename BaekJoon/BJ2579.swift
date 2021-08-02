//https://www.acmicpc.net/problem/2579

var arr = [0]
for _ in 0..<Int(readLine()!)! {
    arr.append(Int(readLine()!)!)
}
var total = Array(repeating: Array(repeating: 0, count: 3), count: arr.count)

func dp(num: Int) -> Int {
    
    if num < 2 {
        return arr[num]
    }
    
    total[1][1] = arr[1]
    total[1][2] = 0
    
    total[2][1] = arr[2]
    total[2][2] = arr[1] + arr[2]
    
    for i in 2...num {
        total[i][1] = max(total[i-2][1], total[i-2][2]) + arr[i]
        total[i][2] = total[i-1][1] + arr[i]
    }
    return max(total[num][1],total[num][2])
}
print(dp(num: arr.count-1))
print(total)

//
//    total[0] = arr[0]
//    total[1] = arr[0]+arr[1]
//    total[2] = arr[0]+arr[2]
//
//    if num <= 3 {
//        return total[num-1]
//    }
//
//    //단계는 1번 or 2번
//    //연속 3번 x
//    for i in 3..<num {
//        if total[i-1] == arr[i-1] + total[i-2] { //연속3번째인지 체크
//            let n1 = arr[i] + total[i-2] //한칸 전것
//            let n2 = arr[i] + arr[i-1] + total[i-3] //한칸 전 + 두칸 전 것
//            if n1 >= n2 {
//                total[i] = n1
//            }else {
//                total[i] = n2
//            }
//        }else {
//            let n1 = arr[i] + total[i-1]
//            let n2 = arr[i] + total[i-2]
//            if n1 >= n2 {
//                total[i] = n1
//            }else {
//                total[i] = n2
//            }
//        }
//    }
//    return total[num-1]
//}
//
//print(dp(num: arr.count))
//
////5
////10
////20
////30
////40
////50
//
////60
////70
////80
////90
////100
