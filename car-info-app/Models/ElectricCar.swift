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
