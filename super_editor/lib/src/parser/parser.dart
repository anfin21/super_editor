import 'package:super_editor/super_editor.dart';

const pType = 'p';
const loType = 'lo';
const luType = 'lu';

extension DocumentParser on MutableDocument {
  List<Map<String, dynamic>> toJson() {
    final list = <Map<String, dynamic>>[];
    this.nodes.forEach((n) {
      if (n is TextNode) {
        final att = n.text;
        final text = att.text;
        final style = att.spans.markers.map((m) => m.toJson()).toList();
        if (n is ParagraphNode) {
          list.add({
            'type': pType,
            'text': text,
            'style': style,
            'node_id': n.id,
          });
        } else if (n is ListItemNode) {
          if (n.type == ListItemType.ordered) {
            list.add({
              'type': loType,
              'text': text,
              'style': style,
              'node_id': n.id,
            });
          } else {
            list.add({
              'type': luType,
              'text': text,
              'style': style,
              'node_id': n.id,
            });
          }
        }
      }
    });
    return list;
  }

  static List<DocumentNode> fromJson(List<Map<String, dynamic>> list) {
    final nodes = <DocumentNode>[];

    list.forEach((l) {
      final id = l['node_id'] ?? DocumentEditor.createNodeId();
      final type = l['type'] ?? pType;

      final text = l['text'] ?? '';
      final style = ((l['style'] ?? []) as List).cast<Map>();
      final markers = style
          .map((s) => SpanMarker.fromJson(s as Map<String, dynamic>))
          .toList();
      final att = AttributedText(
        text: text,
        spans: AttributedSpans(attributions: markers),
      );

      if (type == pType) {
        nodes.add(ParagraphNode(
          id: id,
          text: att,
        ));
      } else if (type == loType) {
        nodes.add(ListItemNode.ordered(
          id: id,
          text: att,
        ));
      } else if (type == luType) {
        nodes.add(ListItemNode.unordered(
          id: id,
          text: att,
        ));
      }
    });

    return nodes;
  }
}
