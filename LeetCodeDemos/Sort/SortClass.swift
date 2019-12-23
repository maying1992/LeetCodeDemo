//
//  SortClass.swift
//  LeetCodeDemo
//
//  Created by reborn on 2019/12/16.
//  Copyright © 2019 reborn. All rights reserved.
//

import UIKit

/// 1.冒泡排序（Bubble Sort）排序
///方法是在每一轮排序过程中，依次比较相邻元素的大小，如果顺序不满足排序的要求，则交换这两个元素。这样每一轮排序结束后，都能将最大的元素的元素放到最后。
/// 一个 包含 n 个元素的数组在最坏的情况下，需要进行 n-1 次排序过程，方能使数组中的元素变得有序。

///特性
///1.稳定性 ：是稳定算法，因为排序过程中相邻会依次比较，不会打乱相同元素的相对位置。
///2.空间复杂度：整个排序过程是在原数组上进行排序的，所以是 O(1)。
///3.时间复杂度：排序算法包含双层嵌套循环，故为 O（n²）。

class BubbleSort: SorType {
    func sort(items: Array<Int>) -> Array<Int> {
        guard items.count > 1 else {

            return items
        }
             
        var list = items
        
        for i in 0 ..< list.count - 1 {
            var exchanged = false
            for j in 0 ..< list.count - 1 - i {
                if list[j] > list[j+1] {
                    list.swapAt(j, j+1)
                    exchanged = true
                }
            }

            if !exchanged {
                break
            }
        }

        return list
    }
}

/// 2.选择排序
///首先在未排序的序列中找到最小元素，放到起始位置，然后再从剩余未排序的序列中找最小元素放到已排序序列的末尾

/// 特性
/// 和冒泡排序相比，时间复杂度相同，都是O（n²），但是选择排序算法两数交换的次数明显要少，通常情况下选择排序更快
///

class SelectionSort: SorType {

    func sort(items: Array<Int>) -> Array<Int> {
        
        var list = items
        
        for i in 0..<list.count {
            var j = i + 1
            var minValue = list[i]
            var minIndex = i
            
            // 寻找无序部分中的最小值
            while j < list.count {
                if minValue > list[j] {
                    minValue = list[j]
                    minIndex = j
                }
                j = j + 1
            }
            // 与无序表中的第一个值交换，让其成为有序表中的最后一个值
            if minIndex != i {
                let temp = list[i]
                list[i] = list[minIndex]
                list[minIndex] = temp
            }
        }
        return list
    }
}

/// 3.插入排序
///插入排序算是比较好理解的排序方式，插入排序也是将要排序的数列分为两部分，前半部分是已经排好序的，后半部分则是无序的。插入排序中的插入是指“取出无序数列中第一个值，插入到有序数列中相应的位置”,这个插入的过程其实就是一个比较交换的过程，如果要插入的值比前面的值要小，就要交换，直到不能交换为止!!!

///代码的核心思想就是通过循序不断从无序数列中取出值，然后循环遍历有序数列寻找合适的插入点。在下方中有两个循环嵌套，外层循环负责不断从无序序列中取值，然后通过内层循环将外层循环取出的值插入到有序数列中相应的位置

///稳定性 ：是稳定算法，因为排序过程中相邻会依次比较，不会打乱相同元素的相对位置。
///空间复杂度：整个排序过程是在原数组上进行排序的，所以是 O(1)。
///时间复杂度：排序算法包含双层嵌套循环，故为O（n²）

class InsertionSort: SorType {
    func sort(items: Array<Int>) -> Array<Int> {
                                                 
        var list = items
        for i in 1..<list.count { // 循环无序数列
            var j = i
            
            while j > 0 {
                if list[j] < list[j - 1] { // 交换
                    let temp = list[j]
                    list[j] = list[j - 1]
                    list[j - 1] = temp
                    
                    j = j - 1 // 交换后 可能还比再往前一个小，继续交换，直到不能交换位置
                } else { // 不交换
                    break
                }
            }
            
        }
        return list
    }
}

/// 4.希尔排序
/// 其实希尔排序是插入排序的升级版， 希尔排序根据其排序的特点又叫做缩小增量排序。希尔排序的大体步骤就是先将无序序列按照一定的步长（增量）分为几组，分别将这几组中的数据通过插入排序的方式将其进行排序。然后缩小步长（增量）分组，然后将组内的数据再次进行排序。直到增量为1位置。经过上述这些步骤，我们的序列就是有序的了。其实上述的插入排序就是增量为1的希尔排序

///根据上述，然后再结合着插入排序的代码，给出希尔排序相应的代码并不困难。就是将插入排序的步长从1修改成我们每次生成的步长即可，每次增量排序完毕后，我们要对增量按照相应的规则进行缩小即可。下方就是希尔排序的代码实现。

///在下方代码中，最外层循环负责增量的生成和缩减，里边的双重循环就是我们之前我们插入排序的代码，不步长要使用我们希尔排序生成的step，
/// 时间复杂度----O(n^(3/2))

class ShellSort: SorType {
    func sort(items: Array<Int>) -> Array<Int> {
        var list = items
        var step: Int = list.count / 2

        while step > 0 {

            for i in 0..<list.count {
                var j = i + step
                while j >= step && j < list.count {
                    if list[j] < list[j - step] {
                        let temp = list[j]
                        list[j] = list[j - step]
                        list[j - step] = temp

                        j = j - step
                        
                    } else {
                        break
                    }
                }
            }
            step = step / 2 //缩小步长
        }

        return list
    }
}

/// 5.快速排序
///快速排序的基本思想：通过一趟排序将待排记录分隔成独立的两部分，其中一部分记录的关键字均比另一部分的关键字小，则可分别对这两部分记录继续进行排序，以达到整个序列有序。

///算法描述
///快速排序使用分治法来把一个串（list）分为两个子串（sub-lists）。具体算法描述如下：
///1.从数列中挑出一个元素，称为 “基准”（pivot）；
///2重新排序数列，所有元素比基准值小的摆放在基准前面，所有元素比基准值大的摆在基准的后面（相同的数可以到任一边）。在这个分区退出之后，该基准就处于数列的中间位置。这个称为分区（partition）操作；
///3.递归地（recursive）把小于基准值元素的子数列和大于基准值元素的子数列排序。

/// 特性：1、时间复杂度：O(nlogn)  2、空间复杂度：O(logn)  3、非稳定排序  4、原地排序

/// 递归
class QuikSort1 {

    func partition(items: inout [Int], low:Int, high:Int) -> Int {
        
        let root = items[high] // 取数组中最后一个元素作为基数
        var index = low        // index从0开始，记录数组中大于基数的元素位置
        
        for i in low...high {
            // 当items[i]<基数 且i != index时，交换数组i和index的元素，并index+=1，继续向下记录
            if items[i] < root {

                if i != index {
                    items.swapAt(i, index)
                }
                index = index + 1
            }
        }
        //循环结束后，index记录了此时数组中大于基数的元素，若index不是数组中的最后一个元素，则交换元素的位置
        if high != index {
            items.swapAt(high, index)
        }
        
        //第一次分割结束，返回此时数组分割元素的位置，即index左边的元素都小于root,index右边的元素都大于root
        return index
    }
    
    func quickSort(items: inout [Int], low: Int, high: Int) -> Void {
        
        if low > high {
            return
        }
        
        let mid = partition(items: &items, low: low, high: high)
        quickSort(items: &items, low: low, high: mid - 1)
        quickSort(items: &items, low: mid + 1, high: high)
    }
}

class QuikSort2: SorType {
    
    func sort(items: Array<Int>) -> Array<Int> {
        if items.count <= 1 {
            return items
        }
        
        var left:[Int] = []
        var right:[Int] = []
        let pivot: Int = items[items.count - 1] // 基准
        
        for index in 0..<items.count - 1 {
            if items[index] < pivot {
                left.append(items[index])
            } else {
                right.append(items[index])
            }
        }
        var result = sort(items: left)
        result.append(pivot)
        
        let rightResult = sort(items: right)
        result.append(contentsOf: rightResult)
        
        return result
    }
}

/// 堆排序
///算法思想:堆排序利用了最大堆（或小根堆）堆顶记录的关键字最大（或最小）这一特征，使得在当前无序区中选取最大（或最小）关键字的记录变得简单。
///给你一个无序的数组，我们需要把这个数组构建成二叉堆，然后在通过堆顶逐个删除的方式来实现堆排序。其实，也不算是删除了，相当于是把堆顶的元素与堆尾部在交换位置，然后在通过下沉的方式，把二叉树恢复成二叉堆。

///
/// 堆排序的时间复杂度是O (nlogn), 空间复杂度是 O(1)
/// 像快速排序，归并排序的时间复杂度也是 O(nlogn),如何选择： 这里说明一下：快速排序是平均复杂O (nlogn)，实际上，快速排序的最坏时间复杂度是O(n^2。)，而像归并排序，堆排序，都稳定在O(nlogn)
class HeapSort :SorType {
    func sort(items: Array<Int>) -> Array<Int> {
        var list = items
        var endIndex = items.count - 1
        
        // 创建大顶堆，其实就是将list转成大顶堆层次的遍历结果
        heapCreate(items: &list)
        
        while endIndex >= 0 {
            //将大顶堆的顶点（最大的那个值）与大顶堆的最后一个值进行交换
            print("将list[0]:\(list[0])与list[\(endIndex)]:\(list[endIndex])交换")
            let temp = list[0]
            list[0] = list[endIndex]
            list[endIndex] = temp
            endIndex -= 1   //缩小大顶堆的范围
            
            //对交换后的大顶堆进行调整，使其重新成为大顶堆
            heapAdjast(items: &list, startIndex: 0,endIndex: endIndex + 1)
            print("调整后:\(list)\n")
        }
        
        return list
    }
    
    /// 构建大顶堆的层次遍历序列（f(i) > f(2i), f(i) > f(2i+1) i > 0）
    ///
    /// - parameter items:  构建大顶堆的序列
    func heapCreate(items: inout Array<Int>) {
        var i = items.count
        while i > 0 {
            heapAdjast(items: &items, startIndex: i - 1, endIndex: items.count)
            i -= 1
        }
    }
    
    /// 对大顶堆的局部进行调整，使其该节点的所有父类符合大顶堆的特点
    ///
    /// - parameter items:    list
    /// - parameter endIndex: 当前要调整的节点
    func heapAdjast(items: inout Array<Int>, startIndex: Int, endIndex: Int) {
        let temp = items[startIndex]
        var fatherIndex = startIndex + 1    //父节点下标
        var maxChildIndex = 2 * fatherIndex //左孩子下标
        
        while maxChildIndex <= endIndex {
            //比较左右孩子并找出比较大的下标
            if maxChildIndex < endIndex && items[maxChildIndex-1] < items[maxChildIndex] {
                maxChildIndex = maxChildIndex + 1
            }
            
            //如果较大的那个子节点比根节点大，就将该节点的值赋给父节点
            if temp < items[maxChildIndex-1] {
                items[fatherIndex-1] = items[maxChildIndex-1]
            } else {
                break
            }
            fatherIndex = maxChildIndex
            maxChildIndex = 2 * fatherIndex
        }
        items[fatherIndex-1] = temp
    }
}

// 归并排序
class MergingSort : SorType {
    func sort(items: Array<Int>) -> Array<Int> {
        //将数组中的每一个元素放入一个数组中
        var tempArray: Array<Array<Int>> = []
        for item in items {
            var subArray: Array<Int> = []
            subArray.append(item)
            tempArray.append(subArray)
        }
        
        //对这个数组中的数组进行合并，直到合并完毕为止
        while tempArray.count != 1 {
            print(tempArray)
            var i = 0
            while i < tempArray.count - 1 {
                print("将\(tempArray[i])与\(tempArray[i+1])合并")
                tempArray[i] = mergeArray(firstList: tempArray[i], secondList: tempArray[i + 1])
                print("合并结果为：\(tempArray[i])\n")
                tempArray.remove(at: i + 1)
                i = i + 1
            }
        }

        return tempArray.first!
    }
    
    
    /// 归并排序中的“并”--合并：将两个有序数组进行合并
    ///
    /// - parameter firstList:  第一个有序数组
    /// - parameter secondList: 第二个有序数组
    ///
    /// - returns: 返回排序好的数组
    func mergeArray(firstList: Array<Int>, secondList: Array<Int>) -> Array<Int> {
        var resultList: Array<Int> = []
        var firstIndex = 0
        var secondIndex = 0
        
        while firstIndex < firstList.count && secondIndex < secondList.count {
            if firstList[firstIndex] < secondList[secondIndex] {
                resultList.append(firstList[firstIndex])
                firstIndex += 1
            } else {
                resultList.append(secondList[secondIndex])
                secondIndex += 1
            }
        }
        
        while firstIndex < firstList.count {
            resultList.append(firstList[firstIndex])
            firstIndex += 1
        }
        
        while secondIndex < secondList.count {
            resultList.append(secondList[secondIndex])
            secondIndex += 1
        }
        
        return resultList
    }
}
