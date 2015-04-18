//: # Übungsaufgabe 02 - Primzahlen

func isPrimeNumber(n: Int, cachedPrimeNumbers: [Int]? = nil) -> Bool {
    if let cachedPrimeNumbers = cachedPrimeNumbers, let maxNumber = cachedPrimeNumbers.last where maxNumber >= n {
        return contains(cachedPrimeNumbers, n)
    } else {
        for var i=2; i<n; i++ {
            if i==n {
                continue
            }
            if n%i == 0 {
                return false
            }
        }
        return true
    }
}

func primeNumbersUpTo(maxNumber: Int) -> [Int] {
    var primeNumbers = [Int]()
    for var n=1; n<=maxNumber; n++ {
        if isPrimeNumber(n) {
            primeNumbers.append(n)
        }
    }
    return primeNumbers
}

let p = primeNumbersUpTo(100)

//: ## Really Swiftly

extension Int {
    var isPrime: Bool {
        return isPrimeNumber(self)
    }
}

7.isPrime
4.isPrime
[Int](1..<100).filter { $0.isPrime }

//: ## Testing

let n = 499 // Number to test
let cachedMax = 500 // Prime numbers up to this number will be cached
import Foundation
var startDate: NSDate

startDate = NSDate()
let cachedPrimeNumbers = primeNumbersUpTo(cachedMax)
println("Time for caching prime numbers up to \(cachedMax): \(-startDate.timeIntervalSinceNow)s")

startDate = NSDate()
if isPrimeNumber(n) {
    println("\(n) is a prime number.")
} else {
    println("\(n) is not a prime number.")
}
let withoutCacheTime = -startDate.timeIntervalSinceNow
println("Time without cache: \(withoutCacheTime)s")

startDate = NSDate()
isPrimeNumber(n, cachedPrimeNumbers: cachedPrimeNumbers)
let withCacheTime = -startDate.timeIntervalSinceNow
println("Time with cache: \(withCacheTime)s (\((1 - withCacheTime / withoutCacheTime) * 100)% faster)")
