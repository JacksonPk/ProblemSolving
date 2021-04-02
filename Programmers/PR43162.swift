//https://programmers.co.kr/learn/courses/30/lessons/43162?language=swift
import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var countOfNetwork = 0
    var visitedComputers = computers.map({_ in return true})
    
    for i in 0..<n {
        if visitedComputers[i]{ //
            visitedComputers[i] = false
            dfs(i, computers, &visitedComputers)
            countOfNetwork += 1
        }

    }
    
    return countOfNetwork
}

func dfs(_ startIdx : Int, _ computers : [[Int]], _ visitedComputers : inout [Bool] ) {
    
    for i in 0..<computers[startIdx].count {
        if computers[startIdx][i] == 1, visitedComputers[i] == true {
                visitedComputers[i] = false
                dfs(i, computers, &visitedComputers)//더 방문하기.
            
        }
        
    }
    
}

//print(solution(3, [[1, 1, 0], [1, 1, 0], [0, 0, 1]]))
//print(solution(3, [[1, 1, 0], [1, 1, 1], [0, 1, 1]]))
