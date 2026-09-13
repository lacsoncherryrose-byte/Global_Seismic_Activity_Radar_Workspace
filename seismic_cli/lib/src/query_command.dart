import 'package:seismic_api/seismic_api.dart';
import 'package:terminal_colors/terminal_colors.dart';

import 'command_base.dart';

class QueryCommand extends CliCommand {
  QueryCommand()
    : super('query', 'Fetch global earthquake data from the USGS API.');

  @override
  Future<void> execute(SeismicApiClient client, List<String> arguments) async {
    if (arguments.isEmpty) {
      print('Usage: query <all|4.5>'.styleError);
      return;
    }

    final target = arguments.first.toLowerCase();

    const validTargets = {'all', '4.5'};

    if (!validTargets.contains(target)) {
      print('Invalid query target: $target'.styleError);
      print('Valid targets: all, 4.5'.styleWarning);
      return;
    }

    try {
      final result = await client.fetchMetadata(target);

      final buffer = StringBuffer()
        ..writeln('--- SEISMIC ACTIVITY REPORT ---'.styleHeader)
        ..writeln('Identifier:  ${result.id}'.styleSuccess)
        ..writeln('Location:    ${result.place}')
        ..writeln('Magnitude:   ${result.magnitude}')
        ..writeln('-------------------------------'.styleHeader);

      print(buffer.toString());
    } on SeismicException catch (e) {
      print('Operation Failed: ${e.message}'.styleError);
    }
  }
}
