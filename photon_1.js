function padding(number, width) {
    var string = String(number)
    while(string.length < width)
    string = "0" + string
    return string
}

function vehicles(bike, cycle, car) {
    console.log(padding(bike, 3) + " bike ")
    console.log(padding(cycle, 3) + " bike ")
    console.log(padding(car, 3) + " bike ")
}

vehicles(10,5,7)



var a = (1,5-1*6/2)*2
console.log(a)

var p = 1 +2 ==3 && 10 *10 > 50
console.log(p)

var samp1 = 10,
samp2 = 10,
samp3 = new Number('10')
console.log(samp1 === samp2)
console.log(samp1 === samp3)


function Ani() {
    this.eveg = true
    this.eme = false
}

function H() {}
H.prototype = new Ani()


function C() {
    this.eme = true
}
C.prototype = new Ani()

var rab = new H(),
be = new C()

console.log(rab.eme)
console.log(be.eme)