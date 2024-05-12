# https://www.acmicpc.net/problem/15649


def main():
    total, max_choose = input().split()
    total = int(total)
    max_choose = int(max_choose)
    usedArr = [False for i in range(total)]
    totalList = list(range(1, total + 1))
    backTracking(totalList, [], max_choose, usedArr)
    return 0


def backTracking(total, chooseArr, max_choose, usedArr):
    if len(chooseArr) == max_choose:
        print(*chooseArr)
        return
    else:
        for idx in range(len(total)):
            if usedArr[idx] == False:
                usedArr[idx] = True
                chooseArr.append(total[idx])
                backTracking(total, chooseArr, max_choose, usedArr)
                usedArr[idx] = False
                chooseArr.pop()
        return


main()
