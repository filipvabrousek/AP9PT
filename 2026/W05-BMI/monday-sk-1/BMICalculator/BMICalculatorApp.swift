import SwiftUI

@main
struct BMICalculatorApp: App {
    var body: some Scene {
        WindowGroup {
           TextView()
            // ContentView()
        }
    }
}


// MARK: - Model

enum UnitSystem: String, CaseIterable, Identifiable {
    case metric = "Metric"
    case imperial = "Imperial"
    var id: Self { self }
}

enum BMICategory {
    case underweight, normal, overweight, obese

    init(bmi: Double) {
        switch bmi {
        case ..<18.5: self = .underweight
        case ..<25: self = .normal
        case ..<30: self = .overweight
        default: self = .obese
        }
    }

    var title: String {
        switch self {
        case .underweight: "Underweight"
        case .normal: "Normal weight"
        case .overweight: "Overweight"
        case .obese: "Obese"
        }
    }

    var color: Color {
        switch self {
        case .underweight: .blue
        case .normal: .green
        case .overweight: .orange
        case .obese: .red
        }
    }
}

func calculateBMI(weightKg: Double, heightCm: Double) -> Double? {
    guard weightKg > 0, heightCm > 0 else { return nil }
    let meters = heightCm / 100
    return weightKg / (meters * meters)
}

// MARK: - Views

struct ContentView: View {
    @State private var units: UnitSystem = .metric
    @State private var heightCm: Double = 175
    @State private var weightKg: Double = 70
    @State private var heightFeet: Int = 5
    @State private var heightInches: Int = 9
    @State private var weightLb: Double = 154

    private var bmi: Double? {
        switch units {
        case .metric:
            return calculateBMI(weightKg: weightKg, heightCm: heightCm)
        case .imperial:
            let totalInches = Double(heightFeet * 12 + heightInches)
            return calculateBMI(weightKg: weightLb * 0.45359237, heightCm: totalInches * 2.54)
        }
    }

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Units", selection: $units) {
                        ForEach(UnitSystem.allCases) { Text($0.rawValue).tag($0) }
                    }
                    .pickerStyle(.segmented)
                }

                Section("Height") {
                    switch units {
                    case .metric:
                        LabeledSlider(value: $heightCm, range: 100...230, step: 1, unit: "cm")
                    case .imperial:
                        Stepper("\(heightFeet) ft", value: $heightFeet, in: 3...7)
                        Stepper("\(heightInches) in", value: $heightInches, in: 0...11)
                    }
                }

                Section("Weight") {
                    switch units {
                    case .metric:
                        LabeledSlider(value: $weightKg, range: 30...200, step: 0.5, unit: "kg")
                    case .imperial:
                        LabeledSlider(value: $weightLb, range: 66...440, step: 1, unit: "lb")
                    }
                }

                if let bmi {
                    Section("Result") {
                        ResultView(bmi: bmi)
                    }
                }
            }
            .navigationTitle("BMI Calculator")
            .onChange(of: units) { _, newUnits in
                syncValues(to: newUnits)
            }
        }
    }

    /// Carries the current height/weight across when the unit system changes.
    private func syncValues(to newUnits: UnitSystem) {
        switch newUnits {
        case .imperial:
            let totalInches = Int((heightCm / 2.54).rounded())
            heightFeet = min(max(totalInches / 12, 3), 7)
            heightInches = totalInches % 12
            weightLb = (weightKg / 0.45359237).rounded()
        case .metric:
            heightCm = (Double(heightFeet * 12 + heightInches) * 2.54).rounded()
            weightKg = ((weightLb * 0.45359237) * 2).rounded() / 2
        }
    }
}

struct LabeledSlider: View {
    @Binding var value: Double
    let range: ClosedRange<Double>
    let step: Double
    let unit: String

    var body: some View {
        VStack(alignment: .leading) {
            Text("\(value, specifier: step < 1 ? "%.1f" : "%.0f") \(unit)")
                .font(.title3.monospacedDigit().bold())
            Slider(value: $value, in: range, step: step)
        }
    }
}

struct ResultView: View {
    let bmi: Double
    private var category: BMICategory { BMICategory(bmi: bmi) }

    var body: some View {
        VStack(spacing: 12) {
            Text(bmi, format: .number.precision(.fractionLength(1)))
                .font(.system(size: 56, weight: .bold, design: .rounded))
                .foregroundStyle(category.color)
                .contentTransition(.numericText())
                .animation(.snappy, value: bmi)

            Text(category.title)
                .font(.headline)
                .padding(.horizontal, 12)
                .padding(.vertical, 4)
                .background(category.color.opacity(0.15), in: Capsule())

            BMIGauge(bmi: bmi)
                .padding(.top, 4)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 8)
    }
}

/// Horizontal scale from BMI 15 to 40 with a marker at the current value.
struct BMIGauge: View {
    let bmi: Double
    private let lower = 15.0
    private let upper = 40.0

    var body: some View {
        VStack(spacing: 4) {
            GeometryReader { geo in
                let fraction = (min(max(bmi, lower), upper) - lower) / (upper - lower)
                ZStack(alignment: .leading) {
                    Capsule()
                        .fill(LinearGradient(
                            stops: [
                                .init(color: .blue, location: 0),
                                .init(color: .green, location: (18.5 - lower) / (upper - lower)),
                                .init(color: .green, location: (25 - lower) / (upper - lower)),
                                .init(color: .orange, location: (30 - lower) / (upper - lower)),
                                .init(color: .red, location: 1),
                            ],
                            startPoint: .leading, endPoint: .trailing))
                        .frame(height: 10)
                    Circle()
                        .fill(.white)
                        .stroke(.primary, lineWidth: 2)
                        .frame(width: 18, height: 18)
                        .offset(x: fraction * (geo.size.width - 18))
                        .animation(.snappy, value: bmi)
                }
            }
            .frame(height: 18)

            GeometryReader { geo in
                ForEach([15, 18.5, 25, 30, 40], id: \.self) { mark in
                    Text(mark, format: .number)
                        .fixedSize()
                        .position(
                            x: 9 + (mark - lower) / (upper - lower) * (geo.size.width - 18),
                            y: geo.size.height / 2)
                }
            }
            .frame(height: 14)
            .font(.caption2)
            .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    ContentView()
}
