//
//  main.swift
//  Reverse_Prefix_of_Word
//
//  Created by artem-ustinov on 27.09.2024.
//

import Foundation

/*
 Given a 0-indexed string word and a character ch, reverse the segment of word that starts at index 0 and ends at the index of the first occurrence of ch (inclusive). If the character ch does not exist in word, do nothing.

 For example, if word = "abcdefd" and ch = "d", then you should reverse the segment that starts at 0 and ends at 3 (inclusive). The resulting string will be "dcbaefd".
 Return the resulting string.

 Example 1:

 Input: word = "abcdefd", ch = "d"
 Output: "dcbaefd"
 Explanation: The first occurrence of "d" is at index 3.
 Reverse the part of word from 0 to 3 (inclusive), the resulting string is "dcbaefd".
 Example 2:

 Input: word = "xyxzxe", ch = "z"
 Output: "zxyxxe"
 Explanation: The first and only occurrence of "z" is at index 3.
 Reverse the part of word from 0 to 3 (inclusive), the resulting string is "zxyxxe".
 Example 3:

 Input: word = "abcd", ch = "z"
 Output: "abcd"
 Explanation: "z" does not exist in word.
 You should not do any reverse operation, the resulting string is "abcd".
*/

class Solution {
    func reversePrefix(_ word: String, _ ch: Character) -> String {
        if let index = word.firstIndex(where: { $0 == ch }) {
            let currentIndex = index.utf16Offset(in: word) + 1
            let startIndex = word.index(word.startIndex, offsetBy: currentIndex)
            let substring = word[startIndex...]
            return String(word.prefix(currentIndex).reversed() + substring)
        }

        return word
    }

    // Second solution

    func reverseSegment(_ word: String, _ ch: Character) -> String {
        var characters = Array(word)
        var left = 0
        var right = 0

        while right < characters.count && characters[right] != ch {
            right += 1
        }

        if right < characters.count {
            while left < right {
                characters.swapAt(left, right)
                left += 1
                right -= 1
            }
        }

        return String(characters)
    }

}

print(Solution().reversePrefix("xyxzxe", "z"))
print(Solution().reverseSegment("abcdefg", "d"))
