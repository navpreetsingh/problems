// Same number can also add as 
function numberOfPairs(a, k) {
    let hash = {},
    len,
    pair_hash = [],
    distinct_array;
    a.forEach((v,i) => {
        // console.log(v)
        // consoole.log(hash[v])
        if(!hash[v])
            hash[v] = 0
        hash[v]+=1
    });
    distinct_array = Object.keys(hash).map(v => parseInt(v)).sort();
    if(k%2 == 0 ){
        if(hash[k/2] > 1)
            pair_hash.push([k/2,k/2])
    }
    // console.log(distinct_array);
    len = distinct_array.length;
    distinct_array.forEach((v,i) => {
        let slice_array = distinct_array.slice(i+1, len)
        slice_array.forEach((sv, si) => {
            // console.log("V:", v, " SV: ", sv, "Total: ", v+sv);
            if(v+sv == k)
                pair_hash.push([v,sv])
        })
    })
    return pair_hash.length
}


array = [[5,2,8,1,7,9,6,7,3,3,4,4,4],8]
result = numberOfPairs(array[0], array[1])
console.log(result);

