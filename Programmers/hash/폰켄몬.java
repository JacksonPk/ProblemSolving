package Programmers.hash;

import java.util.*;

public class 폰켄몬 {

    public static class Solution {
        public int solution(int[] nums) {
            int answer = 0;
            int numOfChoose = nums.length / 2;
            Set<Integer> set = new HashSet<Integer>();
            for (int i : nums) {
                set.add(i);
            }
            answer = set.size() < numOfChoose ? set.size() : numOfChoose;
            return answer;
        }
    }

    public static void main(String[] args) {
        int[] list1 = { 3, 1, 2, 3 };
        int[] list2 = { 3, 3, 3, 2, 2, 4 };
        int[] list3 = { 3, 3, 3, 2, 2, 2 };
        Solution s = new Solution();

        System.out.println("list1 answer: " + s.solution(list1));
        System.out.println("list2 answer: " + s.solution(list2));
        System.out.println("list3 answer: " + s.solution(list3));
    }

}