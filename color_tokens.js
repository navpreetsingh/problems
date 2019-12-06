
'use strict';
var hasSameChar = (str1, str2) => {
    let list1 = {}, list2 = {}
    str1.split("").forEach((v,i) => {
        if(!list1[v]){
            list1[v] = 0
        }
        list1[v] += 1
    }) 
    str2.split("").forEach((v,i) => {
        if(!list2[v]){
            list2[v] = 0
        }
        list2[v] += 1
    })  
    console.log("\nList1: ", list1)
    console.log("List2: ", list2)
    // console.log("List1 keys: ", Object.keys(list1).join(""))
    // console.log("List2 keys: ", Object.keys(list2).join(""))
    let uniqueStr1 = Object.keys(list1),
    uniqueStr2 = Object.keys(list2)
    if(uniqueStr1.length == uniqueStr2.length){
        let boolean = true
        uniqueStr1.map((v) => {
            if(!list2[v]){
                boolean = false
                return boolean
            }
        })
        return boolean
    }else{
        return false
    }
}

console.log("Result: ", hasSameChar('ab','abba'))
console.log("\nResult: ", hasSameChar('ab','abbav'))
console.log("\nResult: ", hasSameChar('abd','abbad'))
console.log("\nResult: ", hasSameChar('abvvvv','abbavddd'))
console.log("Result: ", hasSameChar('ab','baba'))
console.log("Result: ", hasSameChar('dlenqpxja','qqeeaaxxxxjjjjxxxxnnnqqqqllllddddd'))
console.log("Result: ", hasSameChar('dlenqpxja','qqeeaaxxpxxjjjjxxxxnnnpqqqqllllddpddd'))
console.log("Result: ", hasSameChar('dlenqpxja','qqeeaaxxrxxjjjjxxxxnnnrqqqqllllddrddd'))
console.log("Result: ", hasSameChar('dlenqpxja','qqeeaaxxpxxjjjjxxxxnzzznnpqqqqllllzzddpddd'))