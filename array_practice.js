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
console.log(pop_array);