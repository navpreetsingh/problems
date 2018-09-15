var n = 11
function exper() {
    n = n*n
    n = n+n
    return n
}
function sample() {
    if(n==0 && exper())
        n = n+2
    return n
}
console.log(sample())