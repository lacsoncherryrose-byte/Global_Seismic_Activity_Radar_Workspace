import 'package:seismic_api/seismic_api.dart';
import 'package:terminal_colors/terminal_colors.dart';

import 'command_base.dart';

class HelpCommand extends CliCommand {
  HelpCommand() : super('help', 'Displays available seismic radar commands.');

  @override
  Future<void> execute(SeismicApiClient client, List<String> arguments) async {
    final buffer = StringBuffer()
      ..writeln('=== GLOBAL SEISMIC ACTIVITY RADAR ==='.styleHeader)
      ..writeln()
      ..writeln('Available Commands:')
      ..writeln()
      ..writeln('  query <target>'.styleSuccess)
      ..writeln('      Fetch current earthquake information.')
      ..writeln()
      ..writeln('  alert'.styleError)
      ..writeln('      Display high-magnitude earthquake hazards.')
      ..writeln()
      ..writeln('  help'.styleSuccess)
      ..writeln('      Display this help information.')
      ..writeln()
      ..writeln('  exit'.styleWarning)
      ..writeln('      Exit the Global Seismic Activity Radar CLI.')
      ..writeln()
      ..writeln('======================================'.styleHeader);

    print(buffer.toString());
  }
}
