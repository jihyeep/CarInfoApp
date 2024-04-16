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
