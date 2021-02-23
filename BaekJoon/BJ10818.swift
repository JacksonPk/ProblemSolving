//답안을 봐도 여전이 이해가 되지 않는 문제. 시간초과 문제.

let N = readLine()
let input = readLine()!.split(separator: " ").map() { Int(String($0))! }

var min = 1000000
var max = -1000000

for i in input {
  
  if min > i {
    min = i
  }
  
  if max < i {
    max = i
  }
  
}


print(min, max)
