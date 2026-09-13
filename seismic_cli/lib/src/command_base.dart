import 'package:seismic_api/seismic_api.dart';

abstract class CliCommand {
  final String name;
  final String description;

  CliCommand(this.name, this.description);

  Future<void> execute(SeismicApiClient client, List<String> arguments);
}
