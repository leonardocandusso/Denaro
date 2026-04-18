import 'dart:io';

void main() async {
  print('Baixando fontes TTF puras para garantir Offline Mode...');
  // Links direitos RAW do repositório core do Google Fonts
  final interUrl = Uri.parse('https://github.com/google/fonts/raw/main/ofl/inter/Inter%5Bslnt%2Cwght%5D.ttf');
  final robotoUrl = Uri.parse('https://github.com/google/fonts/raw/main/apache/robotomono/RobotoMono%5Bwght%5D.ttf');

  await _download(interUrl, 'assets/fonts/Inter.ttf');
  await _download(robotoUrl, 'assets/fonts/RobotoMono.ttf');
  print('Fontes encriptadas locais instaladas com sucesso!');
}

Future<void> _download(Uri url, String path) async {
  final client = HttpClient();
  final request = await client.getUrl(url);
  final response = await request.close();
  final bytes = await response.expand((b) => b).toList();
  await File(path).writeAsBytes(bytes);
  print('[*] Arquivo binário $path salvo.');
}
