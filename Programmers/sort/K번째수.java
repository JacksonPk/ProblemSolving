package Programmers.sort;

import java.util.*;

public class K번째수 {
    public static class Solution {
        public int[] solution(int[] array, int[][] commands) {
            int[] answer = new int[commands.length];
            for (int j = 0; j < commands.length; j++) {
                int start = commands[j][0] - 1;
                int end = commands[j][1];
                int idx = commands[j][2];

                // System.out.println("start" + start);
                // System.out.println("end" + end);
                // System.out.println("idx" + idx);

                int[] newLst = new int[end - start + 1];
                // System.out.println("commands[j].length" + array.length);
                for (int i = 0; i < array.length; i++) {
                    if (i >= start && i < end) {
                        // System.out.println("idx" + (i - start) + "val" + array[i]);
                        newLst[i - start] = array[i];
                    }
                }
                Arrays.sort(newLst);
                answer[j] = newLst[idx];
                // System.out.println("result: " + newLst[idx]);
            }

            return answer;
        }
    }

    public static void main(String[] args) {
        int[] array1 = { 1, 5, 2, 6, 3, 7, 4 };
        int[][] commands1 = { { 2, 5, 3 }, { 4, 4, 1 }, { 1, 7, 3 } };
        Solution s = new Solution();
        System.out.println(Arrays.toString(s.solution(array1, commands1)));
    }
}
