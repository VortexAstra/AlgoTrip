//
//  main.swift
//  Stack_With_Increment_Operation
//
//  Created by artem-ustinov on 30.09.2024.
//

import Foundation

/*1381. Design a Stack With Increment Operation

 Design a stack that supports increment operations on its elements.

 Implement the CustomStack class:

 CustomStack(int maxSize) Initializes the object with maxSize which is the maximum number of elements in the stack.
 void push(int x) Adds x to the top of the stack if the stack has not reached the maxSize.
 int pop() Pops and returns the top of the stack or -1 if the stack is empty.
 void inc(int k, int val) Increments the bottom k elements of the stack by val. 
 If there are less than k elements in the stack, increment all the elements in the stack.
*/


class CustomStack {

    private var stack: [Int]
    private let maxValue: Int

    init(
        _ maxSize: Int
    ) {
        self.maxValue = maxSize
        self.stack = Array()
    }

    func push(
        _ x: Int
    ) {
        guard stack.count < maxValue else { return }
        stack.append(x)
    }

    func pop() -> Int {
        guard !stack.isEmpty else { return -1 }
        return stack.removeLast()
    }

    func increment(
        _ k: Int,
        _ val: Int
    ) {
        let limit = min(k, stack.count)
        for i in 0..<limit {
            stack[i] += val
        }
    }
}
