import 'package:seismic_api/seismic_api.dart';
import 'package:terminal_colors/terminal_colors.dart';

import 'command_base.dart';

class AlertCommand extends CliCommand {
  AlertCommand()
    : super(
        'alert',
        'Displays high-magnitude earthquake hazards from the last 24 hours.',
      );

  @override
  Future<void> execute(SeismicApiClient client, List<String> arguments) async {
    try {
      final alerts = await client.fetchAlerts();

      if (alerts.isEmpty) {
        print(
          'No high-magnitude hazards detected in the last 24 hours.'
              .styleSuccess,
        );
        return;
      }

      final buffer = StringBuffer()
        ..writeln('--- HIGH-MAGNITUDE EARTHQUAKE ALERTS ---'.styleHeader);

      for (final earthquake in alerts) {
        buffer
          ..writeln(
            '⚠ HAZARD: M${earthquake.magnitude.toStringAsFixed(1)}'.styleError,
          )
          ..writeln('ID:       ${earthquake.id}')
          ..writeln('Location: ${earthquake.place}')
          ..writeln('-----------------------------------------');
      }

      print(buffer.toString());
    } on SeismicException catch (e) {
      print('Alert retrieval failed: ${e.message}'.styleError);
    }
  }
}
