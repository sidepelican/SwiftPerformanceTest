import XCTest

struct T1: Hashable {}
struct T2: Hashable {}
struct T3: Hashable {}
struct T4: Hashable {}
struct T5: Hashable {}
struct T6: Hashable {}
struct T7: Hashable {}
struct T8: Hashable {}
struct T9: Hashable {}
struct T10: Hashable {}
struct T11: Hashable {}
struct T12: Hashable {}
struct T13: Hashable {}
struct T14: Hashable {}
struct T15: Hashable {}
struct T16: Hashable {}
struct T17: Hashable {}
struct T18: Hashable {}
struct T19: Hashable {}
struct T20: Hashable {}
struct T21: Hashable {}
struct T22: Hashable {}
struct T23: Hashable {}
struct T24: Hashable {}
struct T25: Hashable {}
struct T26: Hashable {}
struct T27: Hashable {}
struct T28: Hashable {}
struct T29: Hashable {}
struct T30: Hashable {}
struct T31: Hashable {}
struct T32: Hashable {}
struct T33: Hashable {}
struct T34: Hashable {}
struct T35: Hashable {}
struct T36: Hashable {}
struct T37: Hashable {}
struct T38: Hashable {}
struct T39: Hashable {}
struct T40: Hashable {}
struct T41: Hashable {}
struct T42: Hashable {}
struct T43: Hashable {}
struct T44: Hashable {}
struct T45: Hashable {}
struct T46: Hashable {}
struct T47: Hashable {}
struct T48: Hashable {}
struct T49: Hashable {}
struct T50: Hashable {}
struct T51: Hashable {}
struct T52: Hashable {}
struct T53: Hashable {}
struct T54: Hashable {}
struct T55: Hashable {}
struct T56: Hashable {}
struct T57: Hashable {}
struct T58: Hashable {}
struct T59: Hashable {}
struct T60: Hashable {}
struct T61: Hashable {}
struct T62: Hashable {}
struct T63: Hashable {}
struct T64: Hashable {}
struct T65: Hashable {}
struct T66: Hashable {}
struct T67: Hashable {}
struct T68: Hashable {}
struct T69: Hashable {}
struct T70: Hashable {}
struct T71: Hashable {}
struct T72: Hashable {}
struct T73: Hashable {}
struct T74: Hashable {}
struct T75: Hashable {}
struct T76: Hashable {}
struct T77: Hashable {}
struct T78: Hashable {}
struct T79: Hashable {}
struct T80: Hashable {}
struct T81: Hashable {}
struct T82: Hashable {}
struct T83: Hashable {}
struct T84: Hashable {}
struct T85: Hashable {}
struct T86: Hashable {}
struct T87: Hashable {}
struct T88: Hashable {}
struct T89: Hashable {}
struct T90: Hashable {}
struct T91: Hashable {}
struct T92: Hashable {}
struct T93: Hashable {}
struct T94: Hashable {}
struct T95: Hashable {}
struct T96: Hashable {}
struct T97: Hashable {}
struct T98: Hashable {}
struct T99: Hashable {}
struct T100: Hashable {}


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

let measureRepeats = 100000
let typesCount = 50

class StorageTests: XCTestCase {
    let types: ArraySlice<Any.Type> = [
        T1.self,
        T2.self,
        T3.self,
        T4.self,
        T5.self,
        T6.self,
        T7.self,
        T8.self,
        T9.self,
        T10.self,
        T11.self,
        T12.self,
        T13.self,
        T14.self,
        T15.self,
        T16.self,
        T17.self,
        T18.self,
        T19.self,
        T20.self,
        T21.self,
        T22.self,
        T23.self,
        T24.self,
        T25.self,
        T26.self,
        T27.self,
        T28.self,
        T29.self,
        T30.self,
        T31.self,
        T32.self,
        T33.self,
        T34.self,
        T35.self,
        T36.self,
        T37.self,
        T38.self,
        T39.self,
        T40.self,
        T41.self,
        T42.self,
        T43.self,
        T44.self,
        T45.self,
        T46.self,
        T47.self,
        T48.self,
        T49.self,
        T50.self,
        T51.self,
        T52.self,
        T53.self,
        T54.self,
        T55.self,
        T56.self,
        T57.self,
        T58.self,
        T59.self,
        T60.self,
        T61.self,
        T62.self,
        T63.self,
        T64.self,
        T65.self,
        T66.self,
        T67.self,
        T68.self,
        T69.self,
        T70.self,
        T71.self,
        T72.self,
        T73.self,
        T74.self,
        T75.self,
        T76.self,
        T77.self,
        T78.self,
        T79.self,
        T80.self,
        T81.self,
        T82.self,
        T83.self,
        T84.self,
        T85.self,
        T86.self,
        T87.self,
        T88.self,
        T89.self,
        T90.self,
        T91.self,
        T92.self,
        T93.self,
        T94.self,
        T95.self,
        T96.self,
        T97.self,
        T98.self,
        T99.self,
        T100.self,
    ].prefix(typesCount)

    let hashableTypes: ArraySlice<HashableType> = [
        HashableType(T1.self),
        HashableType(T2.self),
        HashableType(T3.self),
        HashableType(T4.self),
        HashableType(T5.self),
        HashableType(T6.self),
        HashableType(T7.self),
        HashableType(T8.self),
        HashableType(T9.self),
        HashableType(T10.self),
        HashableType(T11.self),
        HashableType(T12.self),
        HashableType(T13.self),
        HashableType(T14.self),
        HashableType(T15.self),
        HashableType(T16.self),
        HashableType(T17.self),
        HashableType(T18.self),
        HashableType(T19.self),
        HashableType(T20.self),
        HashableType(T21.self),
        HashableType(T22.self),
        HashableType(T23.self),
        HashableType(T24.self),
        HashableType(T25.self),
        HashableType(T26.self),
        HashableType(T27.self),
        HashableType(T28.self),
        HashableType(T29.self),
        HashableType(T30.self),
        HashableType(T31.self),
        HashableType(T32.self),
        HashableType(T33.self),
        HashableType(T34.self),
        HashableType(T35.self),
        HashableType(T36.self),
        HashableType(T37.self),
        HashableType(T38.self),
        HashableType(T39.self),
        HashableType(T40.self),
        HashableType(T41.self),
        HashableType(T42.self),
        HashableType(T43.self),
        HashableType(T44.self),
        HashableType(T45.self),
        HashableType(T46.self),
        HashableType(T47.self),
        HashableType(T48.self),
        HashableType(T49.self),
        HashableType(T50.self),
        HashableType(T51.self),
        HashableType(T52.self),
        HashableType(T53.self),
        HashableType(T54.self),
        HashableType(T55.self),
        HashableType(T56.self),
        HashableType(T57.self),
        HashableType(T58.self),
        HashableType(T59.self),
        HashableType(T60.self),
        HashableType(T61.self),
        HashableType(T62.self),
        HashableType(T63.self),
        HashableType(T64.self),
        HashableType(T65.self),
        HashableType(T66.self),
        HashableType(T67.self),
        HashableType(T68.self),
        HashableType(T69.self),
        HashableType(T70.self),
        HashableType(T71.self),
        HashableType(T72.self),
        HashableType(T73.self),
        HashableType(T74.self),
        HashableType(T75.self),
        HashableType(T76.self),
        HashableType(T77.self),
        HashableType(T78.self),
        HashableType(T79.self),
        HashableType(T80.self),
        HashableType(T81.self),
        HashableType(T82.self),
        HashableType(T83.self),
        HashableType(T84.self),
        HashableType(T85.self),
        HashableType(T86.self),
        HashableType(T87.self),
        HashableType(T88.self),
        HashableType(T89.self),
        HashableType(T90.self),
        HashableType(T91.self),
        HashableType(T92.self),
        HashableType(T93.self),
        HashableType(T94.self),
        HashableType(T95.self),
        HashableType(T96.self),
        HashableType(T97.self),
        HashableType(T98.self),
        HashableType(T99.self),
        HashableType(T100.self),
    ].prefix(typesCount)

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
