import 'package:flutter/material.dart';
import 'package:pro_image_editor/pro_image_editor.dart';

import '../utils/example_helper.dart';
import '../utils/import_history_demo_data.dart';

class ImportExportExample extends StatefulWidget {
  const ImportExportExample({super.key});

  @override
  State<ImportExportExample> createState() => _ImportExportExampleState();
}

class _ImportExportExampleState extends State<ImportExportExample>
    with ExampleHelperState<ImportExportExample> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => _buildEditor(),
          ),
        );
      },
      leading: const Icon(Icons.import_export_outlined),
      title: const Text('Import and Export state history'),
      trailing: const Icon(Icons.chevron_right),
    );
  }

  Widget _buildEditor() {
    return Stack(
      children: [
        ProImageEditor.asset(
          'assets/demo.png',
          key: editorKey,
          callbacks: ProImageEditorCallbacks(
            onImageEditingComplete: onImageEditingComplete,
            onCloseEditor: onCloseEditor,
          ),
          configs: ProImageEditorConfigs(
            allowCompleteWithEmptyEditing: true,
            initStateHistory: ImportStateHistory.fromMap(
              importHistoryDemoData,
              configs: const ImportEditorConfigs(
                recalculateSizeAndPosition: true,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 2 * kBottomNavigationBarHeight,
          left: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.lightBlue.shade200,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
            ),
            child: IconButton(
              onPressed: () async {
                var history = editorKey.currentState!.exportStateHistory(
                  configs: const ExportEditorConfigs(
                      // configs...
                      ),
                );
                debugPrint(await history.toJson());
              },
              icon: const Icon(Icons.send_to_mobile_outlined),
            ),
          ),
        ),
      ],
    );
  }
}