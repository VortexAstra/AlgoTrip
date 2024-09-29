//
//  main.swift
//  My_Calendar_II
//
//  Created by artem-ustinov on 27.09.2024.
//

import Foundation

/*731. My Calendar II
 You are implementing a program to use as your calendar. We can add a new event if adding the event will not cause a triple booking.

 A triple booking happens when three events have some non-empty intersection (i.e., some moment is common to all the three events.).

 The event can be represented as a pair of integers start and end that represents a booking on the half-open interval [start, end), the range of real numbers x such that start <= x < end.

 Implement the MyCalendarTwo class:

 MyCalendarTwo() Initializes the calendar object.
 boolean book(int start, int end) Returns true if the event can be added to the calendar successfully without causing a triple booking. Otherwise, return false and do not add the event to the calendar.
*/

class MyCalendarTwo {

    private var singleBooked: [NSRange] = []
    private var doubleBooked: [NSRange] = []

    func book(_ start: Int, _ end: Int) -> Bool {
        let newRange = NSRange(location: start, length: end - start)

        if doubleBooked.contains(where: { $0.intersection(newRange) != nil }) {
            return false
        }

        singleBooked.forEach { range in
            if let overlap = range.intersection(newRange) {
                doubleBooked.append(overlap)
            }
        }

        singleBooked.append(newRange)
        return true 
    }
}

let calendar = MyCalendarTwo()

[[],[10,20],[50,60],[10,40],[5,15],[5,10],[25,55]].filter { !$0.isEmpty } .forEach { array in
    print(calendar.book(array[0], array[1]))
}
