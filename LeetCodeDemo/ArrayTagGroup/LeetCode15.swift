//
//  LeetCode15.swift
//  LeetCodeDemo
//
//  Created by reborn on 2019/10/22.
//  Copyright © 2019 reborn. All rights reserved.
//

import UIKit

/// 三数之和
/// 给定一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？找出所有满足条件且不重复的三元组。

/// 例如, 给定数组 nums = [-1, 0, 1, 2, -1, -4]，
///满足要求的三元组集合为：
///[
///  [-1, 0, 1],
///  [-1, -1, 2]
///]

class LeetCode15: NSObject {
    
    func getFinalResult(targets:[Int]) -> [[Int]] {
        
//        let result =  Solution15_1().threeSum(targets)
        let result = Solution15_2().threeSum(targets)
        
        return result
    }
}

class Solution15_1 {
    func threeSum(_ nums: [Int]) -> [[Int]] {
     guard nums.count > 2 else {
         return []
     }

     var results = [[Int]]()
     let sortedNums = nums.sorted()

    for i in 0..<sortedNums.count-1 {
        if i > 0 && sortedNums[i] == sortedNums[i-1] {
           continue
       }
        let target = 0 - sortedNums[i]
        var low = i + 1
        var high = nums.count - 1

        while low < high {
            let sum = sortedNums[low] + sortedNums[high]
           if sum == target {
                let result = [sortedNums[i], sortedNums[low], sortedNums[high]]
               results.append(result)

            while (low < high && sortedNums[low] == sortedNums[low+1]) {
                low += 1
             }
            while (low < high && sortedNums[high] == sortedNums[high-1]) {
                 high -= 1
            }
               low += 1
               high -= 1
            } else if sum < target {
               low += 1
           } else {
              high -= 1
           }
        }
    }

    return results
}
}

class Solution15_2 {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        
        let sortNum = nums.sorted()
        var results = [[Int]]()
        
        for (index, value) in sortNum.enumerated() {
            
            if index - 1 >= 0, index - 1 < sortNum.count, sortNum[index - 1] == value {
                continue
            }
            
            var low = index + 1
            var high = sortNum.count - 1
            
            while low < high {
                
                let target = 0 - value;
                let sum = sortNum[low] + sortNum[high]
                
                if sum < target {
                    while low < high, sortNum[low] == sortNum[low + 1] {
                        low = low + 1
                    }
                    low = low + 1
                    
                } else if sum > target {
                    
                    while low < high, sortNum[high] == sortNum[high - 1] {
                        high = high - 1
                    }
                    high = high - 1
                    
                } else {
                    results.append([value, sortNum[low], sortNum[high]])
                    
                    while low < high, sortNum[low] == sortNum[low + 1] {
                        low = low + 1
                    }
                    low = low + 1

                    while low < high, sortNum[high] == sortNum[high - 1] {
                        high = high - 1
                    }
                    high = high - 1
                }
            }
        }
        return results
    }
}

