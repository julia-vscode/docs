# Privacy 

You can help improve the Julia VS Code extension by sending usage statistics and exceptions to the development team. By default, telemetry and crash report data are not collected, but rather the user has to opt-in to have their data sent. 

## Opt-In Policy

By default both ``julia.enableTelemetry`` and ``julia.enableCrashReporter`` are set to ``null``.  With the `null` setting, no data is sent to the development team. The UI does send a prompt asking the user to agree to enabling the settings for telemetry and crash report. Without opting in, your data is not sent to the development team. 

# Collected Data

If the ``julia.enableTelemetry`` setting is configured to be ``true``, anonymous, non-identifying usage and error data is sent to the development team.

When the ``julia.enableCrashReporter`` setting is configured to be ``true``, stack traces from errors in the extension are sent to the development team. Those stack traces can contain identifying information, for example filenames.

This information is collected and sent via Azure Application Insights.

# Disabling telemetry

To disable telemetry and not report any usage data or crash reports, set the ``julia.enableTelemetry`` and ``julia.enableCrashReporter`` setting to ``false``.

# Use of the collected data

The collected data is used to improve the julia VS Code extension. We don't sell the information. We might sometimes publish anonymous statistics (for example number of users etc.)
