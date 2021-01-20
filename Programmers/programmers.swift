//
//  programmers.swift
//  Algorithm_By_Baekjoon_LeetCode
//
//  Created by jinseo park on 1/20/21.
//

import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    
//    var newBoard = board
    var basket = [Int]()
    var result : Int = 0
    let countdown = -1 //크레인은 1부터 뽑기때문에
            
    var leadingNum = [Int](repeating: 0, count: board.count)
    
    //moves를 돌면서 배스킷 안에 넣기.
    for rows in moves{ //array[0][1], array[1][1], array[2][1], array[3][1], array[4][1]
        
        if leadingNum[rows+countdown] < board.count{ //리딩넘버가 보드배열 크기보다 크면 뽑을게 없다.
            
            for i in leadingNum[rows+countdown] ..< board.count{ //저장된 leadingNum부터 시작되어야함.
                                
                if board[i][rows+countdown] == 0{
                    leadingNum[rows+countdown] += 1
                    
                }else{
                    //배스켓에 담기 대신 조건을 봐야함.
                    if basket.isEmpty { //바스켓 비면 그냥 넣어야함.
                        basket.append(board[i][rows+countdown])
                    }else{
                        if basket.last! == board[i][rows+countdown]{ //바스켓에 넣은 마지막값이 지금값과 같다면
                            
                            basket.removeLast()
                            result += 2
                        }else{
                            basket.append(board[i][rows+countdown])
                        }
                        
                    }
                    
                    leadingNum[rows+countdown] += 1
                    break
                }
            }
        }
        
    }
    
    return result
}
            
            
        
        
////
////        for i in 0..<board.count {
////            print(board[i][rows+countdown])
////            if board[i][rows+countdown] == 0{
////                leadingNum[i] += 1
//////                print(leadingNum)
////            }else{
////                basket.append(board[i][rows+countdown])
//////                print(board[i][rows+countdown])
////                leadingNum[i] += 1
//////                print(leadingNum)
////                break
////            }
//////            print(board[i][rows+countdown], terminator : ", ")
////        }
////        print(basket)
////        print()
//    }
//    print(newBoard)
    
    



/*배열에 차곡차곡 pop, stack을 쌓으면 되나?
 아니면 remove 두번을 해도 됨. for문을 돌려서 다음값과 같으면 remove 한번하고 없애기.
 
 
 */

/*
 아예 잘 못 이해한 코드
 for item in moves {
     
     while !(newBoard[item+countdown].isEmpty){ //배열이 비어있지않다면 실행.
         let lastVal : Int = newBoard[item+countdown].last!
         
         if lastVal != 0{ //0이 아니라면 코드를 실행하고 while문을 빠져 나간다.
             
             if basket.isEmpty{ //비워있다면 무조건 넣어주어야 한다.
                 basket.append(lastVal)
             }else{ //비어 있지 않을때에도 조건문이 필요함.
                 if basket.last == lastVal{ //바스켓 값을 비교해서 같다면 배스켓 값을 제거 후 result에 2를 더한다.
                     basket.removeLast()
                     result += 2
                 }else{
                     basket.append(lastVal)
                 }
                 
             }
             
             newBoard[item+countdown].removeLast()
             break
         }
         newBoard[item+countdown].removeLast() //배열에 0이 존재하면 없애고 그 다음 값을 얻기 위해서.
         
     }
     
 }
 */
