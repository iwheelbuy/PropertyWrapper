import Foundation

@propertyWrapper
public struct PW_Ref<V> {

    public let read: () -> V
    public let write: (V) -> Void

    public init(read: @escaping () -> V, write: @escaping (V) -> Void) {
        self.read = read
        self.write = write
    }

    public var wrappedValue: V {
        get {
            return read()
        }
        nonmutating set {
            write(newValue)
        }
    }

    public subscript<U>(keyPath: WritableKeyPath<V, U>) -> PW_Ref<U> {
        let read: () -> U = {
            return self.wrappedValue[keyPath: keyPath]
        }
        let write: (U) -> Void = { (value: U) -> Void in
            self.wrappedValue[keyPath: keyPath] = value
        }
        return PW_Ref<U>(read: read, write: write)
    }
}
