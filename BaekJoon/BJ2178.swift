//https://www.acmicpc.net/problem/2178
import Foundation

class Dijkstra{

    var matrix : [[Int]]
    var visited : [[Bool]]
    var distance : [[Int]]
    var bfsQueue : [[Int]]
    
    init(_ size : [Int]){
        matrix = Array(repeating: Array(repeating: -1, count: size[1]), count: size[0])
        
        var row = 0
        var col = 0
        for _ in 0..<size[0] {
            col = 0
            let readInput = readLine()!
            for index in readInput {
                matrix[row][col] = Int(String(index))!
                col += 1
            }
            row += 1
        }
        
        visited = Array(repeating: Array(repeating: false, count: size[1]), count: size[0])
        distance = Array(repeating: Array(repeating: 0, count: size[1]), count: size[0])
        
        //Init distance, Queue
        distance[0][0] = 1
        bfsQueue = [[0,0]]
        
    }
        
    func checkIndexErr(_ x : Int, _ y : Int) -> Bool{
        if x < 0 || x >= matrix.count || y < 0 || y >= matrix[0].count || matrix[x][y] == 0{
            return false
        }
        return true
    }
    func minPathToGoal(){
        
        while !bfsQueue.isEmpty { //bfs를 통해 큐가 비어져 있을 때까지.

            let currentVertex = bfsQueue.removeFirst()
            let x = currentVertex[0]
            let y = currentVertex[1]
            visited[x][y] = true
            
            //Current vertex chance to go up, down, left and rigth vertex.
            //Check to available vertex to go and compare distances.
            if checkIndexErr(x - 1, y){
                if distance[x - 1][y] == 0 {
                    distance[x - 1][y] = distance[x][y] + 1
                    bfsQueue.append([x - 1, y])
                }else{
                    distance[x - 1][y] = min(distance[x - 1][y], distance[x][y]+1)
                }
            }
            if checkIndexErr(x, y - 1){
                if distance[x][y-1] == 0 {
                    distance[x][y-1] = distance[x][y] + 1
                    bfsQueue.append([x, y - 1])
                }else{
                    distance[x][y-1] = min(distance[x][y-1], distance[x][y]+1)
                }
            }
            if checkIndexErr(x + 1, y){
                if distance[x+1][y] == 0 {
                    distance[x+1][y] = distance[x][y] + 1
                    bfsQueue.append([x + 1, y])
                }else{
                    distance[x+1][y] = min(distance[x+1][y], distance[x][y]+1)
                }
            }
            if checkIndexErr(x, y + 1){
                if distance[x][y+1] == 0 {
                    distance[x][y+1] = distance[x][y] + 1
                    bfsQueue.append([x, y + 1])
                }else{
                    distance[x][y+1] = min(distance[x][y+1], distance[x][y]+1)
                }
            }
        }
        
        //shortest path to goal
        print(distance[matrix.count-1][matrix[0].count-1])
    }
}


let matrixSize = readLine()!.split(separator: " ").compactMap{Int($0)}
let d = Dijkstra(matrixSize)
d.minPathToGoal()
