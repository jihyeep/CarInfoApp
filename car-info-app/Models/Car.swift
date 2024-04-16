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
