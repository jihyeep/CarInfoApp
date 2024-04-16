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
