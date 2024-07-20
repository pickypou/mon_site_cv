import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../theme/theme.dart';

class InfoProfil extends HookWidget {
  final String docUrl;

  const InfoProfil({Key? key, required this.docUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contenu = useState<String>("...");

    useEffect(() {
      rootBundle.loadString(docUrl).then((value) {
        contenu.value = value;
      }).catchError((error) {
        print("Error loading Markdown file: $error");
      });
      return null;
    }, [docUrl]);

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
        child: MarkdownBody(
          data: contenu.value,
          styleSheet: getMDTheme(context, Colors.white),
          onTapLink: (text, url, title) {
            if (url != null) {
              launchUrl(Uri.parse(url));
            }
          },
        ),
      ),
    );
  }
}
