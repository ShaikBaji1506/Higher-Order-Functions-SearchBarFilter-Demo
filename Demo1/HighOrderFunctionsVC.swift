//
//  HighOrderFunctionsVC.swift
//  Demo1
//
//  Created by Shaik Baji on 07/11/19.
//  Copyright © 2019 smartitventures.com. All rights reserved.
//

import UIKit


struct myStructData{
    
    var price:Int
    var item:String
    var list:Int
}


class HighOrderFunctionsVC: UIViewController
{
  
    var myStructArr = [myStructData]()
    
  override func viewDidLoad()
    {
        super.viewDidLoad()
        
        mapConcept()
        filterConcept()
        
        
        myStructArr = [myStructData(price: 1, item: "Mouse", list: 1),myStructData(price: 10, item: "Keyboard", list: 2),myStructData(price: 30, item: "Wire", list: 3),myStructData(price:90, item: "Pen", list: 4)]
        
        reduceConcept()
        
        sortConcept()
        flatMapConcept()
        chainingConcept()
    }
    
    
    //MARK:- 1.Map
    
    func mapConcept(){
        
        var oneArray = [1,2,3,4,5]
        var twoArray :[Int] = []
        
        for items in oneArray {   //old way to write append an array using for_loop
            twoArray.append(items * 2)
        }
        print("Second Array = \(twoArray)")
        
        let thirdArray = oneArray.map {$0 * 2} // one HOF to write code with map function
        
        let fourthArray = oneArray.map { (value:Int) -> Int in // one HOF to write code with map function
            return value * 2
        }
        
        let fifthArray = oneArray.map { (valueT:Int)  in // one HOF to write code with map function
            return valueT * 2
        }
        
        let sixthArray = oneArray.map { (value6)  in // one HOF to write code with map function
            return value6 * 2
        }
        
        
        print("Third Array = \(thirdArray)")
        print("Fourth Array = \(fourthArray)")
        print("Fifth Array = \(fifthArray)")
        print("Sixth Array = \(sixthArray)")
        
    }
    
    //MARK:- 2.Filter
    
    func filterConcept(){
        
        var oneFilter = [1,2,3,4,5,6,7,8,8,9,10,11,12,13,14,15]
        var twoFilter:[Int] = []
        
        for items in oneFilter{ //old way to write append an array using for_loop
            if items % 2 == 0{
                twoFilter.append(items)
            }
         }
        print("secondFilter==\(twoFilter)")
        
        
        var thirdFilter = oneFilter.filter { (value:Int) -> Bool in // one HOF to write code with filter
            return value % 2 == 0
        }
        
        print("thirdFilter==\(thirdFilter)")
        
        var fourthFilter = oneFilter.filter { (value4) -> Bool in // one HOF to write code with filter
            return value4 % 2 == 0
        }
        
        print("fourFilter==\(fourthFilter)")
        
        
        var fifthFilter = oneFilter.filter { (value5) in // one HOF to write code with filter
            return value5 % 2 == 0
        }
        
        print("fiveFilter==\(fifthFilter)")
        
        
        var sixthFilter = oneFilter.filter{$0 % 2 == 0} // one HOF to write code with filter
        print("sixthFilter == \(sixthFilter)")
       
    }
    
    
    //MARK:- 3.Reduce
    
    func reduceConcept(){
        
        var oneArray = [1,2,3,4,5,6,7,8,9,10]
        var secondArray:[Int] = []
        var sum:Int = 0
        
        for items in oneArray{
            sum += items
            secondArray.append(sum)
        }
        print("My Reduce Array == \(secondArray)")
        
        print("My Total number == \(sum)")
        
        for items2 in oneArray
        {
            print("My SUM == \(sum)")
            sum += items2
        }
        
        print("My Total number == \(sum)")
        
        let secondReduce = oneArray.reduce(0, {$0 + $1}) //Defines the first index and combo of other two indexes
        
         print("My Total number 2 == \(secondReduce)")
        
        let thirdReduce = oneArray.reduce(0, +) //Defines the first index and  + indicates the combo of other two indexes
        
        print("My Total number 3 == \(thirdReduce)")
        
        
        let fourthReduce = ["one","two"].reduce("", {$0 + $1})
        
        
        print("My fourthReduce  == \(fourthReduce)")
        
        let fifthReduce =  myStructArr.reduce(0, {$0 + $1.price})
        
        print("My sixthReduce == \(fifthReduce)")
        
        
        
    }
    
    //MARK:- 4.Sort
    
    func sortConcept()
    {
        var myArray = [1,2,3,4,5,6]
        let newSort = myArray.sorted{$0 > $1}  //returns [6,5,4,3,2,1]
        print("SORTED == \(newSort)")
       
    }
    
    //MARK:- 5.FlatMap
    
    func flatMapConcept(){
        
        var myArray = [[11,12,13],[14,15,16,17],[18,19]]
        var newArray:[Int] = []
        
        for items in myArray{
            newArray += items
        }
         print("Flat_Map == \(newArray)")
        
        let thirdArray = myArray.flatMap{$0}
        
         print("Flat_Map2 == \(thirdArray)")
        
        let people = ["SHAIK",9,"BAJI","iOS",nil] as [Any?]
        
         let people2 = ["ios","88","baji",nil] as [Any?]
        
        let name = people.flatMap{$0}
        
         let name2 = people2.flatMap{$0}
        
         print("Flat_Map3 == \(name)")
        
         print("Flat_Map4 == \(name2)")
        
    }

    
    //MARK:- 6 Chaining
    
    func chainingConcept() {
        
        let myArray = [[11,12,13,nil]]
        let chainArray = myArray.flatMap{$0}
        print("Chaining == \(chainArray)")
        
        let myArray2 = [["ios","abcd",nil]]
        let chainArray2 = myArray2.flatMap{$0}
        print("Chaining == \(chainArray2)")
        
        
        let myArray3 =  [[11,12,13,14],[15,16]]
        let chainConcept = myArray3.flatMap{$0}.filter{$0 % 2 == 0}.map{$0 * $0}
        
        print("Chaining_Concept == \(chainConcept)")
        
        
    }
}
