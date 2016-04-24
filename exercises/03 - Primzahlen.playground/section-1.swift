//: # Übungsaufgabe 02 - Primzahlen

func isPrimeNumber(n: Int) -> Bool {
    guard n > 1 else {
        return n == 1
    }
    for i in 2..<n {
        if i == n {
            continue
        }
        if n % i == 0 {
            return false
        }
    }
    return true
}

func primeNumbersUpTo(maxNumber: Int) -> [Int] {
    var primeNumbers: [Int] = []
    for n in 1...maxNumber {
        if isPrimeNumber(n) {
            primeNumbers.append(n)
        }
    }
    return primeNumbers
}

primeNumbersUpTo(100)

//: ## Really Swiftly

extension Int {
    var isPrime: Bool {
        return isPrimeNumber(self)
    }
}

7.isPrime
4.isPrime
(1..<100).filter(isPrimeNumber)
