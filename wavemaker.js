function countDuplicates(numbers) {
    // console.log(numbers)
    let hash = {},
    count = 0;
    numbers.forEach((v,i) => {
        // console.log(v)
        // consoole.log(hash[v])
        if(!hash[v])
            hash[v] = 0
        hash[v]+=1
    });
    Object.keys(hash).forEach((key) => {
        if(hash[key] > 1)
            count += 1;
    })
    // console.log(hash);
    return count;
    // console.log(count);
}

array = [1,2,3,4,5,6,7,3,2,1]
var result = countDuplicates(array)
console.log(result);
 