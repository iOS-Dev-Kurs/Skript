//: # Übungsaufgabe 2 - Fibonacci


//: ## A Simple Approach

var prevFibNumber = 0
var fibNumber = 1

while fibNumber < 1_000 {
    let currentFibNumber = fibNumber
    print(currentFibNumber)
    
    fibNumber = prevFibNumber + currentFibNumber
    prevFibNumber = currentFibNumber
}


//: ## Really Swifty

struct FibonacciSequence: SequenceType {
    
    let max: Int
    
    func generate() -> AnyGenerator<Int> {
        
        var prev = 0
        var current = 1
        
        return AnyGenerator<Int> {
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
    print(f)
}

