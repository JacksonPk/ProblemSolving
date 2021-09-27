//https://www.acmicpc.net/problem/10158
let maxRowCol = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let (maxX,maxY) = (maxRowCol[0],maxRowCol[1])
let initPos = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let (initX,initY) = (initPos[0],initPos[1])
let time = Int(readLine()!)!
var (ansX,ansY) = (0,0)

func getPos() -> (Int,Int) { //해결방법1
    //X,Y를 따로 구분하면 쉬워진다.
    var xArr = Array(initX...maxX)
    var yArr = Array(initY...maxY)
    xArr.append(contentsOf: Array(0..<maxX).reversed())
    xArr.append(contentsOf: Array(1..<initX))
    yArr.append(contentsOf: Array(0..<maxY).reversed())
    yArr.append(contentsOf: Array(1..<initY))

    return (xArr[time%xArr.count],yArr[time%yArr.count])
}

func getPos2() -> (Int,Int) {
    var x = (initX+time)%(2*maxX)
    var y = (initY+time)%(2*maxY)
    
    x = maxX - abs(maxX-x)
    y = maxY - abs(maxY-y)
    
    return (x,y)
}
(ansX,ansY) = getPos2()
print(ansX,ansY)
