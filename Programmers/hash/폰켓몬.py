def solution(nums):
    max_num = int(len(nums) / 2)
    num_of_ponkemons = len(list(set(nums)))
    if max_num > num_of_ponkemons:
        return num_of_ponkemons
    else:
        return max_num


# 아래는 백트래킹으로 풀어서 복잡성이 더 늘어나서 시간초과 오류
"""ansList = []
def solution(nums):
    ponkemons = nums
    max_choose = int(len(nums) / 2)
    isUsed = [False for i in range(len(ponkemons))]
    backTracking([], max_choose, ponkemons, isUsed)
    return max(ansList)


def backTracking(total, max_choose, ponkemons, isUsed):
    if len(total) == max_choose:
        result = list(set(total))
        ansList.append(len(result))
    else:
        for idx in range(len(ponkemons)):
            if isUsed[idx] == False:
                isUsed[idx] == True
                total.append(ponkemons[idx])
                backTracking(total, max_choose, ponkemons[idx + 1 :], isUsed)
                isUsed[idx] == False
                total.pop()
"""
"""
AI 솔루션
사용자가 작성한 코드를 살펴보면 백트래킹(backtracking) 기법을 사용하여 문제를 해결하려고 시도하였습니다. 하지만, 이 문제의 경우 해시를 활용하여 훨씬 더 간단하고 효율적으로 해결할 수 있습니다. 

문제의 핵심은 최대한 많은 다양한 타입의 포켓몬을 선택하는 것입니다. 백트래킹 방식으로 모든 가능한 조합을 찾아내려고 시도하는 것은 문제 해결에 있어 필요 이상의 복잡성을 추가하며, 불필요한 시간 소모를 야기할 수 있습니다.

해시 자료구조를 사용하면, 포켓몬의 종류를 쉽게 파악할 수 있고, 주어진 포켓몬 배열에서 고유한 타입의 수를 셀 수 있습니다. 그 후, 선택할 수 있는 최대 포켓몬 수(N/2)와 고유한 타입의 수 중에서 더 작은 값을 결과로 반환합니다. 이 접근 방식은 훨씬 더 간결하고 효율적입니다.

따라서, 포켓몬의 종류를 계산하여 고유한 타입의 수를 쉽게 찾을 수 있는 방법에 대해 생각해 보세요. Python의 경우, `set` 함수나 `dict` 같은 해시를 이용한 자료구조를 사용하여 이 문제를 해결할 수 있습니다.
"""
