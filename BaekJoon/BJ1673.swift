//https://www.acmicpc.net/problem/1673

while let input = readLine() {
    let NK = input.split(separator: " ").compactMap{Int(String($0))}
    var (N,K) = (NK[0], NK[1])
    var ans = N
    while N >= K {
        ans += N/K
        N = (N/K) + (N%K)
    }
    print(ans)
}
