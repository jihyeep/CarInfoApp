import SwiftUI

protocol CarDescriptionProtocol {
    var brand: String { get }
    var modelName: String { get }
    var year: Int { get }
    
    func getDetails() -> String
}

//extension CarDescriptionProtocol {
//    func getDetails() -> String {
//        return "Brand: \(brand)\nModel: \(modelName)\nYear: \(year)"
//    }
//}

class Car: Identifiable, CarDescriptionProtocol{
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

let teslaModelX: ElectricCar = ElectricCar(brand: "Tesla", modelName: "Model X", year: 2015, doorCount: 4, weight: 100, height: 40, electricEfficiency: 439, fullChargeHours: 5, autoLevel: 2)

let teslaModelY: ElectricCar = ElectricCar(brand: "Tesla", modelName: "Model Y", year: 2015, doorCount: 4, weight: 100, height: 40, electricEfficiency: 511 , fullChargeHours: 7, autoLevel: 3)

let kiaK9: OilCar = OilCar(brand: "KIA", modelName: "K9", year: 2022, doorCount: 4, weight: 70, height: 35, isAutomatic: true, fuelEfficiency: 9.0, isGasoline: true)

let kiaK8: OilCar = OilCar(brand: "KIA", modelName: "K8", year: 2023, doorCount: 4, weight: 70, height: 35, isAutomatic: true, fuelEfficiency: 18.0, isGasoline: true)


let kiaK5: OilCar = OilCar(brand: "KIA", modelName: "K5", year: 2023, doorCount: 4, weight: 70, height: 35, isAutomatic: true, fuelEfficiency: 20.0, isGasoline: true)

let prius: HybridCar = HybridCar(brand: "Toyota", modelName: "Prius", year: 2023, doorCount: 4, weight: 60, height: 40, fuelEfficiency: 65, isGasoline: true, autoLevel: 0)

let grandeurHybrid: HybridCar = HybridCar(brand: "Hyundai", modelName: "그렌저 하이브리드", year: 2023, doorCount: 4, weight: 70, height: 35, fuelEfficiency: 16.7, isGasoline: true, autoLevel: 1)

// 리스트 생성
let cars: [Car] = [teslaModelX, teslaModelY, kiaK5, kiaK8, kiaK9, prius, grandeurHybrid]

struct ContentView: View {
    
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Electric Cars")) {
                    // 필터를 통해 클래스 구분
                    ForEach(cars.filter { $0 is ElectricCar }, id: \.id) { car in
                        NavigationLink(destination: CarDetailView(car: car)) {       Text(car.modelName)
                            
                        }
                    }
                }
                Section(header: Text("Oil Cars")) {
                    ForEach(cars.filter { $0 is OilCar }.sorted(by: { $0.modelName > $1.modelName }), id: \.id) { car in
                        NavigationLink(destination: CarDetailView(car: car)) {
                            Text(car.modelName)
                        }
                    }
                }
                Section(header: Text("Hybrid Cars")) {
                    ForEach(cars.filter { $0 is HybridCar }, id: \.id) { car in
                        NavigationLink(destination: CarDetailView(car: car)) {
                            Text(car.modelName)
                        }
                    }
                }
                
            }
            .navigationTitle("Car List")
        }
        
    }
}


struct CarDetailView: View {
    let car: Car
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(car.modelName)
                .font(.largeTitle)
                .fontWeight(.bold
                )
            Text(car.getDetails())
                .font(.body)
        }
        .padding()
    }
}

#Preview {
    ContentView()
//    CarDetailView(car: teslaModelY)
}
