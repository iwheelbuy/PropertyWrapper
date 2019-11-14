import Foundation

private final class Reference<Value> {

    var value: Value

    init(_ value: Value) {
        self.value = value
    }
}

@propertyWrapper
public struct CopyOnWrite<Value> {

    private var reference: Reference<Value>

    public init(_ value: Value) {
        self.reference = Reference(value)
    }

    public var wrappedValue: Value {
        get {
            return reference.value
        }
        set(value) {
            switch isKnownUniquelyReferenced(&reference) {
            case true:
                self.reference.value = value
            case false:
                self.reference = Reference(value)
            }
        }
    }
}

extension CopyOnWrite: Decodable where Value: Decodable {

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(Value.self)
        self.init(value)
    }
}
