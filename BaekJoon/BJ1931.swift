//https://www.acmicpc.net/problem/1931

func maxMeetingCount(){
    let count = Int(readLine()!)!
    var allMeetings = [(Int,Int)]()
    for _ in 0..<count{
        let meeting = readLine()!.components(separatedBy: " ")
        allMeetings.append((Int(meeting[0])!,Int(meeting[1])!))
    }
    
    //multiple cretria to sort by closure. 첫번째 값 비교 후 두번째 값 비교
    //MARK: TimeError 해결방안 1 .filter값 쓰기. 왜냐하면 정렬되었을때 (3,4) ,(3,5)이면 (3,5)는 절대 쓰일일이 없으니까. 주의 (3,3) (3,3)이면 필터하면 안됌.
    print(allMeetings)
    allMeetings = allMeetings.sorted(by: {($0.0, $0.1) <= ($1.0, $1.1)})
    print(allMeetings)
    /*
     순차적으로 현재 튜플값을 가지고 다음 튜플값이 조건에 맞는지 -> 맞으면 튜플값 변경 및 회의
     */
    //MARK: 현재까지 이중 루프를 이용했으나 솔팅한 것을 최대한 이용해서 O(n)로 끝내기.
    
    var currentMeeting = allMeetings.removeFirst()
    var maxMeeting = 1 //current를 포함해서.
    
    for nextMeeting in allMeetings{
    
        if currentMeeting.1 <= nextMeeting.0 {
            maxMeeting += 1
            currentMeeting = nextMeeting
        }else {
            if currentMeeting.1 > nextMeeting.1 {
                currentMeeting = nextMeeting
            }
        }
    }
    
    print(maxMeeting)
}
