# Package

version = "1.1.1"
author       = "Andreas Rumpf"
description  = "Wrapper for cairo, a vector graphics library with display and print output"
license      = "MIT"

srcDir       = "src"

# Deps

requires "nim >= 1.0.0"


task test, "Tests the tests":
  exec "nim c -r tests/arc"
  exec "nim c -r tests/clip"
  exec "nim c -r tests/clip_image"
  exec "nim c -r tests/curve_to"
  exec "nim c -r tests/dash"
  exec "nim c -r tests/fill_and_stroke"
  exec "nim c -r tests/gradient"
  exec "nim c -r tests/image"
  exec "nim c -r tests/image_pattern"
  exec "nim c -r tests/line_cap"
  exec "nim c -r tests/line_join"
  exec "nim c -r tests/rounded_rectangle"
  exec "nim c -r tests/text"
  exec "nim c -r tests/text_align"
