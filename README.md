# Napp Distribution Plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-napp_distribution)

## Getting Started

This project is a [_fastlane_](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-napp_distribution`, add it to your project by running:

```bash
fastlane add_plugin napp_distribution
```

## About 

Upload a new build to Napp Distribution to distribute the build to beta testers. Works for both Ad Hoc and Enterprise signed applications. The `fastlane-plugin-napp_distribution` action can upload both iOS apps (IPAs) and Android apps (APKs).

## Example

Use the following snippet in your lane

```bash
napp_distribution(
	api_key: "my-api-key",
	client_id: "app-name",
	file_path: "path/to/the/app.ipa"
)
```

## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.

## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://docs.fastlane.tools/plugins/plugins-troubleshooting/) guide.


## About _fastlane_

_fastlane_ is the easiest way to automate beta deployments and releases for your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).

