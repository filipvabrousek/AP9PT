import SwiftUI

struct ContentView: View {
    @State private var height: Double = 175   // cm
    @State private var weight: Double = 70    // kg

    private var bmi: Double {
        let meters = height / 100
        return weight / (meters * meters)
    }

    private var category: (name: String, color: Color) {
        switch bmi {
        case ..<18.5: ("Underweight", .blue)
        case ..<25:   ("Normal", .green)
        case ..<30:   ("Overweight", .orange)
        default:      ("Obese", .red)
        }
    }

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    VStack(spacing: 8) {
                        Text(bmi, format: .number.precision(.fractionLength(1)))
                            .font(.system(size: 72, weight: .bold, design: .rounded))
                            .foregroundStyle(category.color)
                            .contentTransition(.numericText(value: bmi))
                        Text(category.name)
                            .font(.title2.weight(.semibold))
                            .foregroundStyle(category.color)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                    .animation(.snappy, value: bmi)
                }

                Section("Height: \(Int(height)) cm") {
                    Slider(value: $height, in: 100...230, step: 1)
                }

                Section("Weight: \(Int(weight)) kg") {
                    Slider(value: $weight, in: 30...200, step: 1)
                }

                Section("Categories") {
                    row("Underweight", "< 18.5", .blue)
                    row("Normal", "18.5 – 24.9", .green)
                    row("Overweight", "25 – 29.9", .orange)
                    row("Obese", "≥ 30", .red)
                }
            }
            .navigationTitle("BMI Calculator")
        }
    }

    private func row(_ name: String, _ range: String, _ color: Color) -> some View {
        HStack {
            Circle().fill(color).frame(width: 10, height: 10)
            Text(name).fontWeight(name == category.name ? .bold : .regular)
            Spacer()
            Text(range).foregroundStyle(.secondary)
        }
    }
}

#Preview {
    ContentView()
}
