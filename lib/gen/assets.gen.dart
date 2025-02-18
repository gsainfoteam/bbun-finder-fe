/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/chick.svg
  SvgGenImage get chick => const SvgGenImage('assets/icons/chick.svg');

  /// File path: assets/icons/default_1.svg
  SvgGenImage get default1 => const SvgGenImage('assets/icons/default_1.svg');

  /// File path: assets/icons/default_2.svg
  SvgGenImage get default2 => const SvgGenImage('assets/icons/default_2.svg');

  /// File path: assets/icons/default_3.svg
  SvgGenImage get default3 => const SvgGenImage('assets/icons/default_3.svg');

  /// File path: assets/icons/default_4.svg
  SvgGenImage get default4 => const SvgGenImage('assets/icons/default_4.svg');

  /// File path: assets/icons/delete.svg
  SvgGenImage get delete => const SvgGenImage('assets/icons/delete.svg');

  /// File path: assets/icons/detail_page_deco.svg
  SvgGenImage get detailPageDeco =>
      const SvgGenImage('assets/icons/detail_page_deco.svg');

  /// File path: assets/icons/devider_1.svg
  SvgGenImage get devider1 => const SvgGenImage('assets/icons/devider_1.svg');

  /// File path: assets/icons/devider_2.svg
  SvgGenImage get devider2 => const SvgGenImage('assets/icons/devider_2.svg');

  /// File path: assets/icons/devider_3.svg
  SvgGenImage get devider3 => const SvgGenImage('assets/icons/devider_3.svg');

  /// File path: assets/icons/four_leaf.svg
  SvgGenImage get fourLeaf => const SvgGenImage('assets/icons/four_leaf.svg');

  /// File path: assets/icons/gallery.svg
  SvgGenImage get gallery => const SvgGenImage('assets/icons/gallery.svg');

  /// File path: assets/icons/main_page_deco.svg
  SvgGenImage get mainPageDeco =>
      const SvgGenImage('assets/icons/main_page_deco.svg');

  /// File path: assets/icons/onboarding_line.svg
  SvgGenImage get onboardingLine =>
      const SvgGenImage('assets/icons/onboarding_line.svg');

  /// File path: assets/icons/one_leaf.svg
  SvgGenImage get oneLeaf => const SvgGenImage('assets/icons/one_leaf.svg');

  /// File path: assets/icons/star_clip.svg
  SvgGenImage get starClip => const SvgGenImage('assets/icons/star_clip.svg');

  /// File path: assets/icons/three_leaf.svg
  SvgGenImage get threeLeaf => const SvgGenImage('assets/icons/three_leaf.svg');

  /// File path: assets/icons/two_leaf.svg
  SvgGenImage get twoLeaf => const SvgGenImage('assets/icons/two_leaf.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
    chick,
    default1,
    default2,
    default3,
    default4,
    delete,
    detailPageDeco,
    devider1,
    devider2,
    devider3,
    fourLeaf,
    gallery,
    mainPageDeco,
    onboardingLine,
    oneLeaf,
    starClip,
    threeLeaf,
    twoLeaf,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/paper.png
  AssetGenImage get paper => const AssetGenImage('assets/images/paper.png');

  /// List of all assets
  List<AssetGenImage> get values => [paper];
}

class Assets {
  const Assets._();

  static const String aEnv = '.env';
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();

  /// List of all assets
  static List<String> get values => [aEnv];
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
