package Programmers.stack;

import java.util.*;

//하지만 int형과 같은 primitive 타입은 toArray()를 사용할 수 없다.
public class 같은숫자는싫어 {

    public static class Solution {
        public int[] solution(int[] arr) {
            int[] answer = {};

            // Set<Integer> set = new HashSet<Integer>();
            List<Integer> list = new ArrayList<Integer>();
            for (int i = 0; i < arr.length; i++) {
                if (i == 0) {
                    list.add(arr[i]);
                } else {
                    if (arr[i] != list.get(list.size() - 1)) {
                        list.add(arr[i]);
                    }
                }
            }
            answer = new int[list.size()];

            for (int i = 0; i < list.size(); i++) {
                answer[i] = list.get(i).intValue();
            }

            return answer;
        }
    }

    public static void main(String[] args) {
        int[] list1 = new int[] { 1, 1, 3, 3, 0, 1, 1 };
        int[] list2 = new int[] { 4, 4, 4, 3, 3 };

        Solution s = new Solution();
        System.out.println(Arrays.toString(s.solution(list1)));
        System.out.println(Arrays.toString(s.solution(list2)));

    }
}
