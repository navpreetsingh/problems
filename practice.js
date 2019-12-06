var x = {
    a: 1
}

var y = new Object(x);

y = ((b) => {
    return y.a
})()

console.log(y)
x.a = 2

console.log(x.a)