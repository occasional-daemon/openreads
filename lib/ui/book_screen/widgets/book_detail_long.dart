import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:openreads/core/themes/app_theme.dart';

class BookDetailLong extends StatelessWidget {
  const BookDetailLong({
    super.key,
    required this.title,
    required this.text,
    this.render_md = false,
  });

  final String title;
  final String text;
  final bool render_md;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              height: 0.5,
            ),
          ),
          Divider(
            color: Theme.of(context).colorScheme.onSurface.withAlpha(25),
          ),
          const SizedBox(height: 5),
          render_md
              ? MarkdownBody(
                  // replace nl with space-space-nl
                  // to support non-md style single linebreaks
                  // and provide backward compatibility
                  data: text.replaceAll("\n", "  \n"),
                  onTapLink: (_, url, __) {
                    launchUrl(Uri.parse(url!));
                  },
                  styleSheet: MarkdownStyleSheet(
                    p: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                )
              : Text(
                  text,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
        ],
      ),
    );
  }
}
