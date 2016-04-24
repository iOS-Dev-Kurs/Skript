public class Person {
    
    public let name: String
    
    public init(name: String) {
        self.name = name
        self.sayHello()
    }
    
    public func sayHello() {
        print("Hello World! My name is \(name).")
    }
    
}
