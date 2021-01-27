//https://gist.github.com/JacksonPk/8b394c4ebb5337b55becd99d4b3025dc
//현재까지 푼 문제
//
//
//1000 1009 1052 1076 2839 10757 11399 11047

//1931 
//enum coins : Int {
//    case fiveH = 500
//    case oneH = 100
//    case fifty = 10
//    case ten = 50
//    case five = 5
//    case one = 1
//}
import Foundation
func maxMeetingCount(){
    let count = Int(readLine()!)!
    var allMeetings = [(Int,Int)]()
    for _ in 0..<count{
        let meeting = readLine()!.components(separatedBy: " ")
        allMeetings.append((Int(meeting[0])!,Int(meeting[1])!))
    }
    
    
    //multiple cretria to sort by closure. 첫번째 값 비교 후 두번째 값 비교
    //filter값 쓰기. 왜냐하면 정렬되었을때 (3,4) ,(3,5)이면 (3,5)는 절대 쓰일일이 없으니까. 주의 (3,3) (3,3)이면 필터하면 안됌.
    allMeetings = allMeetings.sorted(by: {($0.0, $0.1) <= ($1.0, $1.1)})
    
    print(allMeetings)
    var maxMeeting = 0 //가장 긴 회의미팅.
    
    /*
     순차적으로 현재 튜플값을 가지고 다음 튜플값이 조건에 맞는지 -> 맞으면 튜플값 변경 및 회의
     */
    for selectedItem in 0 ..< allMeetings.count{
        
        var countPerItem = 1

        var currentTuple = allMeetings[selectedItem]
        
        for appendIndex in selectedItem+1 ..< allMeetings.count{

            if allMeetings[appendIndex].0 >= currentTuple.1{
                currentTuple = allMeetings[appendIndex] //튜플 값 변경
                countPerItem += 1
            }
        }
        //현재 튜플값에서 나오는 최대 미팅 수 그 전 값과 비교.
        if countPerItem > maxMeeting{
            maxMeeting = countPerItem
        }
    }
    
    print(maxMeeting)
}

//maxMeetingCount()
//5
//0 10
//0 0
//0 1
//1 2
//3 5
//[(0, 0), (0, 1), (0, 10), (1, 2), (3, 5)]
//Program ended with exit code: 0


//var ra = [(1,3),(2,4),(0,6),(0,0),(0,1)]
//var a = [1,4,5,6,2,3]
//print(a.sorted())
//
//ra = ra.sorted(by: {$0.0 < $1.0 || $0.1 < $1.1})
//print(ra)
////
//11
//1 4
//3 5
//0 6
//5 7
//3 8
//5 9
//6 10
//8 11
//8 12
//2 13
//12 14


//4
//14
//03
//00
//11
