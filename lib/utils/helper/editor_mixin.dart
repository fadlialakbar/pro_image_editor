import 'package:flutter/material.dart';
import 'package:pro_image_editor/pro_image_editor.dart';

mixin ImageEditorMixin on StatefulWidget {
  /// Configuration options for the editor.
  ProImageEditorConfigs get configs;
}

mixin ImageEditorStateMixin<T extends StatefulWidget> on State<T> {
  ImageEditorMixin get _widget => (widget as ImageEditorMixin);

  ProImageEditorConfigs get configs => _widget.configs;

  PaintEditorConfigs get paintEditorConfigs => configs.paintEditorConfigs;
  TextEditorConfigs get textEditorConfigs => configs.textEditorConfigs;
  CropRotateEditorConfigs get cropRotateEditorConfigs => configs.cropRotateEditorConfigs;
  FilterEditorConfigs get filterEditorConfigs => configs.filterEditorConfigs;
  BlurEditorConfigs get blurEditorConfigs => configs.blurEditorConfigs;
  EmojiEditorConfigs get emojiEditorConfigs => configs.emojiEditorConfigs;
  StickerEditorConfigs? get stickerEditorConfigs => configs.stickerEditorConfigs;

  ImageEditorDesignModeE get designMode => configs.designMode;
  ImageEditorTheme get imageEditorTheme => configs.imageEditorTheme;
  ImageEditorCustomWidgets get customWidgets => configs.customWidgets;
  ImageEditorIcons get icons => configs.icons;
  I18n get i18n => configs.i18n;
  ImportStateHistory? get initStateHistory => configs.initStateHistory;
  HelperLines get helperLines => configs.helperLines;
  String get heroTag => configs.heroTag;
}