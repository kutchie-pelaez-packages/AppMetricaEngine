import AnalyticsTracker
import CoreUtils

public struct AppMetricaEngineFactory {
    public init() { }

    public func produce(
        apiKey: String,
        environment: Environment
    ) -> AnalyticsTracker {
        AppMetricaEngine(
            apiKey: apiKey,
            environment: environment
        )
    }
}
