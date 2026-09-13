import 'package:test/test.dart';
import 'package:seismic_cli/seismic_cli.dart';

void main() {
  test('CLI commands are available', () {
    final queryCommand = QueryCommand();
    final helpCommand = HelpCommand();

    expect(queryCommand.name, 'query');
    expect(helpCommand.name, 'help');
  });
}
