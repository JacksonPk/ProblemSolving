//https://programmers.co.kr/learn/courses/30/lessons/64061

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
