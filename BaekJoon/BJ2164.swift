//https://www.acmicpc.net/problem/2164

let N = Int(readLine()!)!

var i = 1
while true {
    if N >= i , N < i*2 {
        break
    }else{
        i *= 2
    }
}
let remain = N-i
if remain == 0 {
    print(i)
}else {
    print(2*remain)
}

//100
//this time = 1 result = 1
//this time = 2 result = 2
//this time = 3 result = 2
//this time = 4 result = 4
//this time = 5 result = 2
//this time = 6 result = 4
//this time = 7 result = 6
//this time = 8 result = 8
//this time = 9 result = 2
//this time = 10 result = 4
//this time = 11 result = 6
//this time = 12 result = 8
//this time = 13 result = 10
//this time = 14 result = 12
//this time = 15 result = 14
//this time = 16 result = 16
//this time = 17 result = 2
//this time = 18 result = 4
//this time = 19 result = 6
//this time = 20 result = 8
//this time = 21 result = 10
//this time = 22 result = 12
//this time = 23 result = 14
//this time = 24 result = 16
//this time = 25 result = 18
//this time = 26 result = 20
//this time = 27 result = 22
//this time = 28 result = 24
//this time = 29 result = 26
//this time = 30 result = 28
//this time = 31 result = 30
//this time = 32 result = 32
//this time = 33 result = 2
//this time = 34 result = 4
//this time = 35 result = 6
//this time = 36 result = 8
//this time = 37 result = 10
//this time = 38 result = 12
//this time = 39 result = 14
//this time = 40 result = 16
//this time = 41 result = 18
//this time = 42 result = 20
//this time = 43 result = 22
//this time = 44 result = 24
//this time = 45 result = 26
//this time = 46 result = 28
//this time = 47 result = 30
//this time = 48 result = 32
//this time = 49 result = 34
//this time = 50 result = 36
//this time = 51 result = 38
//this time = 52 result = 40
//this time = 53 result = 42
//this time = 54 result = 44
//this time = 55 result = 46
//this time = 56 result = 48
//this time = 57 result = 50
//this time = 58 result = 52
//this time = 59 result = 54
//this time = 60 result = 56
//this time = 61 result = 58
//this time = 62 result = 60
//this time = 63 result = 62
//this time = 64 result = 64
//this time = 65 result = 2
//this time = 66 result = 4
//this time = 67 result = 6
//this time = 68 result = 8
//this time = 69 result = 10
//this time = 70 result = 12
//this time = 71 result = 14
//this time = 72 result = 16
//this time = 73 result = 18
//this time = 74 result = 20
//this time = 75 result = 22
//this time = 76 result = 24
//this time = 77 result = 26
//this time = 78 result = 28
//this time = 79 result = 30
//this time = 80 result = 32
//this time = 81 result = 34
//this time = 82 result = 36
//this time = 83 result = 38
//this time = 84 result = 40
//this time = 85 result = 42
//this time = 86 result = 44
//this time = 87 result = 46
//this time = 88 result = 48
//this time = 89 result = 50
//this time = 90 result = 52
//this time = 91 result = 54
//this time = 92 result = 56
//this time = 93 result = 58
//this time = 94 result = 60
//this time = 95 result = 62
//this time = 96 result = 64
//this time = 97 result = 66
//this time = 98 result = 68
//this time = 99 result = 70
//this time = 100 result = 72
//Program ended with exit code: 0
