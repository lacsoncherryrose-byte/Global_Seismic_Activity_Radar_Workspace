import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:seismic_api/seismic_api.dart';
import 'package:seismic_cli/src/alert_command.dart';
import 'package:seismic_cli/src/command_base.dart';
import 'package:seismic_cli/src/help_command.dart';
import 'package:seismic_cli/src/logging_config.dart';
import 'package:seismic_cli/src/query_command.dart';
import 'package:terminal_colors/terminal_colors.dart';

Future<void> main() async {
  configureSystemTelemetry();

  final httpClient = http.Client();
  final apiClient = SeismicApiClient(httpClient);

  // Register commands polymorphically.
  final commands = <CliCommand>[QueryCommand(), AlertCommand(), HelpCommand()];

  print('Welcome to the Global Seismic Activity Radar CLI!'.styleHeader);

  try {
    while (true) {
      stdout.write('\nseismic > ');

      final input = stdin.readLineSync();

      if (input == null || input.trim().toLowerCase() == 'exit') {
        print('Exiting platform...'.styleWarning);
        break;
      }

      final trimmed = input.trim();

      if (trimmed.isEmpty) {
        continue;
      }

      final parts = trimmed.split(RegExp(r'\s+'));
      final commandName = parts.first;
      final args = parts.sublist(1);

      CliCommand? command;

      for (final candidate in commands) {
        if (candidate.name == commandName) {
          command = candidate;
          break;
        }
      }

      if (command != null) {
        await command.execute(apiClient, args);
      } else {
        print(
          'Unknown command. Type "help" for available commands.'.styleError,
        );
      }
    }
  } finally {
    httpClient.close();

    print('System network socket disconnected successfully.'.styleSuccess);
  }
}
