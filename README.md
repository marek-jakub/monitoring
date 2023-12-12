# MonitoRing

<img src="assets/images/mon_ring_logo.png" align="right"
     alt="MonitoRing project logo." width="100" height="130">

This is a student project, with the main goal of researching bird ringing data management practices and building a high-fidelity, horizontal prototype of a mobile application used in the management of bird ringing data in fieldwork conditions.

## Table of Contents

- [MonitoRing Description](#monitoring-description)
  - [Continuous Development](#continuous-development)
- [Install and run](#install-and-run)
- [How to use](#how-to-use)
- [Testing](#testing)
- [Licence](#licence)

## MonitoRing Description

The application allows bird ringers:

- manage rings (or bands)
- enter bird ringing session data
- enter and manage bird ringing data
- enter and manage re-catch data

The logic in the application draws heavily from EURING Exchange Code 2020. [[1]](#1) Data management relies on forms and local data persistence library. [[2]](#2) The application has been developed using the Dart language and Flutter framework. The framework has been used to allow for single codebase, to be used on Android and iOS devices.

### Continuous Development

WARNING! Even though the prototype is in a working condition, with ability to run accross devices, there are MISSING FEATURES and dead ends. The design and codebase have been developed by one person, this effort is continuous...

## Install and run

The latest version of Flutter used to run and test the application is version 3.16.2, with Dart SDK version: 3.2.2.

After downloading the codebase and placing it at a chosen directory, the application can be run:

Add and enable a device the application to be run on, e.g.:

```bash
flutter create --platform=<platform> .
flutter config --enable-<platform>-desktop
```

For example, using linux as a platform:

```bash
flutter create --platform=linux .
flutter config --enable-linux-desktop
```

Run the application:

```bash
flutter run -d linux
```

To choose from available devices, run:

```bash
flutter run lib/main.dart
```

The available and connected devices will be shown, with the ability to choose the appropriate one.

## How to use

## Testing

Unit tests can be run by applying:

```bash
flutter test
```

or

```bash
flutter test test/unit_test.dart
```

Integration and widget tests are best run from logged out state, as checks are applied progressively from splash screen, log in screen onwards. As the application state manager saves logged in state, running tests with logged in state as true might show failure.

To run widget test, apply:

```bash
flutter test integration_test/widget_tests/home_screen_test.dart
```

Choose from available devices.

To run integration test, apply:

```bash
flutter test integration_test/integration_tests/monitoring_test.dart
```

Choose from available devices.

## Licence

[MIT](https://choosealicense.com/licenses/mit/)

### References

<a id="1">[1] </a>du Feu, C.R. et al. (2020) ‘EURING Exchange Code 2020’. EURING. Available at: https://euring.org/files/documents/E2020ExchangeCodeV201.pdf (Accessed: 5 February 2023).

<a id="2">[2] </a>Binder, S. (2023) drift | Dart Package, Dart packages. Available at: https://pub.dev/packages/drift (Accessed: 8 August 2023).
