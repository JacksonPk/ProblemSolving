package Programmers.dfs;

public class 타겟넘버 {

    public static class Solution {
        int count = 0;

        // 현재 선택한 값들 과 다음번째 순서
        public void dfs(int curValue, int[] numbers, int target, int index) {
            if (numbers.length == index) {
                if (curValue == target) {
                    count++;
                }
            } else if (index < numbers.length) {
                dfs((curValue + numbers[index]), numbers, target, index + 1);
                dfs((curValue - numbers[index]), numbers, target, index + 1);
            } else {
                return;
            }
        }

        public int solution(int[] numbers, int target) {
            dfs(0, numbers, target, 0);
            return count;
        }
    }

    public static void main(String[] args) {

        Solution s = new Solution();
        int[] list1 = { 1, 1, 1, 1, 1 };
        int target1 = 3;

        int[] list2 = { 4, 1, 2, 1 };
        int target2 = 2;

        System.out.println(s.solution(list1, target1));
        s.count = 0;
        System.out.println(s.solution(list2, target2));
    }
}
