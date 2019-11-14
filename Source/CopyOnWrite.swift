import Foundation

@propertyWrapper
public struct PW_CopyOnWrite<Value> {

    @PW_Box private var box: Value

    public init(wrappedValue: Value) {
        self._box = PW_Box(wrappedValue: wrappedValue)
    }

    public var wrappedValue: Value {
        get {
            return _box.wrappedValue
        }
        set(wrappedValue) {
            switch isKnownUniquelyReferenced(&_box) {
            case true:
                self._box.wrappedValue = wrappedValue
            case false:
                self._box = PW_Box(wrappedValue: wrappedValue)
            }
        }
    }
}

extension PW_CopyOnWrite: Decodable where Value: Decodable {

    public init(from decoder: Decoder) throws {
        let wrappedValue = try decoder.singleValueContainer().decode(Value.self)
        self.init(wrappedValue: wrappedValue)
    }
}

extension PW_CopyOnWrite: Equatable where Value: Equatable {

    public static func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs._box.wrappedValue == rhs._box.wrappedValue
    }
}

extension PW_CopyOnWrite: Hashable where Value: Hashable {

    public func hash(into hasher: inout Hasher) {
        hasher.combine(self._box.wrappedValue)
    }
}
