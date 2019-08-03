import UIKit

class BeverageMaker {
    
    
    
    
    struct ExampleDate {
        static let date1 = Date("20190208")!
        static let date2 = Date("20190411")!
        static let date3 = Date("20190505")!
        static let date4 = Date("20190625")!
    }
    
    enum MilkOption {
        case strawberry
        case chocolate
        
        var initial: (String, Date) -> Milk {
            switch self {
            case .strawberry:
                return StrawberryMilk.init
            case .chocolate:
                return ChocolateMilk.init
            }
        }
    }
    
    enum SoftDrinkOption {
        case cola
        case lemonLimeDrink
        
        var initial: (Date) -> SoftDrink {
            switch self {
            case .cola:
                return Cola.init
            case .lemonLimeDrink:
                return LemonlimeDrink.init
            }
        }
    }
    
    enum CoffeeOption {
        case topCoffee
        case cantataCoffee
        
        var initial: (Date) -> Coffee {
            switch self {
            case .topCoffee:
                return TOPCoffee.init
            case .cantataCoffee:
                return CantataCoffee.init
            }
        }
    }
    
    func makeMilk(option: MilkOption, dateOfManufacture: Date, milkFactory: String = "샘플 목장") -> Milk {
        return option.initial(milkFactory, dateOfManufacture)
    }
    
    func makeSoftDrink(option: SoftDrinkOption, dateOfManufacture: Date) -> SoftDrink {
        return option.initial(dateOfManufacture)
    }
    
    func makeCoffee(option: CoffeeOption, dateOfManufacture: Date) -> Coffee {
        return option.initial(dateOfManufacture)
    }
    
    var exampleBeverages: [Beverage] {
        return [
            makeMilk(option: .chocolate, dateOfManufacture: ExampleDate.date1),
            makeMilk(option: .chocolate, dateOfManufacture: ExampleDate.date1),
            makeMilk(option: .chocolate, dateOfManufacture: ExampleDate.date1),
            makeMilk(option: .chocolate, dateOfManufacture: ExampleDate.date1),
            
            makeMilk(option: .strawberry, dateOfManufacture: ExampleDate.date2),
            makeMilk(option: .strawberry, dateOfManufacture: ExampleDate.date2),
            makeMilk(option: .strawberry, dateOfManufacture: ExampleDate.date2),
            
            makeSoftDrink(option: .cola, dateOfManufacture: ExampleDate.date3),
            makeSoftDrink(option: .cola, dateOfManufacture: ExampleDate.date3),
            
            makeSoftDrink(option: .lemonLimeDrink, dateOfManufacture: ExampleDate.date4),
            
            makeCoffee(option: .cantataCoffee, dateOfManufacture: ExampleDate.date1),
            makeCoffee(option: .cantataCoffee, dateOfManufacture: ExampleDate.date1),
            
            makeCoffee(option: .topCoffee, dateOfManufacture: ExampleDate.date2),
        ]
    }
}
