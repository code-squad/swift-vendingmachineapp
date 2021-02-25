import Foundation

struct VendingMachine {
    private var insertedMoney: Int
    private var numsOfBeverages: Int
    
    mutating func receivingBeverage() {
        numsOfBeverages += 1
    }
}
