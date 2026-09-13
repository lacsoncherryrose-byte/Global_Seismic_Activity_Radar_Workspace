import 'package:http/http.dart' as http;
import 'package:seismic_api/seismic_api.dart';
import 'package:seismic_cli/seismic_cli.dart';

Future<void> main(List<String> arguments) async {
  final client = SeismicApiClient(http.Client());

  try {
    if (arguments.isEmpty) {
      await HelpCommand().execute(client, []);
      return;
    }

    final commandName = arguments.first;
    final commandArguments = arguments.skip(1).toList();

    final CliCommand command = switch (commandName) {
      'query' => QueryCommand(),
      'help' => HelpCommand(),
      _ => HelpCommand(),
    };

    await command.execute(client, commandArguments);
  } finally {
    client.close();
  }
}
