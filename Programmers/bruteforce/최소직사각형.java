package Programmers.bruteforce;

import java.util.*;
import java.lang.Math;

public class 최소직사각형 {
    public static class Solution {
        public int solution(int[][] sizes) {
            int maxLeft = 0;
            int maxRight = 0;

            for (int i = 0; i < sizes.length; i++) {
                int[] element = sizes[i];

                if (element[0] > element[1]) {
                    int temp = element[0];
                    element[0] = element[1];
                    element[1] = temp;
                }
                maxLeft = Math.max(maxLeft, element[0]);
                maxRight = Math.max(maxRight, element[1]);
            }

            // System.out.println("maxLeft "+maxLeft);
            // System.out.println("maxRight "+maxRight);
            return maxLeft * maxRight;
        }
    }

    public static void main(String[] args) {
        int[][] input1 = { { 60, 50 }, { 30, 70 }, { 60, 30 }, { 80, 40 } };
        int[][] input2 = { { 10, 7 }, { 12, 3 }, { 8, 15 }, { 14, 7 }, { 5, 15 } };
        int[][] input3 = { { 14, 4 }, { 19, 6 }, { 6, 16 }, { 18, 7 }, { 7, 11 } };

        Solution s = new Solution();
        System.out.println(s.solution(input1));
        System.out.println(s.solution(input2));
        System.out.println(s.solution(input3));
    }
}
