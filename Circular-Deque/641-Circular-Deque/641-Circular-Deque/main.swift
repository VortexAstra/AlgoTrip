//
//  main.swift
//  641-Circular-Deque
//
//  Created by artem-ustinov on 29.09.2024.
//

import Foundation

class MyCircularDeque {
    private var deque: [Int]
    private let capacity: Int
    private var size: Int
    private var front: Int
    private var rear: Int

    init(capacity: Int) {
        self.deque = Array(repeating: -1, count: capacity)
        self.capacity = capacity
        self.size = 0
        self.front = 0
        self.rear = 0
    }

    func insertFront(_ value: Int) -> Bool {
        if isFull() { return false }
        front = (front - 1 + capacity) % capacity
        deque[front] = value
        size += 1
        return true
    }

    func insertRear(_ value: Int) -> Bool {
        if isFull() { return false }
        deque[rear] = value
        rear = (rear + 1) % capacity
        size += 1
        return true
    }


    func deleteFront() -> Bool {
        if isEmpty() {
            return false
        }
        front = (front + 1) % capacity
        size -= 1
        return true
    }

    func deleteLast() -> Bool {
        if isEmpty() {
            return false
        }
        rear = (rear - 1 + capacity) % capacity
        size -= 1
        return true
    }


    func getFront() -> Int {
        if isEmpty() {
            return -1
        }
        return deque[front]
    }

    func getRear() -> Int {
        if isEmpty() {
            return -1
        }
        return deque[(rear - 1 + capacity) % capacity]
    }

    func isEmpty() -> Bool {
        return size == 0
    }

    func isFull() -> Bool {
        return size == capacity
    }
}

let deque = MyCircularDeque(capacity: 5)
deque.insertRear(5)
deque.insertRear(6)
deque.insertRear(3)
deque.insertFront(2)
deque.insertFront(1)
deque.deleteLast()
deque.deleteFront()
