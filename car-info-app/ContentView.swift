import SwiftUI

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


#Preview {
    ContentView()
}
