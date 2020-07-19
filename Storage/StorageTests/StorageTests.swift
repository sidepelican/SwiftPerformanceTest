import XCTest

struct A: Hashable {}
struct B: Hashable {}
struct C: Hashable {}
struct D: Hashable {}
struct E: Hashable {}
struct F: Hashable {}
struct G: Hashable {}
struct H: Hashable {}
struct I: Hashable {}
struct J: Hashable {}
struct K: Hashable {}
struct L: Hashable {}
struct M: Hashable {}
struct N: Hashable {}

struct HashableType: Hashable {
    let type: Any.Type
    private let combineValue: Int
    init<H: Hashable>(_ type: H.Type) {
        self.type = type
        combineValue = "\(type)".hashValue
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(combineValue)
    }

    static func == (lhs: HashableType, rhs: HashableType) -> Bool {
        lhs.type == rhs.type
    }
}

struct EquatableAnyType: Equatable {
    var type: Any.Type
    static func == (lhs: EquatableAnyType, rhs: EquatableAnyType) -> Bool {
        lhs.type == rhs.type
    }
}

class StorageTests: XCTestCase {
    let measureRepeats = 100000
    let types: [Any.Type] = [
        Int8.self,
        Int16.self,
        Int32.self,
        Int64.self,
        Float32.self,
        Float64.self,
        Float80.self,
        String.self,
        Bool.self,
        XCTestCase.self,
        StorageTests.self,
        A.self,
        B.self,
        C.self,
        D.self,
        E.self,
        F.self,
        G.self,
        H.self,
        I.self,
        J.self,
        K.self,
        L.self,
        M.self,
        N.self,
    ]

    let hashableTypes: [HashableType] = [
        HashableType(Int8.self),
        HashableType(Int16.self),
        HashableType(Int32.self),
        HashableType(Int64.self),
        HashableType(Float32.self),
        HashableType(Float64.self),
        HashableType(Float80.self),
        HashableType(String.self),
        HashableType(Bool.self),
        HashableType(XCTestCase.self),
        HashableType(StorageTests.self),
        HashableType(A.self),
        HashableType(B.self),
        HashableType(C.self),
        HashableType(D.self),
        HashableType(E.self),
        HashableType(F.self),
        HashableType(G.self),
        HashableType(H.self),
        HashableType(I.self),
        HashableType(J.self),
        HashableType(K.self),
        HashableType(L.self),
        HashableType(M.self),
        HashableType(N.self),
    ]

    func testTupleArray() {
        measureMetrics([.wallClockTime], automaticallyStartMeasuring: false) {
            var storage: [(Any.Type, Int)] = []
            let inputs = types.shuffled()
            inputs.enumerated().forEach { i, v in storage.append((v, i)) }

            var results: [Int] = []
            results.reserveCapacity(measureRepeats * inputs.count)

            startMeasuring()
            for _ in 0..<measureRepeats {
                for input in inputs {
                    results.append(storage.first(where: { $0.0 == input })!.1)
                }
            }
            stopMeasuring()

            XCTAssertEqual(results.prefix(inputs.count), Array(0..<inputs.count)[...])
        }
    }

    func testStructArray() {
        struct Box {
            var type: Any.Type
            var value: Int
        }
        measureMetrics([.wallClockTime], automaticallyStartMeasuring: false) {
            var storage: [Box] = []
            let inputs = types.shuffled()
            inputs.enumerated().forEach { i, v in storage.append(Box(type: v, value: i)) }

            var results: [Int] = []
            results.reserveCapacity(measureRepeats * inputs.count)

            startMeasuring()
            for _ in 0..<measureRepeats {
                for input in inputs {
                    results.append(storage.first(where: { $0.type == input })!.value)
                }
            }
            stopMeasuring()

            XCTAssertEqual(results.prefix(inputs.count), Array(0..<inputs.count)[...])
        }
    }

    func testIndexedArray() {
        measureMetrics([.wallClockTime], automaticallyStartMeasuring: false) {
            var indexStorage: [EquatableAnyType] = []
            var valueStorage: [Int] = []
            let inputs = types.shuffled()
            inputs.enumerated().forEach { i, v in
                valueStorage.append(i)
                indexStorage.append(.init(type: v))
            }
            
            var results: [Int] = []
            results.reserveCapacity(measureRepeats * inputs.count)

            startMeasuring()
            for _ in 0..<measureRepeats {
                for input in inputs {
                    results.append(valueStorage[indexStorage.firstIndex(of: EquatableAnyType(type: input))!])
                }
            }
            stopMeasuring()

            XCTAssertEqual(results.prefix(inputs.count), Array(0..<inputs.count)[...])
        }
    }

    func testHashableTypeDictionary() {
        measureMetrics([.wallClockTime], automaticallyStartMeasuring: false) {
            var storage: [HashableType: Int] = [:]
            let inputs = hashableTypes.shuffled()
            inputs.enumerated().forEach { i, v in storage[v] = i }

            var results: [Int] = []
            results.reserveCapacity(measureRepeats * inputs.count)

            startMeasuring()
            for _ in 0..<measureRepeats {
                for input in inputs {
                    results.append(storage[input]!)
                }
            }
            stopMeasuring()

            XCTAssertEqual(results.prefix(inputs.count), Array(0..<inputs.count)[...])
        }
    }
}
