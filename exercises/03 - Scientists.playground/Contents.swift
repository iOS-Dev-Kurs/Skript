//: # Übungsaufgabe 03 - Scientists

/// Die Person Klasse aus der Vorlesung
class Person {
    
    let name: String
    
    init(name: String) {
        self.name = name
        self.sayHello()
    }
    
    func sayHello() {
        println("Hello World! My name is \(name).")
    }
    
    func sayHelloTo(otherPerson: Person) {
        println("Hi \(otherPerson.name)! My name is \(name)")
    }
    
}

/// Eine Subklasse von Person mit zusätzlicher Funktionalität
class Scientist: Person {
    
    func sayPrimeNumbersUpTo(maxNumber: Int) {
        for var n=1; n<maxNumber; n++ {
            var isPrimeNumber = true
            for var i=2; i<n; i++ {
                if i==n {
                    continue
                }
                if n%i == 0 {
                    isPrimeNumber = false
                    break
                }
            }
            if isPrimeNumber {
                println("\(n) is a prime number.")
            }
        }
    }
    
    override func sayHello() {
        super.sayHello()
        println("Ask me for prime numbers!")
    }
    
}

let 👴🏼 = Scientist(name: "Karl")
👴🏼.sayPrimeNumbersUpTo(10)
