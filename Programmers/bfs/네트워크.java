package Programmers.bfs;

import java.util.*;

public class 네트워크 {

    public static class Solution {
        public int solution(int n, int[][] computers) {
            int answer = 0; // 갯수
            Queue<int[]> queue = new LinkedList<int[]>();
            boolean[] isSearched = new boolean[n];

            for (int i = 0; i < computers.length; i++) {
                if (isSearched[i] == false) {
                    isSearched[i] = true;

                    queue.add(computers[i]);

                    while (!queue.isEmpty()) {
                        int[] item = queue.poll();

                        for (int j = 0; j < item.length; j++) {
                            if (i == j)
                                continue;
                            if (item[j] == 1 && isSearched[j] == false) {
                                isSearched[j] = true;
                                queue.add(computers[j]);
                            }
                        }
                    }
                    answer += 1;
                }

            }
            return answer;
        }

    }

    public static void main(String[] args) {
        int[][] input1 = { { 1, 1, 0 }, { 1, 1, 0 }, { 0, 0, 1 } };
        Solution s = new Solution();
        System.out.println(s.solution(input1.length, input1)); // 2
    }
}
