//https://www.acmicpc.net/problem/10866

class Deck {
    var elements = [Int]() //앞에서 넣든 뒤에서 넣든 size를 1씩증가한다.
    
    func pushBack(_ num: Int) {
        elements.append(num)
    }
    func pushFront(_ num: Int) {
        elements.insert(num, at: 0)
    }
    func popFront() -> Int {
        sizeDeck() != 0 ? elements.removeFirst() : -1
    }
    func popBack() -> Int {
        sizeDeck() != 0 ? elements.removeLast() : -1
    }
    func sizeDeck() -> Int {
        return elements.count
    }
    func emptyDeck() -> Int {
        sizeDeck() != 0 ? 0 : 1
    }
    func frontDeck() -> Int {
        sizeDeck() != 0 ? elements.first! : -1
    }
    func backDeck() -> Int {
        sizeDeck() != 0 ? elements.last! : -1
    }
}


let deck = Deck()

for _ in 0 ..< Int(readLine()!)! {
    let command = readLine()!.split(separator: " ")
    switch command[0] {
    case "push_back":
        deck.pushBack(Int(command[1])!)
    case "push_front":
        deck.pushFront(Int(command[1])!)
    case "front":
        print(deck.frontDeck())
    case "back":
        print(deck.backDeck())
    case "size":
        print(deck.sizeDeck())
    case "empty":
        print(deck.emptyDeck())
    case "pop_back":
        print(deck.popBack())
    case "pop_front":
        print(deck.popFront())
    default:
        break
    }
}
