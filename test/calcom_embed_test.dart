import 'dart:io';

import 'package:calcom_embed/calcom_embed.dart';
import 'package:calcom_embed/calcom_embed_options.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mustache_template/mustache_template.dart';

void main() {
  test('build works for minha', () {
    final calcomEmbed = CalcomEmbed(
      CalcomEmbedOptions(
        CalcomEmbedSize(100, 100),
        "http://localhost:3000",
        "beit-hamikdash",
        "minha",
        "month_view",
        false)
      );

    var output = calcomEmbed.build();

    final file = File('test/inlineMinha.html');
    String expected = file.readAsStringSync();

    expect(output, expected);
  });

  test('build works for shlamim', () {
    final calcomEmbed = CalcomEmbed(
      CalcomEmbedOptions(
        CalcomEmbedSize(100, 100),
        "http://localhost:3000",
        "beit-hamikdash",
        "shlamim",
        "month_view",
        false)
      );

    var output = calcomEmbed.build();

    final file = File('test/inlineShlamim.html');
    String expected = file.readAsStringSync();

    expect(output, expected);
  });

  test('one variable test', () {
    String text = "{{meir}}";
    var template = Template(text);
    var output = template.renderString({'meir': 'hi'});
    expect(output, "hi");
  });

  test('object test', () {
    String text = "hi {{person.name}}";
    var template = Template(text);
    var output = template.renderString({'person': {'name':'meir'}});
    expect(output, "hi meir");
  });

  test('Options SizeWidth test', () {
    String text = "hi {{size.width}}";
    var template = Template(text);
    var options = CalcomEmbedOptions(CalcomEmbedSize(10, 10), "is", "it", "going", "somewhere", false);
    var map = options.toMap();
    var output = template.renderString(map);
    expect(output, "hi 10");
  });

  test('Options host (not using unicode) test', () {
    String text = "hi {{{host}}}";
    var template = Template(text);
    var options = CalcomEmbedOptions(CalcomEmbedSize(10, 10), "http://localhost:3000", "it", "going", "somewhere", false);
    var map = options.toMap();
    var output = template.renderString(map);
    expect(output, "hi http://localhost:3000");
  });
}
