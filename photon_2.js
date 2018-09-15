function solution(n){
    //
    // write your logic here and print the desired output
    //
    if(n > 0){
        var index = 1
        while(index <= n){
            console.log("*".repeat(index) + "#".repeat(n - index))
            index += 1
        }
    }
    
}

// Following is the part of the program and is provided as an assistance to read the input.


var cgreadline = require('readline');
var cgrl = cgreadline.createInterface(process.stdin, process.stdout);
lines =[]
cgrl.on('line', function(line) {
    lines.push(line)
}).on('close',function(){
    var N = parseInt(lines[0]);
    solution(N);
});
