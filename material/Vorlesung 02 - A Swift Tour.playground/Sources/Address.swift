public struct Address: CustomStringConvertible {
    
    public let street: String
    public let postalCode: String
    public let city: String
    
    public var description: String {
        return "\(street), \(postalCode) \(city)"
    }
    
    public init(street: String, postalCode: String, city: String) {
        self.street = street
        self.postalCode = postalCode
        self.city = city
    }
    
}
