//
//  83.swift
//  Algorithm_By_Baekjoon_LeetCode
//
//  Created by jinseo park on 1/13/21.
//

//MARK: 링크 :https://leetcode.com/problems/remove-duplicates-from-sorted-list/



//  Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    
    public init() {
        self.val = 0; self.next = nil;
        
    }
    public init(_ val: Int) {
        self.val = val; self.next = nil;
        
    }
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val; self.next = next;
        
    }
}

class Leet83_Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        guard var currentNode = head else{ return nil}
        var tempVar : Int = currentNode.val
        
        while currentNode.next != nil {
            
            let previouseNode = currentNode
            currentNode = currentNode.next!
            
            if currentNode.val == tempVar{ //같은 값 제거를 위한 코드
                previouseNode.next = currentNode.next
                currentNode = previouseNode
            }else{
                tempVar = currentNode.val
            }
        }
        
        return head
    }
}
