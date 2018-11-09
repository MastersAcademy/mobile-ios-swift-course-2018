
class Shape {
  var numberOfSides = 0
  let color: Int = 0xFF0000
  
  func simpleDescription() -> String {
    return "A shape with \(numberOfSides) sides."
  }
  
  func colorOfShape() -> String {
    return color.description
  }
}

let example = Shape.init()

var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()

class NamedShape {
  var numberOfSides: Int = 0
  var name: String
  init(name: String) {
    self.name = name
  }
  func simpleDescription() -> String {
    return "A shape with \(numberOfSides) sides."
  }
}

NamedShape(name: "Name")

class Square: NamedShape {
  var sideLength: Double
  init(sideLength: Double, name: String) {
    self.sideLength = sideLength
    super.init(name: name)
    numberOfSides = 4
  }
  func area() -> Double {
    return sideLength * sideLength
  }
  
  override func simpleDescription() -> String {
    return "A square with sides of length \(sideLength)."
  }
}
let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()

class EquilateralTriangle: NamedShape {
  var sideLength: Double = 0.0
  init(sideLength: Double, name: String) {
    self.sideLength = sideLength
    super.init(name: name)
    numberOfSides = 3
  }
  var perimeter: Double {
    get {
      return 3.0 * sideLength
    }
    set (value) {
      sideLength = value / 3.0
    }
  }
  override func simpleDescription() -> String {
    return "An equilateral triangle with sides of length \(sideLength)."
  }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
// print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)

class TriangleAndSquare {
  var triangle: EquilateralTriangle {
    willSet {
      square.sideLength = newValue.sideLength
    }
  }
  var square: Square {
    willSet {
      triangle.sideLength = newValue.sideLength
    }
  }
  
  init(size: Double, name: String) {
    square = Square(sideLength: size, name: name)
    triangle = EquilateralTriangle(sideLength: size, name: name)
  }
  
  init(square: Square, triangle: EquilateralTriangle) {
    self.square = square
    self.triangle = triangle
  }
  
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare = TriangleAndSquare(size: 10, name: "qwe")

let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength

class FailableClass {
  init?() {
    if true {
      return nil
    }
  }
}

FailableClass()
