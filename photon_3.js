function solution(R,C,M){
    //
    //write your logic here and print the desired output
    //
    // console.log("R", R)
    // console.log("C", C)
    // console.log("M", M)
    var x = 0,
    y = 0,
    x_direction = 0,
    y_direction = 0,
    r = R,
    c = C,
    output = [],
    x_index = 0,
    y_index = 0,
    boolean = true;

    while(x < r && y < c){
        var index = y+1,
        arr = []
        if(r >= x)
        {
            if(x_direction == 0){
                arr = M[y_index].slice(x,r)
                x_index = r - 1
                x_direction = 1
                r -= 1
            }else{
                arr = M[y_index].slice(x,r)
                arr = arr.reverse()
                x_index = x
                x = x+1                  
                x_direction = 0 
            }
            // console.log("Arr X: ", arr)
            output = output.concat(arr)
            // console.log("After X: ", output)
        }
        // console.log(index, c, y_direction, x_index)
        while(index < c){
            var m_index = y_direction == 0 ? index : c-index
            // console.log(m_index, x_index)
            output.push(M[m_index][x_index])
            index += 1                 
        }
        // console.log("After Y: ", output)

        if(y_direction == 0){
            y_direction = 1
            c -= 1
            y_index = c
        }
        else{
            y_direction = 0
            y += 1
            y_index = y 
            x_index += 1
        }
    }
    return output
}


arrays = [
    [4,4,[[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]]],
    [3,2,[[1,2,3],[4,5,6]]],
    [2,4,[[1,2],[3,4],[5,6],[7,8]]],
    [5,1,[[1,2,3,4,5]]],
    [1,6,[[1],[2],[3],[4],[5],[6]]],
    [0,0,[]],
    [-1,-2,[]]

]

arrays.forEach((v,i) => {
    console.log("Input: ", v)
    var result = solution(v[0],v[1],v[2])
    console.log("Result: ", result, "\n\n");
})





// Following is the part of the program and is provided as an assistance to read the input.

// var cgreadline = require('readline');
// var cgrl = cgreadline.createInterface(process.stdin, process.stdout);
// lines =[]
// cgrl.on('line', function(line) {
//     lines.push(line)
// }).on('close',function(){
    
//     var RC = lines[0].split(" ");
//     var R = parseInt(RC[0]);
//     var C = parseInt(RC[1]);
//     var M = [];
//     for (var i=0;i<R;i++){
//         var MString = lines[1+i].split(" ");
//         M[i]=[]
//         for(var j=0;j<C;j++)
//            M[i][j] = parseInt(MString[j]) 
//     }
//     solution(R,C,M)
// });