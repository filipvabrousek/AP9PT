import SwiftUI

struct ContentView: View {
    @AppStorage("unitSystem") private var units: UnitSystem = .metric
    // Stored internally in metric; converted for display.
    @AppStorage("heightCm") private var heightCm: Double = 175
    @AppStorage("weightKg") private var weightKg: Double = 70

    private var bmi: Double { BMI.calculate(weightKg: weightKg, heightCm: heightCm) }
    private var category: BMICategory { BMICategory(bmi: bmi) }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    Picker("Units", selection: $units) {
                        ForEach(UnitSystem.allCases) { Text($0.rawValue).tag($0) }
                    }
                    .pickerStyle(.segmented)

                    ResultCard(bmi: bmi, category: category)

                    InputCard(title: "Height", valueText: heightText, systemImage: "ruler") {
                        Slider(value: $heightCm, in: 100...220, step: units == .metric ? 1 : 2.54)
                    }

                    InputCard(title: "Weight", valueText: weightText, systemImage: "scalemass") {
                        Slider(value: $weightKg, in: 30...200, step: units == .metric ? 0.5 : 0.45359237)
                    }

                    healthyRangeText
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("BMI")
        }
    }

    private var heightText: String {
        switch units {
        case .metric:
            return "\(Int(heightCm.rounded())) cm"
        case .imperial:
            let totalInches = Int((heightCm / 2.54).rounded())
            return "\(totalInches / 12) ft \(totalInches % 12) in"
        }
    }

    private var weightText: String { formatWeight(weightKg) }

    private func formatWeight(_ kg: Double) -> String {
        switch units {
        case .metric: kg.formatted(.number.precision(.fractionLength(1))) + " kg"
        case .imperial: Int((kg / 0.45359237).rounded()).formatted() + " lb"
        }
    }

    private var healthyRangeText: Text {
        let range = BMI.healthyRange(heightCm: heightCm)
        return Text("Healthy weight for your height: \(formatWeight(range.lowerBound)) – \(formatWeight(range.upperBound))")
    }
}

private struct ResultCard: View {
    let bmi: Double
    let category: BMICategory

    var body: some View {
        VStack(spacing: 16) {
            Text(bmi, format: .number.precision(.fractionLength(1)))
                .font(.system(size: 64, weight: .bold, design: .rounded))
                .contentTransition(.numericText(value: bmi))
                .foregroundStyle(category.color)

            Text(category.title)
                .font(.title3.weight(.semibold))
                .padding(.horizontal, 14)
                .padding(.vertical, 6)
                .background(category.color.opacity(0.15), in: Capsule())
                .foregroundStyle(category.color)

            BMIScale(bmi: bmi)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.background, in: RoundedRectangle(cornerRadius: 20))
        .animation(.snappy, value: bmi)
        .accessibilityElement(children: .combine)
    }
}

private struct BMIScale: View {
    let bmi: Double
    private let range = 15.0...40.0

    var body: some View {
        VStack(spacing: 4) {
            GeometryReader { geo in
                let fraction = (min(max(bmi, range.lowerBound), range.upperBound) - range.lowerBound)
                    / (range.upperBound - range.lowerBound)
                ZStack(alignment: .leading) {
                    Capsule()
                        .fill(LinearGradient(
                            stops: [
                                .init(color: .blue, location: 0),
                                .init(color: .green, location: 0.25),
                                .init(color: .green, location: 0.4),
                                .init(color: .orange, location: 0.6),
                                .init(color: .red, location: 1),
                            ],
                            startPoint: .leading, endPoint: .trailing))
                        .frame(height: 10)
                    Circle()
                        .fill(.white)
                        .stroke(.primary.opacity(0.4), lineWidth: 1)
                        .frame(width: 20, height: 20)
                        .shadow(radius: 2)
                        .offset(x: fraction * (geo.size.width - 20))
                }
                .frame(maxHeight: .infinity)
            }
            .frame(height: 20)

            GeometryReader { geo in
                ForEach([15, 18.5, 25, 30, 40], id: \.self) { mark in
                    let fraction = (mark - range.lowerBound) / (range.upperBound - range.lowerBound)
                    Text(mark, format: .number)
                        .fixedSize()
                        .position(x: 10 + fraction * (geo.size.width - 20), y: geo.size.height / 2)
                }
            }
            .frame(height: 14)
            .font(.caption2)
            .foregroundStyle(.secondary)
        }
    }
}

private struct InputCard<Content: View>: View {
    let title: String
    let valueText: String
    let systemImage: String
    @ViewBuilder let content: Content

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Label(title, systemImage: systemImage)
                    .font(.headline)
                Spacer()
                Text(valueText)
                    .font(.title3.monospacedDigit().weight(.semibold))
            }
            content
        }
        .padding()
        .background(.background, in: RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    ContentView()
}
