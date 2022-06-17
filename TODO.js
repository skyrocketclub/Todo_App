function nameget(line) {
    var name ;
    const myArray = line.split("#");
    name = myArray[0]
    console.log(name)
    return name
}

function passget(line) {
    var pass;
    const myArray = line.split("#");
    pass = myArray[1]
    console.log(pass)
    return pass
}
