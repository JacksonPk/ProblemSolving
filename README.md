# Problem Solving by Swift

Included 


LeetCode
Programmers
HackerRank

### 백준BaekJoon

#### 수학, 사칙연산
번호|제목|풀이|
|----|------|------|
|1000|A+B|https://github.com/JacksonPk/ProblemSolving/blob/main/BaekJoon/BJ1000.swift|
|1001|A-B|https://github.com/JacksonPk/ProblemSolving/blob/main/BaekJoon/BJ1001.swift|


#### 다이나믹 프로그래밍
번호|제목|풀이|
|----|------|------|
|1003|피보나치 함수|https://github.com/JacksonPk/ProblemSolving/blob/main/BaekJoon/BJ1003.swift|


------

## JAVA 기초 문법 정리

### 선언
``` java
//해당 선언 미리하기.
import java.util.*;
import java.lang.Math;
```

### 배열
``` java
int[] list = {}; //초기화
int[] list = {1, 2, 3}; //초기화 및 값 선언
int[] list = new int[3]; //초기화 및 배열크기선언

//선언 및 초기화
boolean[] isUsed = new boolean[10];
Arrays.fill(isUsed, Boolean.FALSE);
```

### 배열 sort시
``` java
int[] list = {3,2,1};
Arrays.sort(list);
```

### Set
``` java
Set<Integer> set = new HashSet<Integer>(); //선언
set.add(1);
```

### 동적 list: ArrayList
``` java
List<Integer> list = new ArrayList<Integer>();
list.add(1);
list.get(0); //get(index) return 아이템. list[4] <- 이런 형태 불가
list.toArray(); //ArrayList to Array, string에서만 사용. int형 불가.
```

### 스택vs큐
```java
//Stack
Stack<int> stack = new Stack<>();
stack.push(1);
stack.remove(1);
stack.peek(); //스택 top

//Queue
Queue<int> queue = new LinkedList<>();
queue.offer(1);
queue.remove(1);
queue.peek(); //큐 left
queue.poll(); //큐 right
```