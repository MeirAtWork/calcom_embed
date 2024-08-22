library calcom_embed;

import 'dart:io';

import 'package:mustache_template/mustache_template.dart';

import 'calcom_embed_options.dart';

/// A Calculator.
class CalcomEmbed {
  CalcomEmbed(this.options);

  CalcomEmbedOptions options;
  
  String build() {
    var map = options.toMap();

    final file = File('lib/inlineTemplate.hsb');
    String text = file.readAsStringSync();
    var template = Template(text);
    var output = template.renderString(map);
    
    return output;
  }
}
