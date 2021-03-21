//import Foundation
//https://www.acmicpc.net/problem/15552

/* MARK:NSMuatableString 을 이용한 방법 시간초과 */
/*var results : NSMutableString = ""
 var numbers = [Int]()
 let count = Int(readLine()!)!
 for i in 0..<count{
 results.append(String(readLine()!.split(separator: " ").compactMap{Int($0)}.reduce(0){
 $0 + $1
 }))
 if i != count - 1 {
 results.append("\n")
 }
 }
 print(results)
 */

/* MARK: 배열을 이용한 방법 */
//var resultArr : [Int] = Array(repeating: 0, count: 1000000)
//
//for i in 0 ..< Int(readLine()!)! {
//    resultArr[i] = readLine()!.split(separator: " ").compactMap{Int($0)}.reduce(0){
//        $0 + $1
//    }
//}
////print(resultArr)
//for i in 0..<resultArr.count {
//    if resultArr[i] != 0 {
//        print(resultArr[i])
//    }else{
//        break
//    }
//}

//
// MARK:그때마다 이용한 방법 ->
//2 ... 2000
//
//for _ in 0..<Int(readLine()!)!{
//    print(readLine()!.split(separator: " ").compactMap{Int($0)}.reduce(0){
//        $0 + $1
//    })
//}

// MARK:Int형 ->UIN16,32를 사용
//import Foundation
//for _ in 0..<UInt32(readLine()!)!{
//    print(readLine()!.split(separator: " ").compactMap{UInt16($0)}.reduce(0){
//        $0 + $1
//    })
//}


// MARK:NSString의 intvalue사용
//import Foundation
//var str = ""
////(a[0] as NSString).intValue
//for _ in 0..<UInt32(readLine()!)!{
//    let a = readLine()!.split(separator: " " )
////    print((a[0] as NSString).intValue + (a[1] as NSString).intValue)
//    str.write(String((a[0] as NSString).intValue + (a[1] as NSString).intValue)+"\n")
////    free(a)
//}

// MARK:so on...
var str = ""
//(a[0] as NSString).intValue
for _ in 0..<UInt32(readLine()!)!{
    
//    print((a[0] as NSString).intValue + (a[1] as NSString).intValue)
    str.write(String(readLine()!.split(separator: " ").compactMap{Int16($0)}.reduce(0,+))+"\n")
//    free(a)
}

//print(UInt.max,UInt64.max, UInt32.max ,UInt16.max, UInt8.min)
print(str.description)

//5
//1 1
//12 34
//5 500
//40 60
//1000 1000
