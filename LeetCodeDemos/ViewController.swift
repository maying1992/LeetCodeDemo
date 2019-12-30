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
        testSort(sortObject: RadixSort())
        
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

func testSort(sortObject: SorType) {
    let list: Array<Int> = [2,3,5,7,4,8,6,10,1,9]

    let sortList = sortObject.sort(items: list)
    print(sortList)
    print("\n")
}
