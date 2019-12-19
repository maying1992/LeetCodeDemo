//
//  LeetCode16.swift
//  LeetCodeDemo
//
//  Created by reborn on 2019/10/23.
//  Copyright © 2019 reborn. All rights reserved.
//

import UIKit

/// 给定一个包括 n 个整数的数组 nums 和 一个目标值 target。找出 nums 中的三个整数，使得它们的和与 target 最接近。返回这三个数的和。假定每组输入只存在唯一答案。

/// 例如，给定数组 nums = [-1，2，1，-4], 和 target = 1. 与 target 最接近的三个数的和为 2. (-1 + 2 + 1 = 2).

class LeetCode16: NSObject {

    func getFinalResult(nums:[Int], target:Int) -> Int {
            
//        let result = Solution16_1().threeSumClosest(nums, target)
        let result = Solution16_2().threeSumClosest(nums, target)

            return result
        }
}

class Solution16_1 {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
           
        guard nums.count > 2 else {
            return -1
        }
                
        var ans = nums[0] + nums[1] + nums[2]
        
        let sortedNums = nums.sorted()
        
        for i in 0..<sortedNums.count - 1 {
            
            var low = i + 1
            var high = sortedNums.count - 1
            
            while low < high {
                
                let sum = sortedNums[i] + sortedNums[low] + sortedNums[high]
                
                if abs(target - sum)  < abs(target - ans){
                    ans = sum
                }
                
                if sum > target {
                    
                    high = high - 1
                   
                } else if sum < target {
                   
                    low = low + 1
                   
                } else {
                    return ans
                }
            }
        }
        return ans
    }
}


class Solution16_2 {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
           
        guard nums.count > 2 else {
            return -1
        }
                
        var ans = nums[0] + nums[1] + nums[2]
        
        let sortedNums = nums.sorted()
        
        for i in 0..<sortedNums.count - 2 {
            
            var low = i + 1
            var high = sortedNums.count - 1
            
            while low != high {
                
                let sum = sortedNums[i] + sortedNums[low] + sortedNums[high]
                
                if abs(target - sum)  < abs(target - ans){
                    ans = sum
                }
                
                if sum > target {
                    
                    high = high - 1
                   
                } else if sum < target {
                   
                    low = low + 1
                   
                } else {
                    return ans
                }
            }
        }
        return ans
    }
}
