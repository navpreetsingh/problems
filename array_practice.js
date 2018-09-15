arr = Array.from({length:9-3+1}, (v,i) => {
    // if((i+3)%2 == 1)
    // {
        return i+3 + (i);
    // }else
    // {
    //     return null;
    // }
}).filter(Number)
console.log("Creating New Array with a start, end & step:", arr, "\n")

arr1 = [1,2,3]
arr2 = [4,5,6]
concat_array = arr1.concat(arr2)
console.log("Array_1: ", arr1, "\nArray_2: ", arr2, "\nConcat Array: ", concat_array, "\n")

// Every Function
every_passed = arr1.every(v =>  v>0 )
console.log("Passed Every: ", every_passed, "\n")

// Loop array
arr1.forEach((v,i) => {
    console.log("Value: ", v, " at index: ", i);
})

console.log("\n")

// Index of
index = arr1.indexOf(2)
console.log("Index of: ", 2, " in array: ", arr1, "is ", index);

console.log("\n")
// Join String
join = arr1.join("-")
console.log("Joining array: ", arr1, "in string ", join);


console.log("\n")
// Last Index
arr3 = [1,2,3,4,5,2,3,4]
last_index = arr3.lastIndexOf(2)
console.log("Last Index of: ", 2, " in array: ", arr3, "is ", last_index);

console.log("\n")
// map array
power_array = arr1.map(v => v*v)
console.log("Power array of: ", arr1, "is ", power_array);

console.log("\n")
// Compact array
arr4 = [ 1, null, 2, 3, null, 'Nan', undefined, '' ]
compact_array = arr4.filter(x => {if(x!='Nan') return x;})
console.log("Compact array of: ", arr4, "is ", compact_array);

console.log("\n")
// Pop array
console.log("Pop array of: ", arr1, "is ")
arr1.pop()
console.log(arr1);

console.log("\n")
// Push array
console.log("Push array of: ", arr1, "is ")
arr1.push(3,4)
console.log(arr1);

console.log("\n")
// Reduce array
console.log("Reduce subtract array left to right of: ", arr1, "is ")
reduce_array = arr1.reduce((a,b) => a-b)
console.log(reduce_array);

console.log("\n")
// Reduce Right array
console.log("Reduce subtract array right to left of: ", arr1, "is ")
reduce_right_array = arr1.reduceRight((a,b) => a-b)
console.log(reduce_right_array);

console.log("\n")
// Reverse array
console.log("Reverse array of: ", arr1, "is ")
arr1.reverse()
console.log(arr1);

arr1.reverse()
console.log("\n")
// Shift array
console.log("Shift array of: ", arr1, "is ")
arr1.shift()
console.log(arr1);

console.log("\n")
// Unshift array
console.log("Unhift array of: ", arr1, "is ")
arr1.unshift(1)
console.log(arr1);

console.log("\n")
// Slice array
console.log("Slice array of: ", arr1, "is ")
slice_array = arr1.slice(2,4)
console.log(slice_array);

console.log("Duplicate or Clone array of: ", arr1, "is ")
clone_array = arr1.slice()
console.log(clone_array);
clone_array.push(5)
console.log("Adding 5 in the array", clone_array)
console.log("Original Array: ", arr1)

console.log("\n")
// Some array
console.log("Some Function Find 3 in array of: ", arr1, "is ")
some_array = arr1.some((x) => x==3)
console.log(some_array);

console.log("Some Function Find 5 in array of: ", arr1, "is ")
some_array = arr1.some((x) => x==5)
console.log(some_array);


// console.log("\n")
// // Finding Source array
// console.log("Source of array: ", arr1, "is ")
// source_array = arr1.toSource()
// console.log(source_array);

console.log("\n")
// Sort array
arr5 = [3,2,5,1,6,8,7,4]
console.log("Sort array of: ", arr5, "is ")
arr5.sort()
console.log(arr5);


console.log("\n")
// Splice array
console.log("Splice array of: ", arr1, "by adding 5,6,7 in place of 3,4 ")
arr1.splice(arr1.length/2,2, 5,6,7)
console.log(arr1);
arr1 = [1,2,3,4]

console.log("\n")
// String array
console.log("Convert array: ", arr1, " to string ")
string_array = arr1.toString()
console.log(string_array);


console.log("\n")
// Find array
console.log("Finding 3 in array: ", arr1)
find_array = arr1.find((x) => x==3)
console.log(find_array);

console.log("Finding 5 in array: ", arr1)
find_array = arr1.find((x) => x==5)
console.log(find_array);

console.log("\n")
// Entries array
console.log("Entries in array: ", arr1)
entries = arr1.entries()
entries_from = Array.from(arr1.entries())
console.log([...entries]);
console.log("Entries From: ", entries_from);

console.log("\nFor Loop with let: ")
// For Loop
var nums = [1001,1002,1003,1004] 
for(let j in nums) { 
   console.log(nums[j]) 
}

console.log(x)
var x = 10

console.log(y)
var y = 10


