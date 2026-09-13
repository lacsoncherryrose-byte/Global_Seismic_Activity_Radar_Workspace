# Global Seismic Activity Radar

A Dart-based command-line application that retrieves and displays earthquake information using the USGS Earthquake API.

## Project Description

The **Global Seismic Activity Radar** is a command-line application developed using Dart. It connects to the USGS Earthquake API to retrieve earthquake information and presents the data through a simple command-line interface.

The project demonstrates API integration, JSON data processing, object-oriented programming, command-line interaction, error handling, logging, terminal styling, and automated testing.

## Objectives

The project aims to:

1. Retrieve earthquake information from the USGS Earthquake API.
2. Process and convert JSON responses into Dart objects.
3. Provide a command-line interface for querying earthquake information.
4. Implement error handling for network and API-related problems.
5. Use terminal colors to improve the command-line interface.
6. Implement logging for application activities and errors.
7. Organize the application using a Dart workspace with multiple packages.
8. Implement automated tests for the project components.

## Features

* Query earthquake information from the USGS API.
* Display earthquake locations and magnitudes.
* Support command-line interaction.
* Handle API and network errors.
* Use terminal colors for improved output.
* Record application errors through logging.
* Convert API JSON data into Dart models.
* Include automated tests.

## Technologies Used

* **Dart**
* **USGS Earthquake API**
* **HTTP**
* **JSON**
* **Dart Testing Framework**
* **ANSI Terminal Colors**
* **Git**
* **GitHub**

## Project Structure

```text
Global_Seismic_Activity_Radar_Workspace/
│
├── terminal_colors/
│   ├── lib/
│   │   ├── src/
│   │   │   ├── ansi.dart
│   │   │   └── terminal_colors_base.dart
│   │   ├── terminal_colors.dart
│   │   └── ...
│   ├── test/
│   └── pubspec.yaml
│
├── seismic_api/
│   ├── lib/
│   │   ├── src/
│   │   │   ├── client.dart
│   │   │   ├── exceptions.dart
│   │   │   ├── models.dart
│   │   │   └── seismic_api_base.dart
│   │   ├── seismic_api.dart
│   │   └── ...
│   ├── test/
│   ├── example/
│   └── pubspec.yaml
│
├── seismic_cli/
│   ├── bin/
│   │   ├── main.dart
│   │   └── seismic_cli.dart
│   ├── lib/
│   │   ├── src/
│   │   │   ├── alert_command.dart
│   │   │   ├── command_base.dart
│   │   │   ├── help_command.dart
│   │   │   ├── logging_config.dart
│   │   │   └── query_command.dart
│   │   └── seismic_cli.dart
│   ├── test/
│   └── pubspec.yaml
│
├── pubspec.yaml
├── pubspec.lock
└── .gitignore
```

## Package Description

### terminal_colors

The `terminal_colors` package provides reusable terminal styling and ANSI color constants for the command-line interface.

### seismic_api

The `seismic_api` package handles communication with the USGS Earthquake API. It also contains the earthquake data models, API client, and exception handling.

### seismic_cli

The `seismic_cli` package provides the command-line interface of the application. It handles user commands, earthquake queries, help commands, alerts, logging, and formatted output.

## Requirements

Before running the project, make sure the following are installed:

* Dart SDK 3.8.1 or later
* Git
* Internet connection

## Installation

Clone the repository:

```bash
git clone https://github.com/lacsoncherryrose-byte/Global_Seismic_Activity_Radar_Workspace.git
```

Navigate to the project directory:

```bash
cd Global_Seismic_Activity_Radar_Workspace
```

Get the project dependencies:

```bash
dart pub get
```

## How to Run

Navigate to the CLI package:

```bash
cd seismic_cli
```

Run the application using the project's configured Dart entry point.

Example:

```bash
dart run
```

## Example Usage

The application can be used to query earthquake information through the command-line interface.

Example command:

```text
seismic > query all
```

Example output:

```text
[INFO] Initiating connection for earthquake query: all

Location: 10 km ENE of Coso Junction, CA
Magnitude: 1.5
```

The displayed earthquake information is retrieved from the USGS Earthquake API.

## API

This project uses the **USGS Earthquake API** to retrieve earthquake data.

The API response contains earthquake information such as:

* Earthquake ID
* Location
* Magnitude

The application processes the JSON response and converts the relevant information into Dart objects before displaying it in the command-line interface.

## Error Handling

The application implements error handling for possible problems such as:

* Network connection failures
* API request failures
* Invalid API responses
* Invalid earthquake data
* Timeout errors

Exceptions are handled using Dart exception handling mechanisms.

## Logging

The CLI package includes logging functionality for recording application events and errors.

Logging helps identify problems during application execution and makes troubleshooting easier.

## Testing

The project contains automated tests for the application components.

To run the tests, use:

```bash
dart test
```

The tests verify important functionality of the API and command-line components.

## Screenshots

Screenshots of the application can be added to this section to demonstrate the actual output and functionality.

### Earthquake Query

The following screenshot shows the earthquake query command executed through the command-line application.

![Earthquake Query](![Uploading Screenshot 2026-09-13 162510.png…])
### Earthquake Results

Add a screenshot showing the earthquake information returned by the application.

### Test Results

Add a screenshot showing the successful test execution.

## GitHub Repository

The source code and project documentation are available in this repository:

**Global Seismic Activity Radar Workspace**

https://github.com/lacsoncherryrose-byte/Global_Seismic_Activity_Radar_Workspace

## Developer

**Chery Rose Lacson**

BSIT 3
Palawan State University – Taytay Campus

## Course

**IT7/L – System Integration and Architecture 1**

## Conclusion

The Global Seismic Activity Radar demonstrates how Dart can be used to build a modular command-line application that communicates with an external API. The project applies software development concepts including API integration, data modeling, error handling, logging, terminal syling, testing, and GitHub-based project management.
