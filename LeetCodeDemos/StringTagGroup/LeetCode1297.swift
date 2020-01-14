//
//  LeetCode1297.swift
//  LeetCodeDemos
//
//  Created by maying on 2020/1/10.
//  Copyright © 2020 reborn. All rights reserved.
//

import UIKit
// 题目
// 给你一个字符串 s ，请你返回满足以下条件且出现次数最大的 任意 子串的出现次数：
// 子串中不同字母的数目必须小于等于 maxLetters 。
// 子串的长度必须大于等于 minSize 且小于等于 maxSize 。

//示例 1：
//输入：s = "aababcaab", maxLetters = 2, minSize = 3, maxSize = 4
//输出：2
//解释：子串 "aab" 在原字符串中出现了 2 次。
//它满足所有的要求：2 个不同的字母，长度为 3 （在 minSize 和 maxSize 范围内）。

//示例 2：
//输入：s = "aaaa", maxLetters = 1, minSize = 3, maxSize = 3
//输出：2
//解释：子串 "aaa" 在原字符串中出现了 2 次，且它们有重叠部分。

//提示：
//1 <= s.length <= 10^5
//1 <= maxLetters <= 26
//1 <= minSize <= maxSize <= min(26, s.length)
//s 只包含小写英文字母。

// 思路 ：
// 由于 minSize 和 maxSize 都不超过 26，因此我们可以枚举所有长度在 minSize 与 maxSize 之间的字符串，选出其中字母数量小于等于的 maxLetters 的字符串并进行频数统计。
// 因为是求次数最大的，如果一个长串满足条件，那么他的子串也一定满足，也就是说子串的次数一定大于长串。因此只需要看最短的即可

// 假设字符串 T 在给定的字符串 S 中出现的次数为 k，那么 T 的任意一个子串出现的次数至少也为 k，即 T 的任意一个子串在 S 中出现的次数不会少于 T 本身。这样我们就可以断定，在所有满足条件且出现次数最多的的字符串中，一定有一个的长度恰好为 minSize。

//这样以来，我们只需要枚举所有长度为 minSize 的字符串即可，时空复杂度均减少了 O(S)。


class LeetCode1297: NSObject {
    
    func getFinalResult(_ s: String, _ maxLetters: Int, _ minSize: Int, _ maxSize: Int) -> Int {
        return Solution1297().maxFreq(s, maxLetters, minSize, maxSize)
    }
}

class Solution1297 {
    func maxFreq(_ s: String, _ maxLetters: Int, _ minSize: Int, _ maxSize: Int) -> Int {
        
        var substrsCount = [String:Int]()
        var subStr = ""
        var charsCounter = [Character:Int]()
        for ch in s {
            subStr.append(ch)
            charsCounter.updateValue(1 + (charsCounter[ch] ?? 0), forKey: ch)
            
            if subStr.count == minSize {
                if charsCounter.count <= maxLetters {
                    substrsCount.updateValue(1 + (substrsCount[subStr]  ?? 0), forKey: subStr)
                }
                let ch = subStr.removeFirst()
                if let c = charsCounter[ch] {
                    if c == 1 {
                        charsCounter.removeValue(forKey: ch)
                    } else {
                        charsCounter.updateValue(c - 1, forKey: ch)
                    }
                }
            }
        }
        
        return substrsCount.values.max() ?? 0
    }
 }

