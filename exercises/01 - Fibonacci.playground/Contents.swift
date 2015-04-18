//: # Übungsaufgabe 01 - Fibonacci


//: ## A Simple Approach

var prevFibNumber = 0
var fibNumber = 1

var numbersSinceEven = 1

while fibNumber < 1_000 {
    let currentFibNumber = fibNumber
    println(currentFibNumber)
    
    fibNumber = prevFibNumber + currentFibNumber
    prevFibNumber = currentFibNumber
    
    if currentFibNumber % 2 == 0 {
        let dn = numbersSinceEven
        println("Event number with dn=\(dn)")
        numbersSinceEven = 0
    }
    numbersSinceEven++
}


//: ## Really Swiftly

struct FibonacciSequence: SequenceType {
    
    let max: Int
    
    func generate() -> GeneratorOf<Int> {
        
        var prev = 0
        var current = 1
        
        return GeneratorOf<Int> {
            if current > self.max {
                return nil
            }
            let result = current
            current = prev + current
            prev = result
            return result
        }
    }
    
}

let fibonacciSequence = FibonacciSequence(max: 1_000)

for fibNumber in fibonacciSequence {
    let f = fibNumber
    println(f)
}

