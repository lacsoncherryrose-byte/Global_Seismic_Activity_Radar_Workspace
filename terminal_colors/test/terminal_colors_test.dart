import 'package:terminal_colors/terminal_colors.dart';
import 'package:test/test.dart';

void main() {
  test('color extension works', () {
    final result = 'Hello'.color(TerminalColor.cyan);

    expect(result, contains('Hello'));
    expect(result, contains('\x1B[36m'));
  });

  test('style methods work', () {
    expect('Header'.styleHeader, contains('Header'));
    expect('Success'.styleSuccess, contains('Success'));
    expect('Warning'.styleWarning, contains('Warning'));
    expect('Error'.styleError, contains('Error'));
  });
}
