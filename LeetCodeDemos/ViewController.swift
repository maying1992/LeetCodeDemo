//
//  ViewController.swift
//  LeetCodeDemos
//
//  Created by maying on 2019/12/23.
//  Copyright © 2019 reborn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
//        leetCode15Test()
//        leetCode16Test()
//        leetCode344Test()
//        leetCode3Test()
        leetCode1297Test()
//
//        testSort(sortObject: BubbleSort())
//        testSort(sortObject: SelectionSort())
//        testSort(sortObject: InsertionSort())
//        testSort(sortObject: ShellSort())
        
//        var list: Array<Int> = [2,3,5,7,4,8,6,10,1,9]
//        QuikSort1().quickSort(items: &list, low: 0, high: list.count - 1)
//        print("快速排序1结果(递归)",list)
        
//        testSort(sortObject: QuikSort2())
//        testSort(sortObject: HeapSort())
//        testSort(sortObject: MergingSort())
//        testSort(sortObject: RadixSort())
        

        
        
        
        
    }
}

func leetCode15Test() {
    
    let list = [-1, 0, 1, 2, -1, -4]
    let result:[[Int]] = LeetCode15().getFinalResult(targets: list)
    print("最终结果集",result)
}

func leetCode16Test() {
    
    let list = [-1, 2, 1, -4]
    let target = 1
    
    let result: Int = LeetCode16().getFinalResult(nums: list, target: target)
    print("最接近的三个数之和", result)
}

func leetCode344Test() {
    
    let a: Character = "a"
    let b: Character = "b"
    let c: Character = "c"
    let d: Character = "d"

//    var list = [a, b, c]
    var list = [a, b, c, d]
    
    print("反转前数据", list)
    LeetCode344().getFinalResult(&list)
    print("反转字符串结果", list)
}

func leetCode3Test() {
    let list = "abcabcbb"
    print("操作前数据", list)
    let length = LeetCode3().getFinalResult(list);
    print("无重复字符的最长子串的长度", length)
}

func leetCode1297Test() {
    let list = "aababcaab"

    print("操作前数据", list)
    let count = LeetCode1297().getFinalResult(list, 2, 3, 4)

    print("出现次数最大的任意子串的出现次数", count)
}

func testSort(sortObject: SorType) {
    let list: Array<Int> = [2,3,5,7,4,8,6,10,1,9]

    let sortList = sortObject.sort(items: list)
    print(sortList)
    print("\n")
}
