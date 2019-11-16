#* cairo - a vector graphics library with display and print output
# *
# * Copyright © 2002 University of Southern California
# * Copyright © 2005 Red Hat, Inc.
# *
# * This library is free software; you can redistribute it and/or
# * modify it either under the terms of the GNU Lesser General Public
# * License version 2.1 as published by the Free Software Foundation
# * (the "LGPL") or, at your option, under the terms of the Mozilla
# * Public License Version 1.1 (the "MPL"). If you do not alter this
# * notice, a recipient may use your version of this file under either
# * the MPL or the LGPL.
# *
# * You should have received a copy of the LGPL along with this library
# * in the file COPYING-LGPL-2.1; if not, write to the Free Software
# * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
# * You should have received a copy of the MPL along with this library
# * in the file COPYING-MPL-1.1
# *
# * The contents of this file are subject to the Mozilla Public License
# * Version 1.1 (the "License"); you may not use this file except in
# * compliance with the License. You may obtain a copy of the License at
# * http://www.mozilla.org/MPL/
# *
# * This software is distributed on an "AS IS" basis, WITHOUT WARRANTY
# * OF ANY KIND, either express or implied. See the LGPL or the MPL for
# * the specific language governing rights and limitations.
# *
# * The Original Code is the cairo graphics library.
# *
# * The Initial Developer of the Original Code is University of Southern
# * California.
# *
# * Contributor(s):
# *	Carl D. Worth <cworth@cworth.org>
# #*
# *  This FreePascal binding generated August 26, 2005
# *  by Jeffrey Pohlmeyer <yetanothergeek@yahoo.com>
#

#
#  - Updated to cairo version 1.4
#  - Grouped OS specific fuctions in separated units
#  - Organized the functions by group and ordered exactly as the c header
#  - Cleared parameter list syntax according to pascal standard
#
#  By Luiz Américo Pereira Câmara
#  October 2007
#

include "cairo_pragma.nim"

type
  PByte = cstring
  TStatus* = enum
    STATUS_SUCCESS = 0,
    STATUS_NO_MEMORY,
    STATUS_INVALID_RESTORE,
    STATUS_INVALID_POP_GROUP,
    STATUS_NO_CURRENT_POINT,
    STATUS_INVALID_MATRIX,
    STATUS_INVALID_STATUS,
    STATUS_NULL_POINTER,
    STATUS_INVALID_STRING,
    STATUS_INVALID_PATH_DATA,
    STATUS_READ_ERROR,
    STATUS_WRITE_ERROR,
    STATUS_SURFACE_FINISHED,
    STATUS_SURFACE_TYPE_MISMATCH,
    STATUS_PATTERN_TYPE_MISMATCH,
    STATUS_INVALID_CONTENT,
    STATUS_INVALID_FORMAT,
    STATUS_INVALID_VISUAL,
    STATUS_FILE_NOT_FOUND,
    STATUS_INVALID_DASH,
    STATUS_INVALID_DSC_COMMENT,
    STATUS_INVALID_INDEX,
    STATUS_CLIP_NOT_REPRESENTABLE,
    STATUS_TEMP_FILE_ERROR,
    STATUS_INVALID_STRIDE,
    STATUS_FONT_TYPE_MISMATCH,
    STATUS_USER_FONT_IMMUTABLE,
    STATUS_USER_FONT_ERROR,
    STATUS_NEGATIVE_COUNT,
    STATUS_INVALID_CLUSTERS,
    STATUS_INVALID_SLANT,
    STATUS_INVALID_WEIGHT


  TOperator* = enum
    OPERATOR_CLEAR, OPERATOR_SOURCE, OPERATOR_OVER, OPERATOR_IN, OPERATOR_OUT,
    OPERATOR_ATOP, OPERATOR_DEST, OPERATOR_DEST_OVER, OPERATOR_DEST_IN,
    OPERATOR_DEST_OUT, OPERATOR_DEST_ATOP, OPERATOR_XOR, OPERATOR_ADD,
    OPERATOR_SATURATE, OPERATOR_MULTIPLY, OPERATOR_SCREEN, OPERATOR_OVERLAY,
    OPERATOR_DARKEN, OPERATOR_LIGHTEN, OPERATOR_COLOR_DODGE,
    OPERATOR_COLOR_BURN, OPERATOR_HARD_LIGHT, OPERATOR_SOFT_LIGHT,
    OPERATOR_DIFFERENCE, OPERATOR_EXCLUSION, OPERATOR_HSL_HUE,
    OPERATOR_HSL_SATURATION, OPERATOR_HSL_COLOR, OPERATOR_HSL_LUMINOSITY

  TAntialias* = enum
    ANTIALIAS_DEFAULT, ANTIALIAS_NONE, ANTIALIAS_GRAY, ANTIALIAS_SUBPIXEL
  TFillRule* = enum
    FILL_RULE_WINDING, FILL_RULE_EVEN_ODD
  TLineCap* = enum
    LINE_CAP_BUTT, LINE_CAP_ROUND, LINE_CAP_SQUARE
  TLineJoin* = enum
    LINE_JOIN_MITER, LINE_JOIN_ROUND, LINE_JOIN_BEVEL
  TFontSlant* = enum
    FONT_SLANT_NORMAL, FONT_SLANT_ITALIC, FONT_SLANT_OBLIQUE
  TFontWeight* = enum
    FONT_WEIGHT_NORMAL, FONT_WEIGHT_BOLD
  TSubpixelOrder* = enum
    SUBPIXEL_ORDER_DEFAULT, SUBPIXEL_ORDER_RGB, SUBPIXEL_ORDER_BGR,
    SUBPIXEL_ORDER_VRGB, SUBPIXEL_ORDER_VBGR
  THintStyle* = enum
    HINT_STYLE_DEFAULT, HINT_STYLE_NONE, HINT_STYLE_SLIGHT, HINT_STYLE_MEDIUM,
    HINT_STYLE_FULL
  THintMetrics* = enum
    HINT_METRICS_DEFAULT, HINT_METRICS_OFF, HINT_METRICS_ON
  TPathDataType* = enum
    PATH_MOVE_TO, PATH_LINE_TO, PATH_CURVE_TO, PATH_CLOSE_PATH
  TContent* = enum
    CONTENT_COLOR = 0x00001000, CONTENT_ALPHA = 0x00002000,
    CONTENT_COLOR_ALPHA = 0x00003000
  TFormat* = enum
    FORMAT_ARGB32, FORMAT_RGB24, FORMAT_A8, FORMAT_A1
  TExtend* = enum
    EXTEND_NONE, EXTEND_REPEAT, EXTEND_REFLECT, EXTEND_PAD
  TFilter* = enum
    FILTER_FAST, FILTER_GOOD, FILTER_BEST, FILTER_NEAREST, FILTER_BILINEAR,
    FILTER_GAUSSIAN
  TFontType* = enum
    FONT_TYPE_TOY, FONT_TYPE_FT, FONT_TYPE_WIN32, FONT_TYPE_ATSUI
  TPatternType* = enum
    PATTERN_TYPE_SOLID, PATTERN_TYPE_SURFACE, PATTERN_TYPE_LINEAR,
    PATTERN_TYPE_RADIAL
  TSurfaceType* = enum
    SURFACE_TYPE_IMAGE, SURFACE_TYPE_PDF, SURFACE_TYPE_PS, SURFACE_TYPE_XLIB,
    SURFACE_TYPE_XCB, SURFACE_TYPE_GLITZ, SURFACE_TYPE_QUARTZ,
    SURFACE_TYPE_WIN32, SURFACE_TYPE_BEOS, SURFACE_TYPE_DIRECTFB,
    SURFACE_TYPE_SVG, SURFACE_TYPE_OS2
  TSvgVersion* = enum
    SVG_VERSION_1_1, SVG_VERSION_1_2
  PSurface* = ptr TSurface
  PPSurface* = ptr PSurface
  PContext* = ptr TContext
  PPattern* = ptr TPattern
  PFontOptions* = ptr TFontOptions
  PFontFace* = ptr TFontFace
  PScaledFont* = ptr TScaledFont
  PBool* = ptr TBool
  TBool* = int32
  PMatrix* = ptr TMatrix
  PUserDataKey* = ptr TUserDataKey
  PGlyph* = ptr TGlyph
  PTextExtents* = ptr TTextExtents
  PFontExtents* = ptr TFontExtents
  PPathDataType* = ptr TPathDataType
  PPathData* = ptr TPathData
  PPath* = ptr TPath
  PRectangle* = ptr TRectangle
  PRectangleList* = ptr TRectangleList
  TDestroyFunc* = proc (data: pointer){.cdecl.}
  TWriteFunc* = proc (closure: pointer, data: PByte, len: int32): TStatus{.cdecl.}
  TReadFunc* = proc (closure: pointer, data: PByte, len: int32): TStatus{.cdecl.}
  TContext*{.final.} = object        #OPAQUE
  TSurface*{.final.} = object  #OPAQUE
  TPattern*{.final.} = object  #OPAQUE
  TScaledFont*{.final.} = object  #OPAQUE
  TFontFace*{.final.} = object  #OPAQUE
  TFontOptions*{.final.} = object  #OPAQUE
  TMatrix*{.final.} = object
    xx*: float64
    yx*: float64
    xy*: float64
    yy*: float64
    x0*: float64
    y0*: float64

  TUserDataKey*{.final.} = object
    unused*: int32

  TGlyph*{.final.} = object
    index*: int32
    x*: float64
    y*: float64

  TTextExtents*{.final.} = object
    x_bearing*: float64
    y_bearing*: float64
    width*: float64
    height*: float64
    x_advance*: float64
    y_advance*: float64

  TFontExtents*{.final.} = object
    ascent*: float64
    descent*: float64
    height*: float64
    max_x_advance*: float64
    max_y_advance*: float64

  TPathData*{.final.} = object  #* _type : TCairoPathDataType;
                                #       length : LongInt;
                                #    end
    x*: float64
    y*: float64

  TPath*{.final.} = object
    status*: TStatus
    data*: PPathData
    num_data*: int32

  TRectangle*{.final.} = object
    x*, y*, width*, height*: float64

  TRectangleList*{.final.} = object
    status*: TStatus
    rectangles*: PRectangle
    num_rectangles*: int32

{.push dynlib: LIB_CAIRO, cdecl.}

proc version*(): int32 {.importc: "cairo_version".}
proc versionString*(): cstring {.importc: "cairo_version_string".}
proc create*(target: PSurface): PContext {.importc: "cairo_create".}
proc reference*(cr: PContext): PContext {.importc: "cairo_reference".}
proc destroy*(cr: PContext) {.importc: "cairo_destroy".}
proc getReferenceCount*(cr: PContext): int32 {.importc: "cairo_get_reference_count".}
proc getUserData*(cr: PContext, key: PUserDataKey): pointer {.importc: "cairo_get_user_data".}
proc setUserData*(cr: PContext, key: PUserDataKey, user_data: pointer, destroy: TDestroyFunc): TStatus {.importc: "cairo_set_user_data".}
proc save*(cr: PContext) {.importc: "cairo_save".}
proc restore*(cr: PContext) {.importc: "cairo_restore".}
proc pushGroup*(cr: PContext) {.importc: "cairo_push_group".}
proc pushGroupWithContent*(cr: PContext, content: TContent) {.importc: "cairo_push_group_with_content".}
proc popGroup*(cr: PContext): PPattern {.importc: "cairo_pop_group".}
proc popGroupToSource*(cr: PContext) {.importc: "cairo_pop_group_to_source".}
# Modify state
proc setOperator*(cr: PContext, op: TOperator) {.importc: "cairo_set_operator".}
proc setSource*(cr: PContext, source: PPattern) {.importc: "cairo_set_source".}
proc setSourceRgb*(cr: PContext, red, green, blue: float64) {.importc: "cairo_set_source_rgb".}
proc setSourceRgba*(cr: PContext, red, green, blue, alpha: float64) {.importc: "cairo_set_source_rgba".}
proc setSource*(cr: PContext, surface: PSurface, x, y: float64) {.importc: "cairo_set_source_surface".}
proc setTolerance*(cr: PContext, tolerance: float64) {.importc: "cairo_set_tolerance".}
proc setAntialias*(cr: PContext, antialias: TAntialias) {.importc: "cairo_set_antialias".}
proc setFillRule*(cr: PContext, fill_rule: TFillRule) {.importc: "cairo_set_fill_rule".}
proc setLineWidth*(cr: PContext, width: float64) {.importc: "cairo_set_line_width".}
proc setLineCap*(cr: PContext, line_cap: TLineCap) {.importc: "cairo_set_line_cap".}
proc setLineJoin*(cr: PContext, line_join: TLineJoin) {.importc: "cairo_set_line_join".}
proc setDash*(cr: PContext, dashes: openarray[float64], offset: float64) {.importc: "cairo_set_dash".}
proc setMiterLimit*(cr: PContext, limit: float64) {.importc: "cairo_set_miter_limit".}
proc translate*(cr: PContext, tx, ty: float64) {.importc: "cairo_translate".}
proc scale*(cr: PContext, sx, sy: float64) {.importc: "cairo_scale".}
proc rotate*(cr: PContext, angle: float64) {.importc: "cairo_rotate".}
proc transform*(cr: PContext, matrix: PMatrix) {.importc: "cairo_transform".}
proc setMatrix*(cr: PContext, matrix: PMatrix) {.importc: "cairo_set_matrix".}
proc identityMatrix*(cr: PContext) {.importc: "cairo_identity_matrix".}
proc userToDevice*(cr: PContext, x, y: var float64) {.importc: "cairo_user_to_device".}
proc userToDeviceDistance*(cr: PContext, dx, dy: var float64) {.importc: "cairo_user_to_device_distance".}
proc deviceToUser*(cr: PContext, x, y: var float64) {.importc: "cairo_device_to_user".}
proc deviceToUserDistance*(cr: PContext, dx, dy: var float64) {.importc: "cairo_device_to_user_distance".}
# Path creation functions
proc newPath*(cr: PContext) {.importc: "cairo_new_path".}
proc moveTo*(cr: PContext, x, y: float64) {.importc: "cairo_move_to".}
proc newSubPath*(cr: PContext) {.importc: "cairo_new_sub_path".}
proc lineTo*(cr: PContext, x, y: float64) {.importc: "cairo_line_to".}
proc curveTo*(cr: PContext, x1, y1, x2, y2, x3, y3: float64) {.importc: "cairo_curve_to".}
proc arc*(cr: PContext, xc, yc, radius, angle1, angle2: float64) {.importc: "cairo_arc".}
proc arcNegative*(cr: PContext, xc, yc, radius, angle1, angle2: float64) {.importc: "cairo_arc_negative".}
proc relMoveTo*(cr: PContext, dx, dy: float64) {.importc: "cairo_rel_move_to".}
proc relLineTo*(cr: PContext, dx, dy: float64) {.importc: "cairo_rel_line_to".}
proc relCurveTo*(cr: PContext, dx1, dy1, dx2, dy2, dx3, dy3: float64) {.importc: "cairo_rel_curve_to".}
proc rectangle*(cr: PContext, x, y, width, height: float64) {.importc: "cairo_rectangle".}
proc closePath*(cr: PContext) {.importc: "cairo_close_path".}
# Painting functions
proc paint*(cr: PContext) {.importc: "cairo_paint".}
proc paintWithAlpha*(cr: PContext, alpha: float64) {.importc: "cairo_paint_with_alpha".}
proc mask*(cr: PContext, pattern: PPattern) {.importc: "cairo_mask".}
proc mask*(cr: PContext, surface: PSurface, surface_x, surface_y: float64){. cdecl, importc: "cairo_mask_surface".}
proc stroke*(cr: PContext) {.importc: "cairo_stroke".}
proc strokePreserve*(cr: PContext) {.importc: "cairo_stroke_preserve".}
proc fill*(cr: PContext) {.importc: "cairo_fill".}
proc fillPreserve*(cr: PContext) {.importc: "cairo_fill_preserve".}
proc copyPage*(cr: PContext) {.importc: "cairo_copy_page".}
proc showPage*(cr: PContext) {.importc: "cairo_show_page".}
# Insideness testing
proc inStroke*(cr: PContext, x, y: float64): TBool {.importc: "cairo_in_stroke".}
proc inFill*(cr: PContext, x, y: float64): TBool {.importc: "cairo_in_fill".}
# Rectangular extents
proc strokeExtents*(cr: PContext, x1, y1, x2, y2: var float64) {.importc: "cairo_stroke_extents".}
proc fillExtents*(cr: PContext, x1, y1, x2, y2: var float64) {.importc: "cairo_fill_extents".}
# Clipping
proc resetClip*(cr: PContext) {.importc: "cairo_reset_clip".}
proc clip*(cr: PContext) {.importc: "cairo_clip".}
proc clipPreserve*(cr: PContext) {.importc: "cairo_clip_preserve".}
proc clipExtents*(cr: PContext, x1, y1, x2, y2: var float64) {.importc: "cairo_clip_extents".}
proc copyClipRectangleList*(cr: PContext): PRectangleList {.importc: "cairo_copy_clip_rectangle_list".}
proc rectangleListDestroy*(rectangle_list: PRectangleList) {.importc: "cairo_rectangle_list_destroy".}
# Font/Text functions
proc fontOptionsCreate*(): PFontOptions {.importc: "cairo_font_options_create".}
proc copy*(original: PFontOptions): PFontOptions {.importc: "cairo_font_options_copy".}
proc destroy*(options: PFontOptions) {.importc: "cairo_font_options_destroy".}
proc status*(options: PFontOptions): TStatus {.importc: "cairo_font_options_status".}
proc merge*(options, other: PFontOptions) {.importc: "cairo_font_options_merge".}
proc equal*(options, other: PFontOptions): TBool {.importc: "cairo_font_options_equal".}
proc hash*(options: PFontOptions): int32 {.importc: "cairo_font_options_hash".}
proc setAntialias*(options: PFontOptions, antialias: TAntialias){. cdecl, importc: "cairo_font_options_set_antialias".}
proc getAntialias*(options: PFontOptions): TAntialias {.importc: "cairo_font_options_get_antialias".}
proc setSubpixelOrder*(options: PFontOptions, subpixel_order: TSubpixelOrder) {.importc: "cairo_font_options_set_subpixel_order".}
proc getSubpixelOrder*(options: PFontOptions): TSubpixelOrder{. cdecl, importc: "cairo_font_options_get_subpixel_order".}
proc setHintStyle*(options: PFontOptions, hint_style: THintStyle){. cdecl, importc: "cairo_font_options_set_hint_style".}
proc getHintStyle*(options: PFontOptions): THintStyle {.importc: "cairo_font_options_get_hint_style".}
proc setHintMetrics*(options: PFontOptions, hint_metrics: THintMetrics) {.importc: "cairo_font_options_set_hint_metrics".}
proc getHintMetrics*(options: PFontOptions): THintMetrics {.importc: "cairo_font_options_get_hint_metrics".}
# This interface is for dealing with text as text, not caring about the
  #   font object inside the the TCairo.
proc selectFontFace*(cr: PContext, family: cstring, slant: TFontSlant, weight: TFontWeight) {.importc: "cairo_select_font_face".}
proc setFontSize*(cr: PContext, size: float64) {.importc: "cairo_set_font_size".}
proc setFontMatrix*(cr: PContext, matrix: PMatrix) {.importc: "cairo_set_font_matrix".}
proc getFontMatrix*(cr: PContext, matrix: PMatrix) {.importc: "cairo_get_font_matrix".}
proc setFontOptions*(cr: PContext, options: PFontOptions) {.importc: "cairo_set_font_options".}
proc getFontOptions*(cr: PContext, options: PFontOptions) {.importc: "cairo_get_font_options".}
proc setFontFace*(cr: PContext, font_face: PFontFace) {.importc: "cairo_set_font_face".}
proc getFontFace*(cr: PContext): PFontFace {.importc: "cairo_get_font_face".}
proc setScaledFont*(cr: PContext, scaled_font: PScaledFont) {.importc: "cairo_set_scaled_font".}
proc getScaledFont*(cr: PContext): PScaledFont {.importc: "cairo_get_scaled_font".}
proc showText*(cr: PContext, utf8: cstring) {.importc: "cairo_show_text".}
proc showGlyphs*(cr: PContext, glyphs: PGlyph, num_glyphs: int32) {.importc: "cairo_show_glyphs".}
proc textPath*(cr: PContext, utf8: cstring) {.importc: "cairo_text_path".}
proc glyphPath*(cr: PContext, glyphs: PGlyph, num_glyphs: int32) {.importc: "cairo_glyph_path".}
proc textExtents*(cr: PContext, utf8: cstring, extents: PTextExtents) {.importc: "cairo_text_extents".}
proc glyphExtents*(cr: PContext, glyphs: PGlyph, num_glyphs: int32, extents: PTextExtents) {.importc: "cairo_glyph_extents".}
proc fontExtents*(cr: PContext, extents: PFontExtents) {.importc: "cairo_font_extents".}
# Generic identifier for a font style
proc reference*(font_face: PFontFace): PFontFace {.importc: "cairo_font_face_reference".}
proc destroy*(font_face: PFontFace) {.importc: "cairo_font_face_destroy".}
proc getReferenceCount*(font_face: PFontFace): int32 {.importc: "cairo_font_face_get_reference_count".}
proc status*(font_face: PFontFace): TStatus {.importc: "cairo_font_face_status".}
proc getType*(font_face: PFontFace): TFontType {.importc: "cairo_font_face_get_type".}
proc getUserData*(font_face: PFontFace, key: PUserDataKey): pointer{. cdecl, importc: "cairo_font_face_get_user_data".}
proc setUserData*(font_face: PFontFace, key: PUserDataKey, user_data: pointer, destroy: TDestroyFunc): TStatus{. cdecl, importc: "cairo_font_face_set_user_data".}
# Portable interface to general font features
proc scaledFontCreate*(font_face: PFontFace, font_matrix: PMatrix, ctm: PMatrix, options: PFontOptions): PScaledFont{. cdecl, importc: "cairo_scaled_font_create".}
proc reference*(scaled_font: PScaledFont): PScaledFont {.importc: "cairo_scaled_font_reference".}
proc destroy*(scaled_font: PScaledFont) {.importc: "cairo_scaled_font_destroy".}
proc getReferenceCount*(scaled_font: PScaledFont): int32 {.importc: "cairo_scaled_font_get_reference_count".}
proc status*(scaled_font: PScaledFont): TStatus {.importc: "cairo_scaled_font_status".}
proc getType*(scaled_font: PScaledFont): TFontType {.importc: "cairo_scaled_font_get_type".}
proc getUserData*(scaled_font: PScaledFont, key: PUserDataKey): pointer{. cdecl, importc: "cairo_scaled_font_get_user_data".}
proc setUserData*(scaled_font: PScaledFont, key: PUserDataKey, user_data: pointer, destroy: TDestroyFunc): TStatus{. cdecl, importc: "cairo_scaled_font_set_user_data".}
proc extents*(scaled_font: PScaledFont, extents: PFontExtents){. cdecl, importc: "cairo_scaled_font_extents".}
proc textExtents*(scaled_font: PScaledFont, utf8: cstring, extents: PTextExtents) {.importc: "cairo_scaled_font_text_extents".}
proc glyphExtents*(scaled_font: PScaledFont, glyphs: PGlyph, num_glyphs: int32, extents: PTextExtents){. cdecl, importc: "cairo_scaled_font_glyph_extents".}
proc getFontFace*(scaled_font: PScaledFont): PFontFace {.importc: "cairo_scaled_font_get_font_face".}
proc getFontMatrix*(scaled_font: PScaledFont, font_matrix: PMatrix){. cdecl, importc: "cairo_scaled_font_get_font_matrix".}
proc getCtm*(scaled_font: PScaledFont, ctm: PMatrix) {.importc: "cairo_scaled_font_get_ctm".}
proc getFontOptions*(scaled_font: PScaledFont, options: PFontOptions) {.importc: "cairo_scaled_font_get_font_options".}
# Query functions
proc getOperator*(cr: PContext): TOperator {.importc: "cairo_get_operator".}
proc getSource*(cr: PContext): PPattern {.importc: "cairo_get_source".}
proc getTolerance*(cr: PContext): float64 {.importc: "cairo_get_tolerance".}
proc getAntialias*(cr: PContext): TAntialias {.importc: "cairo_get_antialias".}
proc getCurrentPoint*(cr: PContext, x, y: var float64) {.importc: "cairo_get_current_point".}
proc getFillRule*(cr: PContext): TFillRule {.importc: "cairo_get_fill_rule".}
proc getLineWidth*(cr: PContext): float64 {.importc: "cairo_get_line_width".}
proc getLineCap*(cr: PContext): TLineCap {.importc: "cairo_get_line_cap".}
proc getLineJoin*(cr: PContext): TLineJoin {.importc: "cairo_get_line_join".}
proc getMiterLimit*(cr: PContext): float64 {.importc: "cairo_get_miter_limit".}
proc getDashCount*(cr: PContext): int32 {.importc: "cairo_get_dash_count".}
proc getDash*(cr: PContext, dashes, offset: var float64) {.importc: "cairo_get_dash".}
proc getMatrix*(cr: PContext, matrix: PMatrix) {.importc: "cairo_get_matrix".}
proc getTarget*(cr: PContext): PSurface {.importc: "cairo_get_target".}
proc getGroupTarget*(cr: PContext): PSurface {.importc: "cairo_get_group_target".}
proc copyPath*(cr: PContext): PPath {.importc: "cairo_copy_path".}
proc copyPathFlat*(cr: PContext): PPath {.importc: "cairo_copy_path_flat".}
proc appendPath*(cr: PContext, path: PPath) {.importc: "cairo_append_path".}
proc destroy*(path: PPath) {.importc: "cairo_path_destroy".}
# Error status queries
proc status*(cr: PContext): TStatus {.importc: "cairo_status".}
proc statusToString*(status: TStatus): cstring {.importc: "cairo_status_to_string".}
# Surface manipulation
proc surfaceCreateSimilar*(other: PSurface, content: TContent, width, height: int32): PSurface {.importc: "cairo_surface_create_similar".}
proc reference*(surface: PSurface): PSurface {.importc: "cairo_surface_reference".}
proc finish*(surface: PSurface) {.importc: "cairo_surface_finish".}
proc destroy*(surface: PSurface) {.importc: "cairo_surface_destroy".}
proc getReferenceCount*(surface: PSurface): int32 {.importc: "cairo_surface_get_reference_count".}
proc status*(surface: PSurface): TStatus {.importc: "cairo_surface_status".}
proc getType*(surface: PSurface): TSurfaceType {.importc: "cairo_surface_get_type".}
proc getContent*(surface: PSurface): TContent {.importc: "cairo_surface_get_content".}
proc writeToPng*(surface: PSurface, filename: cstring): TStatus{. cdecl, importc: "cairo_surface_write_to_png".}
proc writeToPng*(surface: PSurface, write_func: TWriteFunc, closure: pointer): TStatus {.importc: "cairo_surface_write_to_png_stream".}
proc getUserData*(surface: PSurface, key: PUserDataKey): pointer{. cdecl, importc: "cairo_surface_get_user_data".}
proc setUserData*(surface: PSurface, key: PUserDataKey, user_data: pointer, destroy: TDestroyFunc): TStatus{. cdecl, importc: "cairo_surface_set_user_data".}
proc getFontOptions*(surface: PSurface, options: PFontOptions) {.importc: "cairo_surface_get_font_options".}
proc flush*(surface: PSurface) {.importc: "cairo_surface_flush".}
proc markDirty*(surface: PSurface) {.importc: "cairo_surface_mark_dirty".}
proc markDirtyRectangle*(surface: PSurface, x, y, width, height: int32){. cdecl, importc: "cairo_surface_mark_dirty_rectangle".}
proc setDeviceOffset*(surface: PSurface, x_offset, y_offset: float64){. cdecl, importc: "cairo_surface_set_device_offset".}
proc getDeviceOffset*(surface: PSurface, x_offset, y_offset: var float64) {.importc: "cairo_surface_get_device_offset".}
proc setFallbackResolution*(surface: PSurface, x_pixels_per_inch, y_pixels_per_inch: float64) {.importc: "cairo_surface_set_fallback_resolution".}
# Image-surface functions
proc imageSurfaceCreate*(format: TFormat, width, height: int32): PSurface{. cdecl, importc: "cairo_image_surface_create".}
proc imageSurfaceCreate*(data: Pbyte, format: TFormat, width, height, stride: int32): PSurface{. cdecl, importc: "cairo_image_surface_create_for_data".}
proc getData*(surface: PSurface): cstring {.importc: "cairo_image_surface_get_data".}
proc getFormat*(surface: PSurface): TFormat {.importc: "cairo_image_surface_get_format".}
proc getWidth*(surface: PSurface): int32 {.importc: "cairo_image_surface_get_width".}
proc getHeight*(surface: PSurface): int32 {.importc: "cairo_image_surface_get_height".}
proc getStride*(surface: PSurface): int32 {.importc: "cairo_image_surface_get_stride".}
proc imageSurfaceCreateFromPng*(filename: cstring): PSurface {.importc: "cairo_image_surface_create_from_png".}
proc imageSurfaceCreateFromPng*(read_func: TReadFunc, closure: pointer): PSurface {.importc: "cairo_image_surface_create_from_png_stream".}
# Pattern creation functions
proc patternCreateRgb*(red, green, blue: float64): PPattern {.importc: "cairo_pattern_create_rgb".}
proc patternCreateRgba*(red, green, blue, alpha: float64): PPattern {.importc: "cairo_pattern_create_rgba".}
proc patternCreateForSurface*(surface: PSurface): PPattern {.importc: "cairo_pattern_create_for_surface".}
proc patternCreateLinear*(x0, y0, x1, y1: float64): PPattern {.importc: "cairo_pattern_create_linear".}
proc patternCreateRadial*(cx0, cy0, radius0, cx1, cy1, radius1: float64): PPattern{. cdecl, importc: "cairo_pattern_create_radial".}
proc reference*(pattern: PPattern): PPattern {.importc: "cairo_pattern_reference".}
proc destroy*(pattern: PPattern) {.importc: "cairo_pattern_destroy".}
proc getReferenceCount*(pattern: PPattern): int32 {.importc: "cairo_pattern_get_reference_count".}
proc status*(pattern: PPattern): TStatus {.importc: "cairo_pattern_status".}
proc getUserData*(pattern: PPattern, key: PUserDataKey): pointer{. cdecl, importc: "cairo_pattern_get_user_data".}
proc setUserData*(pattern: PPattern, key: PUserDataKey, user_data: pointer, destroy: TDestroyFunc): TStatus{. cdecl, importc: "cairo_pattern_set_user_data".}
proc getType*(pattern: PPattern): TPatternType {.importc: "cairo_pattern_get_type".}
proc addColorStopRgb*(pattern: PPattern, offset, red, green, blue: float64) {.importc: "cairo_pattern_add_color_stop_rgb".}
proc addColorStopRgba*(pattern: PPattern, offset, red, green, blue, alpha: float64){. cdecl, importc: "cairo_pattern_add_color_stop_rgba".}
proc setMatrix*(pattern: PPattern, matrix: PMatrix) {.importc: "cairo_pattern_set_matrix".}
proc getMatrix*(pattern: PPattern, matrix: PMatrix) {.importc: "cairo_pattern_get_matrix".}
proc setExtend*(pattern: PPattern, extend: TExtend) {.importc: "cairo_pattern_set_extend".}
proc getExtend*(pattern: PPattern): TExtend {.importc: "cairo_pattern_get_extend".}
proc setFilter*(pattern: PPattern, filter: TFilter) {.importc: "cairo_pattern_set_filter".}
proc getFilter*(pattern: PPattern): TFilter {.importc: "cairo_pattern_get_filter".}
proc getRgba*(pattern: PPattern, red, green, blue, alpha: var float64): TStatus{. cdecl, importc: "cairo_pattern_get_rgba".}
proc getSurface*(pattern: PPattern, surface: PPSurface): TStatus{. cdecl, importc: "cairo_pattern_get_surface".}
proc getColorStopRgba*(pattern: PPattern, index: int32, offset, red, green, blue, alpha: var float64): TStatus{. cdecl, importc: "cairo_pattern_get_color_stop_rgba".}
proc getColorStopCount*(pattern: PPattern, count: var int32): TStatus{. cdecl, importc: "cairo_pattern_get_color_stop_count".}
proc getLinearPoints*(pattern: PPattern, x0, y0, x1, y1: var float64): TStatus{. cdecl, importc: "cairo_pattern_get_linear_points".}
proc getRadialCircles*(pattern: PPattern, x0, y0, r0, x1, y1, r1: var float64): TStatus{. cdecl, importc: "cairo_pattern_get_radial_circles".}
# Matrix functions
proc init*(matrix: PMatrix, xx, yx, xy, yy, x0, y0: float64) {.importc: "cairo_matrix_init".}
proc initIdentity*(matrix: PMatrix) {.importc: "cairo_matrix_init_identity".}
proc initTranslate*(matrix: PMatrix, tx, ty: float64) {.importc: "cairo_matrix_init_translate".}
proc initScale*(matrix: PMatrix, sx, sy: float64) {.importc: "cairo_matrix_init_scale".}
proc initRotate*(matrix: PMatrix, radians: float64) {.importc: "cairo_matrix_init_rotate".}
proc translate*(matrix: PMatrix, tx, ty: float64) {.importc: "cairo_matrix_translate".}
proc scale*(matrix: PMatrix, sx, sy: float64) {.importc: "cairo_matrix_scale".}
proc rotate*(matrix: PMatrix, radians: float64) {.importc: "cairo_matrix_rotate".}
proc invert*(matrix: PMatrix): TStatus {.importc: "cairo_matrix_invert".}
proc multiply*(result, a, b: PMatrix) {.importc: "cairo_matrix_multiply".}
proc transformDistance*(matrix: PMatrix, dx, dy: var float64) {.importc: "cairo_matrix_transform_distance".}
proc transformPoint*(matrix: PMatrix, x, y: var float64) {.importc: "cairo_matrix_transform_point".}
# PDF functions
proc pdfSurfaceCreate*(filename: cstring, width_in_points, height_in_points: float64): PSurface{. cdecl, importc: "cairo_pdf_surface_create".}
proc pdfSurfaceCreateForStream*(write_func: TWriteFunc, closure: pointer, width_in_points, height_in_points: float64): PSurface{. cdecl, importc: "cairo_pdf_surface_create_for_stream".}
proc pdfSurfaceSetSize*(surface: PSurface, width_in_points, height_in_points: float64) {.importc: "cairo_pdf_surface_set_size".}
# PS functions
proc psSurfaceCreate*(filename: cstring, width_in_points, height_in_points: float64): PSurface{. cdecl, importc: "cairo_ps_surface_create".}
proc psSurfaceCreateForStream*(write_func: TWriteFunc, closure: pointer, width_in_points, height_in_points: float64): PSurface{. cdecl, importc: "cairo_ps_surface_create_for_stream".}
proc psSurfaceSetSize*(surface: PSurface, width_in_points, height_in_points: float64) {.importc: "cairo_ps_surface_set_size".}
proc psSurfaceDscComment*(surface: PSurface, comment: cstring) {.importc: "cairo_ps_surface_dsc_comment".}
proc psSurfaceDscBeginSetup*(surface: PSurface) {.importc: "cairo_ps_surface_dsc_begin_setup".}
proc psSurfaceDscBeginPageSetup*(surface: PSurface) {.importc: "cairo_ps_surface_dsc_begin_page_setup".}
# SVG functions
proc svgSurfaceCreate*(filename: cstring, width_in_points, height_in_points: float64): PSurface{. cdecl, importc: "cairo_svg_surface_create".}
proc svgSurfaceCreateForStream*(write_func: TWriteFunc, closure: pointer, width_in_points, height_in_points: float64): PSurface{. cdecl, importc: "cairo_svg_surface_create_for_stream".}
proc svgSurfaceRestrictToVersion*(surface: PSurface, version: TSvgVersion){. cdecl, importc: "cairo_svg_surface_restrict_to_version".}
  #todo: see how translate this
  #procedure cairo_svg_get_versions(TCairoSvgVersion const **versions, # int *num_versions); proc svgVersionToString*(version: TSvgVersion): cstring {.importc: "cairo_svg_version_to_string".}
# Functions to be used while debugging (not intended for use in production code)
proc debugResetStaticData*() {.importc: "cairo_debug_reset_static_data".}

# new since 1.10
proc surfaceCreateForRectangle*(target: PSurface, x,y,w,h: cdouble): PSurface  {.importc: "cairo_surface_create_for_rectangle".}

{.pop.}

# implementation

proc version*(major, minor, micro: var int32) =
  var version: int32
  version = version()
  major = version div 10000'i32
  minor = (version mod (major * 10000'i32)) div 100'i32
  micro = (version mod ((major * 10000'i32) + (minor * 100'i32)))

proc checkStatus*(s: cairo.TStatus) {.noinline.} =
  ## if ``s != StatusSuccess`` the error is turned into an appropirate Nimrod
  ## exception and raised.
  case s
  of StatusSuccess: discard
  of StatusNoMemory:
    raise newException(OutOfMemError, $statusToString(s))
  of STATUS_READ_ERROR, STATUS_WRITE_ERROR, STATUS_FILE_NOT_FOUND,
     STATUS_TEMP_FILE_ERROR:
    raise newException(IOError, $statusToString(s))
  else:
    raise newException(AssertionError, $statusToString(s))

