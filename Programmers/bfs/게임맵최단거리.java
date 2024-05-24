package Programmers.bfs;

import java.util.LinkedList;
import java.util.Queue;

public class 게임맵최단거리 {

    public static class Solution {

        int min = -1;

        public void dfs(int[][] maps, boolean[][] isSteped, int curPosX, int curPosY, int curStep) {
            // 해당 방법은 모든 경우의 수를 다 찾으나 여기선 그럴 필요 없음.
            // 가장 가까운 거리이기에 깊이우선이 아닌 조건에 합하는 level까지만 찾으면 됌

            // 해당 방식은 답안 테스트는 통과되나 효율성 테스트 실패 됨.
            if (curPosX == maps.length - 1 && curPosY == maps[0].length - 1) {

                if (min == -1) {
                    min = curStep;
                } else {
                    min = Math.min(curStep, min);
                }
                return;
            }

            isSteped[curPosX][curPosY] = true;

            if (curPosX + 1 < maps.length) {
                if (maps[curPosX + 1][curPosY] == 1 && isSteped[curPosX + 1][curPosY] == false) {
                    dfs(maps, isSteped, curPosX + 1, curPosY, curStep + 1);
                }
            }
            if (curPosY + 1 < maps[0].length) {
                if (maps[curPosX][curPosY + 1] == 1 && isSteped[curPosX][curPosY + 1] == false) {
                    dfs(maps, isSteped, curPosX, curPosY + 1, curStep + 1);
                }
            }
            if (curPosX - 1 >= 0) {
                if (maps[curPosX - 1][curPosY] == 1 && isSteped[curPosX - 1][curPosY] == false) {
                    dfs(maps, isSteped, curPosX - 1, curPosY, curStep + 1);
                }
            }
            if (curPosY - 1 >= 0) {
                if (maps[curPosX][curPosY - 1] == 1 && isSteped[curPosX][curPosY - 1] == false) {
                    dfs(maps, isSteped, curPosX, curPosY - 1, curStep + 1);
                }
            }

            isSteped[curPosX][curPosY] = false;
        }

        public int solution(int[][] maps) {
            int answer = -1;
            boolean[][] isSteped = new boolean[maps.length][maps[0].length];

            int[] dx = { 1, -1, 0, 0 };
            int[] dy = { 0, 0, 1, -1 };

            Queue<int[]> queue = new LinkedList<int[]>();

            queue.offer(new int[] { 0, 0, 0 });
            isSteped[0][0] = true;

            while (!queue.isEmpty()) {
                int[] poll = queue.poll();

                int x = poll[0];
                int y = poll[1];
                int step = poll[2];

                if ((x == (maps.length - 1)) && (y == (maps[0].length - 1))) {
                    if (answer == -1) {
                        answer = step + 1;
                    } else {
                        answer = Math.min(step, min);
                    }
                    // System.out.println("step"+ step);
                }

                for (int i = 0; i < 4; i++) {
                    int nx = x + dx[i];
                    int ny = y + dy[i];

                    if (nx >= 0 && nx < maps.length && ny >= 0 && ny < maps[0].length) {
                        if (maps[nx][ny] == 1 && isSteped[nx][ny] == false) {
                            // System.out.println("nx: " + nx +", ny: " + ny);
                            isSteped[nx][ny] = true;
                            queue.offer(new int[] { nx, ny, step + 1 });
                        }
                    }
                }
            }

            return answer;
        }
    }

    public static void main(String[] args) {
        Solution s = new Solution();
        int[][] list1 = { { 1, 0, 1, 1, 1 }, { 1, 0, 1, 0, 1 }, { 1, 0, 1, 1, 1 }, { 1, 1, 1, 0, 1 },
                { 0, 0, 0, 0, 1 } };
        System.out.println(s.solution(list1)); // 11

    }
}
