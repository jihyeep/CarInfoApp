class Car: Identifiable{
    var brand: String
    var modelName: String
    var year: Int

    var doorCount: Int
    var weight: Int
    var height: Int

    init(brand: String, modelName: String, year: Int, doorCount: Int, weight: Int, height: Int) {
        self.brand = brand
        self.modelName = modelName
        self.year = year
        self.doorCount = doorCount
        self.weight = weight
        self.height = height
    }
    
    func getDetails() -> String {
        return "Brand: \(brand)\nModel: \(modelName)\nYear: \(year)"
    }
}

class ElectricCar: Car {
    var electricEfficiency: Double
    var fullChargeHours: Double
    var autoLevel: Int

    init(brand: String, modelName: String, year: Int, doorCount: Int, weight: Int, height: Int, electricEfficiency: Double, fullChargeHours: Double, autoLevel: Int) {
        self.electricEfficiency = electricEfficiency
        self.fullChargeHours = fullChargeHours
        self.autoLevel = autoLevel
        super.init(brand: brand, modelName: modelName, year: year, doorCount: doorCount, weight: weight, height: height)
    }
    
    // 오버라이딩은 extension에 쓰인 함수로 바로 불가능하고, 부모 클래스에 해당 함수가 있어야 함
    override func getDetails() -> String {
        return super.getDetails() + "\n전비: \(electricEfficiency)km/h\n충전시간: \(fullChargeHours)시간\n자율주행: \(autoLevel)단계"
    }
}

class OilCar: Car {
    var isAutomatic: Bool
    var fuelEfficiency: Double
    var isGasoline: Bool

    init(brand: String, modelName: String, year: Int, doorCount: Int, weight: Int, height: Int, isAutomatic: Bool, fuelEfficiency: Double, isGasoline: Bool) {
        self.isAutomatic = isAutomatic
        self.fuelEfficiency = fuelEfficiency
        self.isGasoline = isGasoline
        super.init(brand: brand, modelName: modelName, year: year, doorCount: doorCount, weight: weight, height: height)
    }
    
    override func getDetails() -> String {
        let automaticType = isAutomatic ? "자동변속" : "수동변속"
        let oilType = isGasoline ? "가솔린" : "디젤"
        return super.getDetails() + "\n\(automaticType)\n\(oilType)\n연비: \(fuelEfficiency)km/h"
    }
}

class HybridCar: Car {
    var fuelEfficiency: Double
    var isGasoline: Bool
    var autoLevel: Int

    var electricEfficiecy: Double = 0
    var fullCargeHours: Double = 0


    init(brand: String, modelName: String, year: Int, doorCount: Int, weight: Int, height: Int, fuelEfficiency: Double, isGasoline: Bool, autoLevel: Int) {
        self.fuelEfficiency = fuelEfficiency
        self.isGasoline = isGasoline
        self.autoLevel = autoLevel
        super.init(brand: brand, modelName: modelName, year: year, doorCount: doorCount, weight: weight, height: height)
    }
    
    override func getDetails() -> String {
        let oilType = isGasoline ? "가솔린" : "디젤"
        return super.getDetails() + "\n\(oilType)\n연비: \(fuelEfficiency)km/h\n자율주행: \(autoLevel)단계"
    }
}
