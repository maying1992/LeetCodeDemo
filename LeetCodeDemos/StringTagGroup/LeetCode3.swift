//
//  LeetCode3.swift
//  LeetCodeDemos
//
//  Created by maying on 2020/1/9.
//  Copyright © 2020 reborn. All rights reserved.
//

import UIKit

//给定一个字符串，请你找出其中不含有重复字符的最长子串的长度。
//
//示例 1:
//
//输入: "abcabcbb"
//输出: 3
//解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。

///思路：首先两层循环是不可避免的，用来遍历字符串开头和结尾的下标。
///从第一层循环内部来看，实质上是每次找出以当前节点为终点的满足条件的最大长度
///如果在内部循环时发现某节点和当前外层节点字符一样，那么意味着下次可以以这个节点后一个为起点。这一点需要考虑清楚。

class LeetCode3: NSObject {
    func getFinalResult(_ s: String) -> Int {
        return Solution3().lengthOfLongestSubstring(s)
    }
}

class Solution3 {
    
        func lengthOfLongestSubstring(_ s: String) -> Int {
            // 开始先将字符串化为数组
            var characters: [Character] = []
            for a in s {
                characters.append(a)
            }
            
            let length = s.count
            var start = 0 //用于每次循环的起点
            var maxLength = 0
            for index in 0..<length {
                for internalIndex in start..<index {
                    if characters[index] == characters[internalIndex] {
                        start = internalIndex + 1
                        break
                    }
                }
                if index-start+1 > maxLength {
                    maxLength = index-start+1
                }
            }
            return maxLength
        }
}
