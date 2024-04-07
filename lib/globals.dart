import 'package:url_launcher/url_launcher.dart';

launchWeb({required String url}) async {
  await launchUrl(Uri.tryParse(url) ?? Uri.parse("https://example.com/"));
}
