//
//  LeetCode344.swift
//  LeetCodeDemos
//
//  Created by maying on 2020/1/8.
//  Copyright © 2020 reborn. All rights reserved.
//

import UIKit

//编写一个函数，其作用是将输入的字符串反转过来。输入字符串以字符数组 char[] 的形式给出。
//
//不要给另外的数组分配额外的空间，你必须原地修改输入数组、使用 O(1) 的额外空间解决这一问题。
//
//你可以假设数组中的所有字符都是 ASCII 码表中的可打印字符。
//
//
//
//示例 1：
//
//输入：["h","e","l","l","o"]
//输出：["o","l","l","e","h"]

class LeetCode344: NSObject {
    
    func getFinalResult(_ s : inout [String]) {
        return Solution344().reverseString2(&s)
    }
}

class Solution344 {
    
    /// 方法1：暴力方法，先判断数组个数为奇偶，首尾两两交换位置
    func reverseString1(_ s: inout [String]){

        if s.count%2 == 0 {
            var i = 0
            var j = s.count - 1
            while i >= 0 && j >= 0 && i <= s.count/2 - 1 {
                s.swapAt(i, j)

                i += 1
                j -= 1
            }

        } else {

            var i = 0
            var j = s.count - 1
            while i >= 0 && j >= 0 && i < (s.count - 1)/2 {
                s.swapAt(i, j)

                i += 1
                j -= 1
            }
        }
    }

    /// 方法2：优化后，首尾两两交换位置，其实就是边界条件的优化(什么时候停止交换)
    func reverseString2(_ s: inout [String]) {
            var i = 0
            var j = s.count-1
            while i < j {
                s.swapAt(i, j)
                i += 1
                j -= 1
            }
        }
}
