import SwiftUI

class TopGear: Identifiable {
    let id = UUID()
    var name: String
    var classification: [TopGear]?
    
    init(name: String, classification: [TopGear]? = nil) {
        self.name = name
        self.classification = classification
    }
}

struct ContentView: View {
    var gear: [TopGear] = [
        TopGear(name: "전기", classification: [
            TopGear(name: "x"),
            TopGear(name: "y"),
            ]),
        TopGear(name: "내연기관", classification: [
            TopGear(name: "k9"),
            TopGear(name: "k8"),
            TopGear(name: "k7")
            ])
    ]
    var body: some View {
        List {
            OutlineGroup(gear, id: \.id, children: \.classification) {
                creature in Text(creature.name)
            }
        }
    }
}


#Preview {
    ContentView()
}
