import SwiftUI

struct ContentView: View {
    @State private var units: UnitSystem = .metric
    @State private var heightCm: Double = 175
    @State private var weightKg: Double = 70

    private let lbPerKg = 2.20462
    private let cmPerInch = 2.54

    private var bmi: Double { BMI.value(weightKg: weightKg, heightCm: heightCm) }
    private var category: BMICategory { BMICategory(bmi: bmi) }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    Picker("Units", selection: $units) {
                        ForEach(UnitSystem.allCases) { Text($0.rawValue) }
                    }
                    .pickerStyle(.segmented)

                    resultCard

                    inputCard(
                        title: "Height",
                        value: heightText,
                        binding: $heightCm,
                        range: 100...220,
                        step: units == .metric ? 1 : cmPerInch
                    )

                    inputCard(
                        title: "Weight",
                        value: weightText,
                        binding: $weightKg,
                        range: 30...200,
                        step: units == .metric ? 0.5 : 1 / lbPerKg
                    )

                    healthyRangeCard
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("BMI Calculator")
        }
    }

    // MARK: - Cards

    private var resultCard: some View {
        VStack(spacing: 12) {
            Text("Your BMI")
                .font(.headline)
                .foregroundStyle(.secondary)
            Text(bmi, format: .number.precision(.fractionLength(1)))
                .font(.system(size: 64, weight: .bold, design: .rounded))
                .contentTransition(.numericText(value: bmi))
                .animation(.snappy, value: bmi)
            Text(category.title)
                .font(.title3.weight(.semibold))
                .foregroundStyle(category.color)
            BMIScale(bmi: bmi)
                .padding(.top, 4)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.background, in: .rect(cornerRadius: 20))
    }

    private func inputCard(title: String, value: String, binding: Binding<Double>,
                           range: ClosedRange<Double>, step: Double) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(title).font(.headline)
                Spacer()
                Text(value)
                    .font(.title3.monospacedDigit().weight(.semibold))
            }
            HStack {
                Button { binding.wrappedValue = max(range.lowerBound, binding.wrappedValue - step) } label: {
                    Image(systemName: "minus.circle.fill").font(.title2)
                }
                Slider(value: binding, in: range)
                Button { binding.wrappedValue = min(range.upperBound, binding.wrappedValue + step) } label: {
                    Image(systemName: "plus.circle.fill").font(.title2)
                }
            }
            .buttonStyle(.borderless)
        }
        .padding()
        .background(.background, in: .rect(cornerRadius: 20))
    }

    private var healthyRangeCard: some View {
        let range = BMI.healthyRange(heightCm: heightCm)
        return HStack {
            Image(systemName: "heart.fill").foregroundStyle(.green)
            Text("Healthy weight for your height: **\(format(weightKg: range.lowerBound)) – \(format(weightKg: range.upperBound))**")
                .font(.subheadline)
            Spacer(minLength: 0)
        }
        .padding()
        .background(.background, in: .rect(cornerRadius: 20))
    }

    // MARK: - Formatting

    private var heightText: String {
        switch units {
        case .metric:
            return "\(Int(heightCm.rounded())) cm"
        case .imperial:
            let totalInches = Int((heightCm / cmPerInch).rounded())
            return "\(totalInches / 12)′ \(totalInches % 12)″"
        }
    }

    private var weightText: String { format(weightKg: weightKg) }

    private func format(weightKg kg: Double) -> String {
        switch units {
        case .metric: kg.formatted(.number.precision(.fractionLength(1))) + " kg"
        case .imperial: "\(Int((kg * lbPerKg).rounded())) lb"
        }
    }
}

/// Colored bar from BMI 15 to 40 with a marker at the current value.
struct BMIScale: View {
    let bmi: Double
    private let lower = 15.0, upper = 40.0
    private let bands: [(end: Double, color: Color)] = [
        (18.5, .blue), (25, .green), (30, .orange), (40, .red)
    ]

    var body: some View {
        VStack(spacing: 4) {
            GeometryReader { geo in
                let w = geo.size.width
                ZStack(alignment: .leading) {
                    HStack(spacing: 2) {
                        ForEach(bands.indices, id: \.self) { i in
                            let start = i == 0 ? lower : bands[i - 1].end
                            bands[i].color
                                .frame(width: w * (bands[i].end - start) / (upper - lower) - 2)
                        }
                    }
                    .clipShape(.capsule)
                    .frame(height: 10)

                    Circle()
                        .fill(.white)
                        .stroke(.primary, lineWidth: 2)
                        .frame(width: 18, height: 18)
                        .offset(x: w * position - 9)
                        .animation(.snappy, value: bmi)
                }
                .frame(height: 18)
            }
            .frame(height: 18)

            GeometryReader { geo in
                ForEach([lower, 18.5, 25, 30, upper], id: \.self) { mark in
                    Text(mark, format: .number)
                        .fixedSize()
                        .frame(width: 40)
                        .position(x: geo.size.width * fraction(mark), y: 6)
                }
            }
            .frame(height: 12)
            .font(.caption2)
            .foregroundStyle(.secondary)
        }
    }

    private var position: Double { fraction(bmi) }

    private func fraction(_ value: Double) -> Double {
        (min(max(value, lower), upper) - lower) / (upper - lower)
    }
}

#Preview {
    ContentView()
}
