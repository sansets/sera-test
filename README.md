# sera_test

A new Flutter project.

## Demo

apk: https://drive.google.com/file/d/1TbigNShjohcotz39B2SCgAGz1RB4Fv8i/view?usp=drive_link

## Getting Started

### Setup Environment

1. Create `env` directory in project's root directory
2. Create environment-specific files in `env` directory: `development.json`, `staging.json`, `production.json`

Sample json files:
```json
{
    "flavor": "development/staging/production",
    "base_url": "YOUR_BASE_URL"
}
```

### Run Project

Use option `--dart-define-from-file=env/ENVIRONMENT.json` to run project.

Example:
```
flutter run lib/main.dart --dart-define-from-file=env/development.json
```

## Lints

Current lints status: <img align="center" src="https://github.com/sansets/sera-test/actions/workflows/analyze.yml/badge.svg">

Running lints on local:
```
flutter analyze
```
