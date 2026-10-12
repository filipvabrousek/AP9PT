import SwiftUI

@main
struct BMICalculatorApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
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
        case ..<25:   self = .normal
        case ..<30:   self = .overweight
        default:      self = .obese
        }
    }

    var title: String {
        switch self {
        case .underweight: "Underweight"
        case .normal:      "Normal weight"
        case .overweight:  "Overweight"
        case .obese:       "Obese"
        }
    }

    var color: Color {
        switch self {
        case .underweight: .blue
        case .normal:      .green
        case .overweight:  .orange
        case .obese:       .red
        }
    }
}

// MARK: - View

struct ContentView: View {
    @State private var units: UnitSystem = .metric
    @State private var heightCm: Double = 175
    @State private var weightKg: Double = 70
    @State private var heightIn: Double = 69
    @State private var weightLb: Double = 154

    private var bmi: Double {
        switch units {
        case .metric:
            let m = heightCm / 100
            return weightKg / (m * m)
        case .imperial:
            return 703 * weightLb / (heightIn * heightIn)
        }
    }

    private var category: BMICategory { BMICategory(bmi: bmi) }

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
                    if units == .metric {
                        ValueSlider(value: $heightCm, range: 100...230, label: "\(Int(heightCm)) cm")
                    } else {
                        ValueSlider(value: $heightIn, range: 40...90,
                                    label: "\(Int(heightIn) / 12) ft \(Int(heightIn) % 12) in")
                    }
                }

                Section("Weight") {
                    if units == .metric {
                        ValueSlider(value: $weightKg, range: 30...200, label: "\(Int(weightKg)) kg")
                    } else {
                        ValueSlider(value: $weightLb, range: 66...440, label: "\(Int(weightLb)) lb")
                    }
                }

                Section("Result") {
                    VStack(spacing: 8) {
                        Text(bmi, format: .number.precision(.fractionLength(1)))
                            .font(.system(size: 56, weight: .bold, design: .rounded))
                            .contentTransition(.numericText())
                            .animation(.snappy, value: bmi)
                        Text(category.title)
                            .font(.headline)
                            .foregroundStyle(category.color)
                        BMIScale(bmi: bmi)
                            .padding(.top, 8)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                }
            }
            .navigationTitle("BMI Calculator")
            .onChange(of: units) { _, newValue in
                // Keep values in sync when switching unit systems.
                if newValue == .imperial {
                    heightIn = (heightCm / 2.54).rounded()
                    weightLb = (weightKg * 2.20462).rounded()
                } else {
                    heightCm = (heightIn * 2.54).rounded()
                    weightKg = (weightLb / 2.20462).rounded()
                }
            }
        }
    }
}

struct ValueSlider: View {
    @Binding var value: Double
    let range: ClosedRange<Double>
    let label: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .font(.title3.monospacedDigit())
            Slider(value: $value, in: range, step: 1)
        }
    }
}

/// Colored bar from BMI 15 to 40 with a marker for the current value.
struct BMIScale: View {
    let bmi: Double
    private let lower = 15.0, upper = 40.0

    var body: some View {
        GeometryReader { geo in
            let fraction = (min(max(bmi, lower), upper) - lower) / (upper - lower)
            ZStack(alignment: .leading) {
                LinearGradient(
                    stops: [
                        .init(color: .blue,   location: 0),
                        .init(color: .green,  location: (18.5 - lower) / (upper - lower)),
                        .init(color: .green,  location: (25 - lower) / (upper - lower)),
                        .init(color: .orange, location: (30 - lower) / (upper - lower)),
                        .init(color: .red,    location: 1),
                    ],
                    startPoint: .leading, endPoint: .trailing
                )
                .frame(height: 10)
                .clipShape(Capsule())

                Circle()
                    .fill(.white)
                    .stroke(.primary, lineWidth: 2)
                    .frame(width: 18, height: 18)
                    .offset(x: fraction * (geo.size.width - 18))
                    .animation(.snappy, value: bmi)
            }
        }
        .frame(height: 18)
    }
}

#Preview {
    ContentView()
}
