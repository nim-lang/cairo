# cairo - a vector graphics library with display and print output
#
# Copyright © 2002 University of Southern California
# Copyright © 2005 Red Hat, Inc.
#
# This library is free software; you can redistribute it and/or
# modify it either under the terms of the GNU Lesser General Public
# License version 2.1 as published by the Free Software Foundation
# (the "LGPL") or, at your option, under the terms of the Mozilla
# Public License Version 1.1 (the "MPL"). If you do not alter this
# notice, a recipient may use your version of this file under either
# the MPL or the LGPL.
#
# You should have received a copy of the LGPL along with this library
# in the file COPYING-LGPL-2.1; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
# You should have received a copy of the MPL along with this library
# in the file COPYING-MPL-1.1
#
# The contents of this file are subject to the Mozilla Public License
# Version 1.1 (the "License"); you may not use this file except in
# compliance with the License. You may obtain a copy of the License at
# http://www.mozilla.org/MPL/
#
# This software is distributed on an "AS IS" basis, WITHOUT WARRANTY
# OF ANY KIND, either express or implied. See the LGPL or the MPL for
# the specific language governing rights and limitations.
#
# The Original Code is the cairo graphics library.
#
# The Initial Developer of the Original Code is University of Southern
# California.
#
# Contributor(s):
#	Carl D. Worth <cworth@cworth.org>
#
# This FreePascal binding generated August 26, 2005
# by Jeffrey Pohlmeyer <yetanothergeek@yahoo.com>
#
# - Updated to cairo version 1.4
# - Grouped OS specific fuctions in separated units
# - Organized the functions by group and ordered exactly as the c header
# - Cleared parameter list syntax according to pascal standard
#
# By Luiz Américo Pereira Câmara
# October 2007
#


include "cairo_pragma.nim"

type
  Status* = enum
    StatusSuccess = 0,
    StatusNoMemory,
    StatusInvalidRestore,
    StatusInvalidPopGroup,
    StatusNoCurrentPoint,
    StatusInvalidMatrix,
    StatusInvalidStatus,
    StatusNullPointer,
    StatusInvalidString,
    StatusInvalidPathData,
    StatusReadError,
    StatusWriteError,
    StatusSurfaceFinished,
    StatusSurfaceTypeMismatch,
    StatusPatternTypeMismatch,
    StatusInvalidContent,
    StatusInvalidFormat,
    StatusInvalidVisual,
    StatusFileNotFound,
    StatusInvalidDash,
    StatusInvalidDscComment,
    StatusInvalidIndex,
    StatusClipNotRepresentable,
    StatusTempFileError,
    StatusInvalidStride,
    StatusFontTypeMismatch,
    StatusUserFontImmutable,
    StatusUserFontError,
    StatusNegativeCount,
    StatusInvalidClusters,
    StatusInvalidSlant,
    StatusInvalidWeight

  Operator* = enum
    OperatorClear,
    OperatorSource,
    OperatorOver,
    OperatorIn,
    OperatorOut,
    OperatorAtop,
    OperatorDest,
    OperatorDestOver,
    OperatorDestIn,
    OperatorDestOut,
    OperatorDestAtop,
    OperatorXor,
    OperatorAdd,
    OperatorSaturate,
    OperatorMultiply,
    OperatorScreen,
    OperatorOverlay,
    OperatorDarken,
    OperatorLighten,
    OperatorColorDodge,
    OperatorColorBurn,
    OperatorHardLight,
    OperatorSoftLight,
    OperatorDifference,
    OperatorExclusion,
    OperatorHslHue,
    OperatorHslSaturation,
    OperatorHslColor,
    OperatorHslLuminosity

  Antialias* = enum
    AntialiasDefault, AntialiasNone, AntialiasGray, AntialiasSubpixel
  FillRule* = enum
    FillRuleWinding, FillRuleEvenOdd
  LineCap* = enum
    LineCapButt, LineCapRound, LineCapSquare
  LineJoin* = enum
    LineJoinMiter, LineJoinRound, LineJoinBevel
  FontSlant* = enum
    FontSlantNormal, FontSlantItalic, FontSlantOblique
  FontWeight* = enum
    FontWeightNormal, FontWeightBold
  SubpixelOrder* = enum
    SubpixelOrderDefault, SubpixelOrderRgb, SubpixelOrderBgr,
    SubpixelOrderVrgb, SubpixelOrderVbgr
  HintStyle* = enum
    HintStyleDefault, HintStyleNone, HintStyleSlight, HintStyleMedium,
    HintStyleFull
  HintMetrics* = enum
    HintMetricsDefault, HintMetricsOff, HintMetricsOn
  PathDataType* = enum
    PathMoveTo, PathLineTo, PathCurveTo, PathClosePath
  Content* = enum
    ContentColor = 0x00001000, ContentAlpha = 0x00002000,
    ContentColorAlpha = 0x00003000
  Format* = enum
    FormatArgb32, FormatRgb24, FormatA8, FormatA1
  Extend* = enum
    ExtendNone, ExtendRepeat, ExtendReflect, ExtendPad
  Filter* = enum
    FilterFast, FilterGood, FilterBest, FilterNearest, FilterBilinear,
    FilterGaussian
  FontType* = enum
    FontTypeToy, FontTypeFt, FontTypeWin32, FontTypeAtsui
  PatternType* = enum
    PatternTypeSolid, PatternTypeSurface, PatternTypeLinear,
    PatternTypeRadial
  SurfaceType* = enum
    SurfaceTypeImage, SurfaceTypePdf, SurfaceTypePs, SurfaceTypeXlib,
    SurfaceTypeXcb, SurfaceTypeGlitz, SurfaceTypeQuartz,
    SurfaceTypeWin32, SurfaceTypeBeos, SurfaceTypeDirectfb,
    SurfaceTypeSvg, SurfaceTypeOs2
  SvgVersion* = enum
    SvgVersion11, SvgVersion12
  CairoBool* = int32
  DestroyFunc* = proc (data: pointer) {.cdecl.}
  WriteFunc* = proc (closure: pointer, data: cstring, len: int32): Status {.cdecl.}
  ReadFunc* = proc (closure: pointer, data: cstring, len: int32): Status {.cdecl.}
  Context*{.final.} = object
  Surface*{.final.} = object
  Pattern*{.final.} = object
  ScaledFont*{.final.} = object
  FontFace*{.final.} = object
  FontOptions*{.final.} = object
  Matrix*{.final.} = object
    xx*: float64
    yx*: float64
    xy*: float64
    yy*: float64
    x0*: float64
    y0*: float64

  UserDataKey*{.final.} = object
    unused*: int32

  Glyph*{.final.} = object
    index*: int32
    x*: float64
    y*: float64

  TextExtents*{.final.} = object
    xBearing* {.importc: "x_bearing".}: float64
    yBearing* {.importc: "y_bearing".}: float64
    width*: float64
    height*: float64
    xAdvance* {.importc: "x_advance".}: float64
    yAdvance* {.importc: "y_advance".}: float64

  FontExtents*{.final.} = object
    ascent*: float64
    descent*: float64
    height*: float64
    maxXAdvance* {.importc: "max_x_advance".}: float64
    maxYAadvance* {.importc: "max_y_advance".}: float64

  PathData*{.final.} = object
    x*: float64
    y*: float64

  Path*{.final.} = object
    status*: Status
    data*: ptr PathData
    numData* {.importc: "num_data".}: int32

  Rectangle*{.final.} = object
    x*, y*, width*, height*: float64

  RectangleList*{.final.} = object
    status*: Status
    rectangles*: ptr Rectangle
    numRectangles* {.importc: "num_rectangles".}: int32

{.push dynlib: LibCairo, cdecl.}

proc version*(): int32 {.importc: "cairo_version".}
proc versionString*(): cstring {.importc: "cairo_version_string".}
proc create*(target: ptr Surface): ptr Context {.importc: "cairo_create".}
proc reference*(cr: ptr Context): ptr Context {.importc: "cairo_reference".}
proc destroy*(cr: ptr Context) {.importc: "cairo_destroy".}
proc getReferenceCount*(cr: ptr Context): int32 {.importc: "cairo_get_reference_count".}
proc getUserData*(cr: ptr Context, key: ptr UserDataKey): pointer {.importc: "cairo_get_user_data".}
proc setUserData*(cr: ptr Context, key: ptr UserDataKey, user_data: pointer, destroy: DestroyFunc): Status {.importc: "cairo_set_user_data".}
proc save*(cr: ptr Context) {.importc: "cairo_save".}
proc restore*(cr: ptr Context) {.importc: "cairo_restore".}
proc pushGroup*(cr: ptr Context) {.importc: "cairo_push_group".}
proc pushGroupWithContent*(cr: ptr Context, content: Content) {.importc: "cairo_push_group_with_content".}
proc popGroup*(cr: ptr Context): ptr Pattern {.importc: "cairo_pop_group".}
proc popGroupToSource*(cr: ptr Context) {.importc: "cairo_pop_group_to_source".}
# Modify state
proc setOperator*(cr: ptr Context, op: Operator) {.importc: "cairo_set_operator".}
proc setSource*(cr: ptr Context, source: ptr Pattern) {.importc: "cairo_set_source".}
proc setSourceRgb*(cr: ptr Context, red, green, blue: float64) {.importc: "cairo_set_source_rgb".}
proc setSourceRgba*(cr: ptr Context, red, green, blue, alpha: float64) {.importc: "cairo_set_source_rgba".}
proc setSource*(cr: ptr Context, surface: ptr Surface, x, y: float64) {.importc: "cairo_set_source_surface".}
proc setTolerance*(cr: ptr Context, tolerance: float64) {.importc: "cairo_set_tolerance".}
proc setAntialias*(cr: ptr Context, antialias: Antialias) {.importc: "cairo_set_antialias".}
proc setFillRule*(cr: ptr Context, fill_rule: FillRule) {.importc: "cairo_set_fill_rule".}
proc setLineWidth*(cr: ptr Context, width: float64) {.importc: "cairo_set_line_width".}
proc setLineCap*(cr: ptr Context, line_cap: LineCap) {.importc: "cairo_set_line_cap".}
proc setLineJoin*(cr: ptr Context, line_join: LineJoin) {.importc: "cairo_set_line_join".}
proc setDash*(cr: ptr Context, dashes: openarray[float64], offset: float64) {.importc: "cairo_set_dash".}
proc setMiterLimit*(cr: ptr Context, limit: float64) {.importc: "cairo_set_miter_limit".}
proc translate*(cr: ptr Context, tx, ty: float64) {.importc: "cairo_translate".}
proc scale*(cr: ptr Context, sx, sy: float64) {.importc: "cairo_scale".}
proc rotate*(cr: ptr Context, angle: float64) {.importc: "cairo_rotate".}
proc transform*(cr: ptr Context, matrix: ptr Matrix) {.importc: "cairo_transform".}
proc setMatrix*(cr: ptr Context, matrix: ptr Matrix) {.importc: "cairo_set_matrix".}
proc identityMatrix*(cr: ptr Context) {.importc: "cairo_identity_matrix".}
proc userToDevice*(cr: ptr Context, x, y: var float64) {.importc: "cairo_user_to_device".}
proc userToDeviceDistance*(cr: ptr Context, dx, dy: var float64) {.importc: "cairo_user_to_device_distance".}
proc deviceToUser*(cr: ptr Context, x, y: var float64) {.importc: "cairo_device_to_user".}
proc deviceToUserDistance*(cr: ptr Context, dx, dy: var float64) {.importc: "cairo_device_to_user_distance".}
# Path creation functions
proc newPath*(cr: ptr Context) {.importc: "cairo_new_path".}
proc moveTo*(cr: ptr Context, x, y: float64) {.importc: "cairo_move_to".}
proc newSubPath*(cr: ptr Context) {.importc: "cairo_new_sub_path".}
proc lineTo*(cr: ptr Context, x, y: float64) {.importc: "cairo_line_to".}
proc curveTo*(cr: ptr Context, x1, y1, x2, y2, x3, y3: float64) {.importc: "cairo_curve_to".}
proc arc*(cr: ptr Context, xc, yc, radius, angle1, angle2: float64) {.importc: "cairo_arc".}
proc arcNegative*(cr: ptr Context, xc, yc, radius, angle1, angle2: float64) {.importc: "cairo_arc_negative".}
proc relMoveTo*(cr: ptr Context, dx, dy: float64) {.importc: "cairo_rel_move_to".}
proc relLineTo*(cr: ptr Context, dx, dy: float64) {.importc: "cairo_rel_line_to".}
proc relCurveTo*(cr: ptr Context, dx1, dy1, dx2, dy2, dx3, dy3: float64) {.importc: "cairo_rel_curve_to".}
proc rectangle*(cr: ptr Context, x, y, width, height: float64) {.importc: "cairo_rectangle".}
proc closePath*(cr: ptr Context) {.importc: "cairo_close_path".}
# Painting functions
proc paint*(cr: ptr Context) {.importc: "cairo_paint".}
proc paintWithAlpha*(cr: ptr Context, alpha: float64) {.importc: "cairo_paint_with_alpha".}
proc mask*(cr: ptr Context, pattern: ptr Pattern) {.importc: "cairo_mask".}
proc mask*(cr: ptr Context, surface: ptr Surface, surface_x, surface_y: float64) {.importc: "cairo_mask_surface".}
proc stroke*(cr: ptr Context) {.importc: "cairo_stroke".}
proc strokePreserve*(cr: ptr Context) {.importc: "cairo_stroke_preserve".}
proc fill*(cr: ptr Context) {.importc: "cairo_fill".}
proc fillPreserve*(cr: ptr Context) {.importc: "cairo_fill_preserve".}
proc copyPage*(cr: ptr Context) {.importc: "cairo_copy_page".}
proc showPage*(cr: ptr Context) {.importc: "cairo_show_page".}
# Insideness testing
proc inStroke*(cr: ptr Context, x, y: float64): CairoBool {.importc: "cairo_in_stroke".}
proc inFill*(cr: ptr Context, x, y: float64): CairoBool {.importc: "cairo_in_fill".}
# Rectangular extents
proc strokeExtents*(cr: ptr Context, x1, y1, x2, y2: var float64) {.importc: "cairo_stroke_extents".}
proc fillExtents*(cr: ptr Context, x1, y1, x2, y2: var float64) {.importc: "cairo_fill_extents".}
# Clipping
proc resetClip*(cr: ptr Context) {.importc: "cairo_reset_clip".}
proc clip*(cr: ptr Context) {.importc: "cairo_clip".}
proc clipPreserve*(cr: ptr Context) {.importc: "cairo_clip_preserve".}
proc clipExtents*(cr: ptr Context, x1, y1, x2, y2: var float64) {.importc: "cairo_clip_extents".}
proc copyClipRectangleList*(cr: ptr Context): ptr RectangleList {.importc: "cairo_copy_clip_rectangle_list".}
proc rectangleListDestroy*(rectangle_list: ptr RectangleList) {.importc: "cairo_rectangle_list_destroy".}
# Font/Text functions
proc fontOptionsCreate*(): ptr FontOptions {.importc: "cairo_font_options_create".}
proc copy*(original: ptr FontOptions): ptr FontOptions {.importc: "cairo_font_options_copy".}
proc destroy*(options: ptr FontOptions) {.importc: "cairo_font_options_destroy".}
proc status*(options: ptr FontOptions): Status {.importc: "cairo_font_options_status".}
proc merge*(options, other: ptr FontOptions) {.importc: "cairo_font_options_merge".}
proc equal*(options, other: ptr FontOptions): CairoBool {.importc: "cairo_font_options_equal".}
proc hash*(options: ptr FontOptions): int32 {.importc: "cairo_font_options_hash".}
proc setAntialias*(options: ptr FontOptions, antialias: Antialias) {.importc: "cairo_font_options_set_antialias".}
proc getAntialias*(options: ptr FontOptions): Antialias {.importc: "cairo_font_options_get_antialias".}
proc setSubpixelOrder*(options: ptr FontOptions, subpixel_order: SubpixelOrder) {.importc: "cairo_font_options_set_subpixel_order".}
proc getSubpixelOrder*(options: ptr FontOptions): SubpixelOrder{.importc: "cairo_font_options_get_subpixel_order".}
proc setHintStyle*(options: ptr FontOptions, hint_style: HintStyle) {.importc: "cairo_font_options_set_hint_style".}
proc getHintStyle*(options: ptr FontOptions): HintStyle {.importc: "cairo_font_options_get_hint_style".}
proc setHintMetrics*(options: ptr FontOptions, hint_metrics: HintMetrics) {.importc: "cairo_font_options_set_hint_metrics".}
proc getHintMetrics*(options: ptr FontOptions): HintMetrics {.importc: "cairo_font_options_get_hint_metrics".}
# This interface is for dealing with text as text, not caring about the
  #   font object inside the the TCairo.
proc selectFontFace*(cr: ptr Context, family: cstring, slant: FontSlant, weight: FontWeight) {.importc: "cairo_select_font_face".}
proc setFontSize*(cr: ptr Context, size: float64) {.importc: "cairo_set_font_size".}
proc setFontMatrix*(cr: ptr Context, matrix: ptr Matrix) {.importc: "cairo_set_font_matrix".}
proc getFontMatrix*(cr: ptr Context, matrix: ptr Matrix) {.importc: "cairo_get_font_matrix".}
proc setFontOptions*(cr: ptr Context, options: ptr FontOptions) {.importc: "cairo_set_font_options".}
proc getFontOptions*(cr: ptr Context, options: ptr FontOptions) {.importc: "cairo_get_font_options".}
proc setFontFace*(cr: ptr Context, font_face: ptr FontFace) {.importc: "cairo_set_font_face".}
proc getFontFace*(cr: ptr Context): ptr FontFace {.importc: "cairo_get_font_face".}
proc setScaledFont*(cr: ptr Context, scaled_font: ptr ScaledFont) {.importc: "cairo_set_scaled_font".}
proc getScaledFont*(cr: ptr Context): ptr ScaledFont {.importc: "cairo_get_scaled_font".}
proc showText*(cr: ptr Context, utf8: cstring) {.importc: "cairo_show_text".}
proc showGlyphs*(cr: ptr Context, glyphs: ptr Glyph, num_glyphs: int32) {.importc: "cairo_show_glyphs".}
proc textPath*(cr: ptr Context, utf8: cstring) {.importc: "cairo_text_path".}
proc glyphPath*(cr: ptr Context, glyphs: ptr Glyph, num_glyphs: int32) {.importc: "cairo_glyph_path".}
proc textExtents*(cr: ptr Context, utf8: cstring, extents: ptr TextExtents) {.importc: "cairo_text_extents".}
proc glyphExtents*(cr: ptr Context, glyphs: ptr Glyph, num_glyphs: int32, extents: ptr TextExtents) {.importc: "cairo_glyph_extents".}
proc fontExtents*(cr: ptr Context, extents: ptr FontExtents) {.importc: "cairo_font_extents".}
# Generic identifier for a font style
proc reference*(font_face: ptr FontFace): ptr FontFace {.importc: "cairo_font_face_reference".}
proc destroy*(font_face: ptr FontFace) {.importc: "cairo_font_face_destroy".}
proc getReferenceCount*(font_face: ptr FontFace): int32 {.importc: "cairo_font_face_get_reference_count".}
proc status*(font_face: ptr FontFace): Status {.importc: "cairo_font_face_status".}
proc getType*(font_face: ptr FontFace): FontType {.importc: "cairo_font_face_get_type".}
proc getUserData*(font_face: ptr FontFace, key: ptr UserDataKey): pointer{.importc: "cairo_font_face_get_user_data".}
proc setUserData*(font_face: ptr FontFace, key: ptr UserDataKey, user_data: pointer, destroy: DestroyFunc): Status {.importc: "cairo_font_face_set_user_data".}
# Portable interface to general font features
proc scaledFontCreate*(font_face: ptr FontFace, font_matrix: ptr Matrix, ctm: ptr Matrix, options: ptr FontOptions): ptr ScaledFont{.importc: "cairo_scaled_font_create".}
proc reference*(scaled_font: ptr ScaledFont): ptr ScaledFont {.importc: "cairo_scaled_font_reference".}
proc destroy*(scaled_font: ptr ScaledFont) {.importc: "cairo_scaled_font_destroy".}
proc getReferenceCount*(scaled_font: ptr ScaledFont): int32 {.importc: "cairo_scaled_font_get_reference_count".}
proc status*(scaled_font: ptr ScaledFont): Status {.importc: "cairo_scaled_font_status".}
proc getType*(scaled_font: ptr ScaledFont): FontType {.importc: "cairo_scaled_font_get_type".}
proc getUserData*(scaled_font: ptr ScaledFont, key: ptr UserDataKey): pointer{.importc: "cairo_scaled_font_get_user_data".}
proc setUserData*(scaled_font: ptr ScaledFont, key: ptr UserDataKey, user_data: pointer, destroy: DestroyFunc): Status {.importc: "cairo_scaled_font_set_user_data".}
proc extents*(scaled_font: ptr ScaledFont, extents: ptr FontExtents) {.importc: "cairo_scaled_font_extents".}
proc textExtents*(scaled_font: ptr ScaledFont, utf8: cstring, extents: ptr TextExtents) {.importc: "cairo_scaled_font_text_extents".}
proc glyphExtents*(scaled_font: ptr ScaledFont, glyphs: ptr Glyph, num_glyphs: int32, extents: ptr TextExtents) {.importc: "cairo_scaled_font_glyph_extents".}
proc getFontFace*(scaled_font: ptr ScaledFont): ptr FontFace {.importc: "cairo_scaled_font_get_font_face".}
proc getFontMatrix*(scaled_font: ptr ScaledFont, font_matrix: ptr Matrix) {.importc: "cairo_scaled_font_get_font_matrix".}
proc getCtm*(scaled_font: ptr ScaledFont, ctm: ptr Matrix) {.importc: "cairo_scaled_font_get_ctm".}
proc getFontOptions*(scaled_font: ptr ScaledFont, options: ptr FontOptions) {.importc: "cairo_scaled_font_get_font_options".}
# Query functions
proc getOperator*(cr: ptr Context): Operator {.importc: "cairo_get_operator".}
proc getSource*(cr: ptr Context): ptr Pattern {.importc: "cairo_get_source".}
proc getTolerance*(cr: ptr Context): float64 {.importc: "cairo_get_tolerance".}
proc getAntialias*(cr: ptr Context): Antialias {.importc: "cairo_get_antialias".}
proc getCurrentPoint*(cr: ptr Context, x, y: var float64) {.importc: "cairo_get_current_point".}
proc getFillRule*(cr: ptr Context): FillRule {.importc: "cairo_get_fill_rule".}
proc getLineWidth*(cr: ptr Context): float64 {.importc: "cairo_get_line_width".}
proc getLineCap*(cr: ptr Context): LineCap {.importc: "cairo_get_line_cap".}
proc getLineJoin*(cr: ptr Context): LineJoin {.importc: "cairo_get_line_join".}
proc getMiterLimit*(cr: ptr Context): float64 {.importc: "cairo_get_miter_limit".}
proc getDashCount*(cr: ptr Context): int32 {.importc: "cairo_get_dash_count".}
proc getDash*(cr: ptr Context, dashes, offset: var float64) {.importc: "cairo_get_dash".}
proc getMatrix*(cr: ptr Context, matrix: ptr Matrix) {.importc: "cairo_get_matrix".}
proc getTarget*(cr: ptr Context): ptr Surface {.importc: "cairo_get_target".}
proc getGroupTarget*(cr: ptr Context): ptr Surface {.importc: "cairo_get_group_target".}
proc copyPath*(cr: ptr Context): ptr Path {.importc: "cairo_copy_path".}
proc copyPathFlat*(cr: ptr Context): ptr Path {.importc: "cairo_copy_path_flat".}
proc appendPath*(cr: ptr Context, path: ptr Path) {.importc: "cairo_append_path".}
proc destroy*(path: ptr Path) {.importc: "cairo_path_destroy".}
# Error status queries
proc status*(cr: ptr Context): Status {.importc: "cairo_status".}
proc statusToString*(status: Status): cstring {.importc: "cairo_status_to_string".}
# Surface manipulation
proc surfaceCreateSimilar*(other: ptr Surface, content: Content, width, height: int32): ptr Surface {.importc: "cairo_surface_create_similar".}
proc reference*(surface: ptr Surface): ptr Surface {.importc: "cairo_surface_reference".}
proc finish*(surface: ptr Surface) {.importc: "cairo_surface_finish".}
proc destroy*(surface: ptr Surface) {.importc: "cairo_surface_destroy".}
proc getReferenceCount*(surface: ptr Surface): int32 {.importc: "cairo_surface_get_reference_count".}
proc status*(surface: ptr Surface): Status {.importc: "cairo_surface_status".}
proc getType*(surface: ptr Surface): SurfaceType {.importc: "cairo_surface_get_type".}
proc getContent*(surface: ptr Surface): Content {.importc: "cairo_surface_get_content".}
proc writeToPng*(surface: ptr Surface, filename: cstring): Status {.importc: "cairo_surface_write_to_png".}
proc writeToPng*(surface: ptr Surface, write_func: WriteFunc, closure: pointer): Status {.importc: "cairo_surface_write_to_png_stream".}
proc getUserData*(surface: ptr Surface, key: ptr UserDataKey): pointer{.importc: "cairo_surface_get_user_data".}
proc setUserData*(surface: ptr Surface, key: ptr UserDataKey, user_data: pointer, destroy: DestroyFunc): Status {.importc: "cairo_surface_set_user_data".}
proc getFontOptions*(surface: ptr Surface, options: ptr FontOptions) {.importc: "cairo_surface_get_font_options".}
proc flush*(surface: ptr Surface) {.importc: "cairo_surface_flush".}
proc markDirty*(surface: ptr Surface) {.importc: "cairo_surface_mark_dirty".}
proc markDirtyRectangle*(surface: ptr Surface, x, y, width, height: int32) {.importc: "cairo_surface_mark_dirty_rectangle".}
proc setDeviceOffset*(surface: ptr Surface, x_offset, y_offset: float64) {.importc: "cairo_surface_set_device_offset".}
proc getDeviceOffset*(surface: ptr Surface, x_offset, y_offset: var float64) {.importc: "cairo_surface_get_device_offset".}
proc setFallbackResolution*(surface: ptr Surface, x_pixels_per_inch, y_pixels_per_inch: float64) {.importc: "cairo_surface_set_fallback_resolution".}
# Image-surface functions
proc imageSurfaceCreate*(format: Format, width, height: int32): ptr Surface{.importc: "cairo_image_surface_create".}
proc imageSurfaceCreate*(data: cstring, format: Format, width, height, stride: int32): ptr Surface{.importc: "cairo_image_surface_create_for_data".}
proc getData*(surface: ptr Surface): cstring {.importc: "cairo_image_surface_get_data".}
proc getFormat*(surface: ptr Surface): Format {.importc: "cairo_image_surface_get_format".}
proc getWidth*(surface: ptr Surface): int32 {.importc: "cairo_image_surface_get_width".}
proc getHeight*(surface: ptr Surface): int32 {.importc: "cairo_image_surface_get_height".}
proc getStride*(surface: ptr Surface): int32 {.importc: "cairo_image_surface_get_stride".}
proc imageSurfaceCreateFromPng*(filename: cstring): ptr Surface {.importc: "cairo_image_surface_create_from_png".}
proc imageSurfaceCreateFromPng*(read_func: ReadFunc, closure: pointer): ptr Surface {.importc: "cairo_image_surface_create_from_png_stream".}
# Pattern creation functions
proc patternCreateRgb*(red, green, blue: float64): ptr Pattern {.importc: "cairo_pattern_create_rgb".}
proc patternCreateRgba*(red, green, blue, alpha: float64): ptr Pattern {.importc: "cairo_pattern_create_rgba".}
proc patternCreateForSurface*(surface: ptr Surface): ptr Pattern {.importc: "cairo_pattern_create_for_surface".}
proc patternCreateLinear*(x0, y0, x1, y1: float64): ptr Pattern {.importc: "cairo_pattern_create_linear".}
proc patternCreateRadial*(cx0, cy0, radius0, cx1, cy1, radius1: float64): ptr Pattern{.importc: "cairo_pattern_create_radial".}
proc reference*(pattern: ptr Pattern): ptr Pattern {.importc: "cairo_pattern_reference".}
proc destroy*(pattern: ptr Pattern) {.importc: "cairo_pattern_destroy".}
proc getReferenceCount*(pattern: ptr Pattern): int32 {.importc: "cairo_pattern_get_reference_count".}
proc status*(pattern: ptr Pattern): Status {.importc: "cairo_pattern_status".}
proc getUserData*(pattern: ptr Pattern, key: ptr UserDataKey): pointer{.importc: "cairo_pattern_get_user_data".}
proc setUserData*(pattern: ptr Pattern, key: ptr UserDataKey, user_data: pointer, destroy: DestroyFunc): Status {.importc: "cairo_pattern_set_user_data".}
proc getType*(pattern: ptr Pattern): PatternType {.importc: "cairo_pattern_get_type".}
proc addColorStopRgb*(pattern: ptr Pattern, offset, red, green, blue: float64) {.importc: "cairo_pattern_add_color_stop_rgb".}
proc addColorStopRgba*(pattern: ptr Pattern, offset, red, green, blue, alpha: float64) {.importc: "cairo_pattern_add_color_stop_rgba".}
proc setMatrix*(pattern: ptr Pattern, matrix: ptr Matrix) {.importc: "cairo_pattern_set_matrix".}
proc getMatrix*(pattern: ptr Pattern, matrix: ptr Matrix) {.importc: "cairo_pattern_get_matrix".}
proc setExtend*(pattern: ptr Pattern, extend: Extend) {.importc: "cairo_pattern_set_extend".}
proc getExtend*(pattern: ptr Pattern): Extend {.importc: "cairo_pattern_get_extend".}
proc setFilter*(pattern: ptr Pattern, filter: Filter) {.importc: "cairo_pattern_set_filter".}
proc getFilter*(pattern: ptr Pattern): Filter {.importc: "cairo_pattern_get_filter".}
proc getRgba*(pattern: ptr Pattern, red, green, blue, alpha: var float64): Status {.importc: "cairo_pattern_get_rgba".}
proc getSurface*(pattern: ptr Pattern, surface: ptr ptr Surface): Status {.importc: "cairo_pattern_get_surface".}
proc getColorStopRgba*(pattern: ptr Pattern, index: int32, offset, red, green, blue, alpha: var float64): Status {.importc: "cairo_pattern_get_color_stop_rgba".}
proc getColorStopCount*(pattern: ptr Pattern, count: var int32): Status {.importc: "cairo_pattern_get_color_stop_count".}
proc getLinearPoints*(pattern: ptr Pattern, x0, y0, x1, y1: var float64): Status {.importc: "cairo_pattern_get_linear_points".}
proc getRadialCircles*(pattern: ptr Pattern, x0, y0, r0, x1, y1, r1: var float64): Status {.importc: "cairo_pattern_get_radial_circles".}
# Matrix functions
proc init*(matrix: ptr Matrix, xx, yx, xy, yy, x0, y0: float64) {.importc: "cairo_matrix_init".}
proc initIdentity*(matrix: ptr Matrix) {.importc: "cairo_matrix_init_identity".}
proc initTranslate*(matrix: ptr Matrix, tx, ty: float64) {.importc: "cairo_matrix_init_translate".}
proc initScale*(matrix: ptr Matrix, sx, sy: float64) {.importc: "cairo_matrix_init_scale".}
proc initRotate*(matrix: ptr Matrix, radians: float64) {.importc: "cairo_matrix_init_rotate".}
proc translate*(matrix: ptr Matrix, tx, ty: float64) {.importc: "cairo_matrix_translate".}
proc scale*(matrix: ptr Matrix, sx, sy: float64) {.importc: "cairo_matrix_scale".}
proc rotate*(matrix: ptr Matrix, radians: float64) {.importc: "cairo_matrix_rotate".}
proc invert*(matrix: ptr Matrix): Status {.importc: "cairo_matrix_invert".}
proc multiply*(result, a, b: ptr Matrix) {.importc: "cairo_matrix_multiply".}
proc transformDistance*(matrix: ptr Matrix, dx, dy: var float64) {.importc: "cairo_matrix_transform_distance".}
proc transformPoint*(matrix: ptr Matrix, x, y: var float64) {.importc: "cairo_matrix_transform_point".}
# PDF functions
proc pdfSurfaceCreate*(filename: cstring, width_in_points, height_in_points: float64): ptr Surface{.importc: "cairo_pdf_surface_create".}
proc pdfSurfaceCreateForStream*(write_func: WriteFunc, closure: pointer, width_in_points, height_in_points: float64): ptr Surface{.importc: "cairo_pdf_surface_create_for_stream".}
proc pdfSurfaceSetSize*(surface: ptr Surface, width_in_points, height_in_points: float64) {.importc: "cairo_pdf_surface_set_size".}
# PS functions
proc psSurfaceCreate*(filename: cstring, width_in_points, height_in_points: float64): ptr Surface{.importc: "cairo_ps_surface_create".}
proc psSurfaceCreateForStream*(write_func: WriteFunc, closure: pointer, width_in_points, height_in_points: float64): ptr Surface{.importc: "cairo_ps_surface_create_for_stream".}
proc psSurfaceSetSize*(surface: ptr Surface, width_in_points, height_in_points: float64) {.importc: "cairo_ps_surface_set_size".}
proc psSurfaceDscComment*(surface: ptr Surface, comment: cstring) {.importc: "cairo_ps_surface_dsc_comment".}
proc psSurfaceDscBeginSetup*(surface: ptr Surface) {.importc: "cairo_ps_surface_dsc_begin_setup".}
proc psSurfaceDscBeginPageSetup*(surface: ptr Surface) {.importc: "cairo_ps_surface_dsc_begin_page_setup".}
# SVG functions
proc svgSurfaceCreate*(filename: cstring, width_in_points, height_in_points: float64): ptr Surface{.importc: "cairo_svg_surface_create".}
proc svgSurfaceCreateForStream*(write_func: WriteFunc, closure: pointer, width_in_points, height_in_points: float64): ptr Surface{.importc: "cairo_svg_surface_create_for_stream".}
proc svgSurfaceRestrictToVersion*(surface: ptr Surface, version: SvgVersion) {.importc: "cairo_svg_surface_restrict_to_version".}
  #todo: see how translate this
  #procedure cairo_svg_get_versions(TCairoSvgVersion const **versions, # int *num_versions);
proc svgVersionToString*(version: SvgVersion): cstring {.importc: "cairo_svg_version_to_string".}
# Functions to be used while debugging (not intended for use in production code)
proc debugResetStaticData*() {.importc: "cairo_debug_reset_static_data".}

# new since 1.10
proc surfaceCreateForRectangle*(target: ptr Surface, x,y,w,h: cdouble): ptr Surface  {.importc: "cairo_surface_create_for_rectangle".}

{.pop.}

# implementation

proc version*(major, minor, micro: var int32) =
  var version: int32
  version = version()
  major = version div 10000'i32
  minor = (version mod (major * 10000'i32)) div 100'i32
  micro = (version mod ((major * 10000'i32) + (minor * 100'i32)))

proc checkStatus*(s: Status) {.noinline.} =
  ## if ``s != StatusSuccess`` the error is turned into an appropirate Nimrod
  ## exception and raised.
  case s
  of StatusSuccess: discard
  of StatusNoMemory:
    raise newException(OutOfMemError, $statusToString(s))
  of StatusReadError, StatusWriteError, StatusFileNotFound,
     StatusTempFileError:
    raise newException(IOError, $statusToString(s))
  else:
    raise newException(AssertionError, $statusToString(s))


type
  PPSurface*  {.deprecated: "ptr ptr Surface".} = ptr ptr Surface
  PByte* {.deprecated: "use cstring".} = cstring
  TStatus* {.deprecated: "use Status".} = Status
  PStatus* {.deprecated: "use ptr Status".} = ptr Status
  TOperator* {.deprecated: "use Operator".} = Operator
  POperator* {.deprecated: "use ptr Operator".} = ptr Operator
  TAntialias* {.deprecated: "use Antialias".} = Antialias
  PAntialias* {.deprecated: "use ptr Antialias".} = ptr Antialias
  TFillRule* {.deprecated: "use FillRule".} = FillRule
  PFillRule* {.deprecated: "use ptr FillRule".} = ptr FillRule
  TLineCap* {.deprecated: "use LineCap".} = LineCap
  PLineCap* {.deprecated: "use ptr LineCap".} = ptr LineCap
  TLineJoin* {.deprecated: "use LineJoin".} = LineJoin
  PLineJoin* {.deprecated: "use ptr LineJoin".} = ptr LineJoin
  TFontSlant* {.deprecated: "use FontSlant".} = FontSlant
  PFontSlant* {.deprecated: "use ptr FontSlant".} = ptr FontSlant
  TFontWeight* {.deprecated: "use FontWeight".} = FontWeight
  PFontWeight* {.deprecated: "use ptr FontWeight".} = ptr FontWeight
  TSubpixelOrder* {.deprecated: "use SubpixelOrder".} = SubpixelOrder
  PSubpixelOrder* {.deprecated: "use ptr SubpixelOrder".} = ptr SubpixelOrder
  THintStyle* {.deprecated: "use HintStyle".} = HintStyle
  PHintStyle* {.deprecated: "use ptr HintStyle".} = ptr HintStyle
  THintMetrics* {.deprecated: "use HintMetrics".} = HintMetrics
  PHintMetrics* {.deprecated: "use ptr HintMetrics".} = ptr HintMetrics
  TPathDataType* {.deprecated: "use PathDataType".} = PathDataType
  PPathDataType* {.deprecated: "use ptr PathDataType".} = ptr PathDataType
  TContent* {.deprecated: "use Content".} = Content
  PContent* {.deprecated: "use ptr Content".} = ptr Content
  TFormat* {.deprecated: "use Format".} = Format
  PFormat* {.deprecated: "use ptr Format".} = ptr Format
  TExtend* {.deprecated: "use Extend".} = Extend
  PExtend* {.deprecated: "use ptr Extend".} = ptr Extend
  TFilter* {.deprecated: "use Filter".} = Filter
  PFilter* {.deprecated: "use ptr Filter".} = ptr Filter
  TFontType* {.deprecated: "use FontType".} = FontType
  PFontType* {.deprecated: "use ptr FontType".} = ptr FontType
  TPatternType* {.deprecated: "use PatternType".} = PatternType
  PPatternType* {.deprecated: "use ptr PatternType".} = ptr PatternType
  TSurfaceType* {.deprecated: "use SurfaceType".} = SurfaceType
  PSurfaceType* {.deprecated: "use ptr SurfaceType".} = ptr SurfaceType
  TSvgVersion* {.deprecated: "use SvgVersion".} = SvgVersion
  PSvgVersion* {.deprecated: "use ptr SvgVersion".} = ptr SvgVersion
  TBool* {.deprecated: "use CairoBool".} = CairoBool
  PBool* {.deprecated: "use ptr CairoBool".} = ptr CairoBool
  TDestroyFunc* {.deprecated: "use DestroyFunc".} = DestroyFunc
  PDestroyFunc* {.deprecated: "use ptr DestroyFunc".} = ptr DestroyFunc
  TWriteFunc* {.deprecated: "use WriteFunc".} = WriteFunc
  PWriteFunc* {.deprecated: "use ptr WriteFunc".} = ptr WriteFunc
  TReadFunc* {.deprecated: "use ReadFunc".} = ReadFunc
  PReadFunc* {.deprecated: "use ptr ReadFunc".} = ptr ReadFunc
  TContext* {.deprecated: "use Context".} = Context
  PContext* {.deprecated: "use ptr Context".} = ptr Context
  TSurface* {.deprecated: "use Surface".} = Surface
  PSurface* {.deprecated: "use ptr Surface".} = ptr Surface
  TPattern* {.deprecated: "use Pattern".} = Pattern
  PPattern* {.deprecated: "use ptr Pattern".} = ptr Pattern
  TScaledFont* {.deprecated: "use ScaledFont".} = ScaledFont
  PScaledFont* {.deprecated: "use ptr ScaledFont".} = ptr ScaledFont
  TFontFace* {.deprecated: "use FontFace".} = FontFace
  PFontFace* {.deprecated: "use ptr FontFace".} = ptr FontFace
  TFontOptions* {.deprecated: "use FontOptions".} = FontOptions
  PFontOptions* {.deprecated: "use ptr FontOptions".} = ptr FontOptions
  TMatrix* {.deprecated: "use Matrix".} = Matrix
  PMatrix* {.deprecated: "use ptr Matrix".} = ptr Matrix
  TUserDataKey* {.deprecated: "use UserDataKey".} = UserDataKey
  PUserDataKey* {.deprecated: "use ptr UserDataKey".} = ptr UserDataKey
  TGlyph* {.deprecated: "use Glyph".} = Glyph
  PGlyph* {.deprecated: "use ptr Glyph".} = ptr Glyph
  TTextExtents* {.deprecated: "use TextExtents".} = TextExtents
  PTextExtents* {.deprecated: "use ptr TextExtents".} = ptr TextExtents
  TFontExtents* {.deprecated: "use FontExtents".} = FontExtents
  PFontExtents* {.deprecated: "use ptr FontExtents".} = ptr FontExtents
  TPathData* {.deprecated: "use PathData".} = PathData
  PPathData* {.deprecated: "use ptr PathData".} = ptr PathData
  TPath* {.deprecated: "use Path".} = Path
  PPath* {.deprecated: "use ptr Path".} = ptr Path
  TRectangle* {.deprecated: "use Rectangle".} = Rectangle
  PRectangle* {.deprecated: "use ptr Rectangle".} = ptr Rectangle
  TRectangleList* {.deprecated: "use RectangleList".} = RectangleList
  PRectangleList* {.deprecated: "use ptr RectangleList".} = ptr RectangleList