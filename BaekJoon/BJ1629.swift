//https://www.acmicpc.net/problem/1629

let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
func recursion(base: Int, power: Int, mod: Int) -> Int {
    if power == 1 {
        return base % mod
    }
    if power % 2 == 1 {
        return (recursion(base: base, power: power/2, mod: mod) * recursion(base: base, power: (power/2) + 1, mod: mod)) % mod
    }else {
        return (recursion(base: base, power: power/2, mod: mod) * recursion(base: base, power: power/2, mod: mod)) % mod
    }
}

print(recursion(base: input[0], power: input[1], mod: input[2]))
