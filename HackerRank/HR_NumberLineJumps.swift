//https://www.hackerrank.com/challenges/kangaroo/problem

import Foundation

func kangaroo(x1: Int, v1: Int, x2: Int, v2: Int) -> String {

    if v1 > v2 && ((x2-x1) % (v1-v2)) == 0{
            return "YES"
        }
        return "NO"

}
