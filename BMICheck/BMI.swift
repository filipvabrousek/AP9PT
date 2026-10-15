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
        case .normal: "Healthy weight"
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
    /// BMI = weight (kg) / height (m)²
    static func value(weightKg: Double, heightCm: Double) -> Double {
        let m = heightCm / 100
        guard m > 0 else { return 0 }
        return weightKg / (m * m)
    }

    /// Weight range (kg) that gives a BMI of 18.5–24.9 at the given height.
    static func healthyRange(heightCm: Double) -> ClosedRange<Double> {
        let m2 = pow(heightCm / 100, 2)
        return (18.5 * m2)...(24.9 * m2)
    }
}
