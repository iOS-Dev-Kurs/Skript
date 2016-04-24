import Foundation

public func isPrimeNumber(n: Int) -> Bool {
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

public func primeNumbersUpTo(maxNumber: Int) -> [Int] {
    return (1...maxNumber).filter(isPrimeNumber)
}
