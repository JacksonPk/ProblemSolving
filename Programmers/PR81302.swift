//https://programmers.co.kr/learn/courses/30/lessons/81302
import Foundation

let dx1 = [-1,1,0,0]
let dy1 = [0,0,-1,1]

let dx2 = [-1,-1,1,1]
let dy2 = [-1,1,-1,1]

let dx3 = [-2,2,0,0]
let dy3 = [0,0,-2,2]

func unitDistance(_ places:[[Character]], _ row: Int, _ col: Int) -> Bool {
    //1.바로 붙어있는거
    //2.대각선으로 있는거
    //3.한칸 떨어져있는거
    
    for i in 0..<4 {
        if !(row+dx1[i] < 0 || row+dx1[i] >= 5 || col+dy1[i] < 0 || col+dy1[i] >= 5) {
            if places[row+dx1[i]][col+dy1[i]] == "P" {
                return false
            }
        }
        
    }
    
    for i in 0..<4 {
        if !(row+dx2[i] < 0 || row+dx2[i] >= 5 || col+dy2[i] < 0 || col+dy2[i] >= 5) {
            if places[row+dx2[i]][col+dy2[i]] == "P" {
                if places[row][col+dy2[i]] != "X" || places[row+dx2[i]][col] != "X" {
                    return false
                }
            }
        }
    }
    
    for i in 0..<4 {
        if !(row+dx3[i] < 0 || row+dx3[i] >= 5 || col+dy3[i] < 0 || col+dy3[i] >= 5) {
            if places[row+dx3[i]][col+dy3[i]] == "P" {
                if places[row+dx1[i]][col+dy1[i]] != "X" {
                    return false
                }
            }
        }
    }
    
    return true
}


func checkPlace(_ place:[[Character]]) -> Int {
    
    for rowIdx in 0..<place.count {
        for colIdx in 0..<place[rowIdx].count {
            if place[rowIdx][colIdx] == "P" {
                if unitDistance(place, rowIdx, colIdx) == false {
                    return 0
                }
            }
        }
    }
    
    return 1
}

func solution(_ places:[[String]]) -> [Int] {
    var result = [Int]()//Array(repeating: 0, count: 5)
    
    places.enumerated().forEach { idx, place in
        
        var placeCase = [[Character]]()
        place.forEach { points in
            placeCase.append(Array(points))
        }
        
        result.append(checkPlace(placeCase))
    }
    
    return result
}

let places = [["POOOP", "OXXOX", "OPXPX", "OOXOX", "POXXP"], ["POOPX", "OXPXP", "PXXXO", "OXXXO", "OOOPP"], ["PXOPX", "OXOXP", "OXPOX", "OXXOP", "PXPOX"], ["OOOXX", "XOOOX", "OOOXX", "OXOOX", "OOOOO"], ["PXPXP", "XPXPX", "PXPXP", "XPXPX", "PXPXP"]]

print(solution(places))
