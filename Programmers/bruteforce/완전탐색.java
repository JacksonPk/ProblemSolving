package Programmers.bruteforce;

import java.lang.Math;
import java.util.*;

// https://school.programmers.co.kr/learn/courses/30/lessons/42840?language=java
public class 완전탐색 {

    class Solution {
        public int[] solution(int[] answers) {
            int[] answer = new int[] {};
            int[] p1 = { 1, 2, 3, 4, 5 };
            int[] p2 = { 2, 1, 2, 3, 2, 4, 2, 5 };
            int[] p3 = { 3, 3, 1, 1, 2, 2, 4, 4, 5, 5 };

            int a1 = 0;
            int a2 = 0;
            int a3 = 0;

            for (int i = 0; i < answers.length; i++) {
                if (answers[i] == p1[i % p1.length]) {
                    a1++;
                }
                if (answers[i] == p2[i % p2.length]) {
                    a2++;
                }
                if (answers[i] == p3[i % p3.length]) {
                    a3++;
                }
            }
            // System.out.println("a1: "+ a1+ " a2: "+ a2+ " a3: "+ a3);
            int max = Math.max(Math.max(a1, a2), a3);
            // System.out.println("max: "+ max);

            List<Integer> list = new ArrayList<Integer>();
            if (a1 == max) {
                list.add(1);
            }
            if (a2 == max) {
                list.add(2);
            }
            if (a3 == max) {
                list.add(3);
            }

            answer = new int[list.size()];
            for (int i = 0; i < list.size(); i++) {
                answer[i] = list.get(i);
            }

            return answer;
        }

    }

    public static void main(String[] args) {
        // [1,2,3,4,5] [1]
        // [1,3,2,4,2] [1,2,3]
    }
}
