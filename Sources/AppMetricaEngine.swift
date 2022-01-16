import AnalyticsEvent
import AnalyticsTracker
import CoreUtils
import YandexMobileMetrica

final class AppMetricaEngine: AnalyticsTracker {
    init(
        apiKey: String,
        environment: Environment
    ) {
        self.apiKey = apiKey
        self.environment = environment
    }

    private let apiKey: String
    private let environment: Environment

    // MARK: - Startable

    func start() {
        guard
            environment.isProd,
            let configuration = YMMYandexMetricaConfiguration(apiKey: apiKey)
        else {
            return
        }

        YMMYandexMetrica.activate(with: configuration)
    }

    // MARK: - CustomStringConvertible

    var description: String {
        "AppMetrica"
    }

    // MARK: - AnalyticsEngine

    func track(_ event: AnalyticsEvent) {
        guard environment.isProd else { return }

        YMMYandexMetrica.reportEvent(
            event.name,
            parameters: event.parameters
        )
    }

    func track(_ userProperties: AnalyticsUserProperties) {
        guard environment.isProd else { return }

        let profile = YMMMutableUserProfile()
        var updates = [YMMUserProfileUpdate]()

        for key in userProperties.keys {
            guard let value = userProperties[key] else { continue }

            if let stringValue = value as? String {
                updates.append(YMMProfileAttribute.customString(key).withValue(stringValue))
            } else if let boolValue = value as? Bool {
                updates.append(YMMProfileAttribute.customBool(key).withValue(boolValue))
            } else if let doubleValue = value as? Double {
                updates.append(YMMProfileAttribute.customNumber(key).withValue(doubleValue))
            } else if let intValue = value as? Int {
                updates.append(YMMProfileAttribute.customNumber(key).withValue(Double(intValue)))
            } else {
                appAssertionFailure()
            }
        }

        profile.apply(from: updates)
        YMMYandexMetrica.report(profile)
    }
}
