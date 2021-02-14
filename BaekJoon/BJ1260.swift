//https://www.acmicpc.net/problem/1260
import Foundation

class Graph{
    
    var nodes : Int
    var startPoint : Int
    var adjList : [Int : [Int]]
    var visited : [Int : Bool] //재사용
    var sequenceGraph : [Int] = []
    
    
    init(_ input : [Int]){
        self.startPoint = input[2]
        self.nodes = input[1]
        self.adjList = [startPoint:[]]
        self.visited = [:]
        self.sequenceGraph.append(startPoint)
        
    }
    
    func makeAdjList(){ // 받은 input을 vertex처리화 시킨다. 양방향이므로 1 3 -> 1:[3], 3:[1] 필요
        
        for _ in 0 ..< nodes {
            let input = readLine()!.split(separator: " ").compactMap{Int($0)}
            
            if adjList[input[0]] == nil {
                let intArr = [input[1]]
                adjList[input[0]] = intArr
            }else{
                var intArr : [Int] = adjList[input[0]]!
                intArr.append(input[1])
                adjList[input[0]] = intArr.sorted() //DFS,BFS를 위해 sorting
            }
            
            if adjList[input[1]] == nil {
                let intArr = [input[0]]
                adjList[input[1]] = intArr
            }else{
                var intArr : [Int] = adjList[input[1]]!
                intArr.append(input[0])
                adjList[input[1]] = intArr.sorted() //DFS,BFS를 위해 sorting
            }
            
            if visited[input[0]] == nil{
                visited[input[0]] = false
            }
            if visited[input[1]] == nil{
                visited[input[1]] = false
            }
        }
    }
    
    func dfs(_ vertex : Int){
        visited[vertex] = true
        sequenceGraph.append(vertex)
        for vertex in adjList[vertex]! {
            if !visited[vertex]! {
                dfs(vertex)
            }
        }
    }
    
    func dfsAllGraph(){
        visited[startPoint] = true //시작점 방문
        for vertex in adjList[startPoint]! { //시작점으로부터의 인접한 모든 vertex
            if !self.visited[vertex]! {
                dfs(vertex)
            }
        }
    }
    
    
    func bfs(){
        //dfs 이후 다시 탐색이므로 초기화
        visited[startPoint] = true
        var queueVertex = adjList[startPoint]
        
        while !queueVertex!.isEmpty {
            let vertex = queueVertex!.removeFirst()
            sequenceGraph.append(vertex)
            visited[vertex] = true
            for vertex in adjList[vertex]! {
                if !visited[vertex]! , !queueVertex!.contains(vertex){ //방문하지않았고 현재 큐스택에 존재하지 않은 경우
                    queueVertex!.append(vertex)
                }
            }
        }
    }
    
    func initVisitedAndSequence(){
        for vertex in visited.keys{
            visited[vertex] = false
        }
        sequenceGraph = [startPoint]
    }
    
    func process(){
        makeAdjList()
        dfsAllGraph()
        printSequence()
        initVisitedAndSequence()
        bfs()
        printSequence()
    }
    
    func printSequence(){
        for vertex in sequenceGraph {
            print(vertex ,terminator : " ")
        }
        print()
    }
}

let g = Graph(readLine()!.split(separator: " ").compactMap{Int($0)})
g.process()


