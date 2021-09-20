//https://www.acmicpc.net/problem/9655

//나머지값 0이면 SK, 1이면 CY라고 하자 나중에 바뀔수도
/*
 5인데 SK가 이긴다?
 SK always start first
 */
print(Int(readLine()!)! % 2 == 0 ? "CY" : "SK")
