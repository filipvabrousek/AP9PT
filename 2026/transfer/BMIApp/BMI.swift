import SwiftUI

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

enum BMI {
    /// BMI from weight in kilograms and height in centimetres.
    static func calculate(weightKg: Double, heightCm: Double) -> Double {
        guard heightCm > 0 else { return 0 }
        let m = heightCm / 100
        return weightKg / (m * m)
    }

    /// Weight range (kg) that gives a normal BMI (18.5–24.9) for the given height.
    static func healthyRange(heightCm: Double) -> ClosedRange<Double> {
        let m = heightCm / 100
        return (18.5 * m * m)...(24.9 * m * m)
    }
}
