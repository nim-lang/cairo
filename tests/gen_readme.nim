# generates tests markdown

import os
import strutils


echo """
# Cairo

Nim Cairo wrapper, solving your vector and text drawing needs.

"""


proc cutBetween(str, a, b: string): string =
  let
    cutA = str.find(a)
    cutB = str.find(b)
  if cutA == -1 or cutB == -1:
    return ""
  return str[cutA + a.len..<cutB]


for kind, path in walkDir("tests"):
  if path.endsWith("nim"):
    let code = readFile(path)
    let innerCode = code.cutBetween("surface.create()\n", "\ndiscard surface.writeToPng(")
    if innerCode != "":
      echo "## example: ", path.replace("\\", "/")
      echo "```nim"
      echo innerCode
      echo "```"
      echo "![example output](", path.replace(".nim", ".png").replace("\\", "/"), ")"
      echo ""


echo """

# Realtime

![realtime example](https://github.com/treeform/quickcairo/raw/master/examples/realtime.png)

You can also use cairo for real time graphics using. Here are examples on how to use cairo with:
  * [SDL2](https://github.com/treeform/quickcairo/blob/master/examples/realtime_sdl2.nim)
  * [GLUT](https://github.com/treeform/quickcairo/blob/master/examples/realtime_glut.nim)
  * [GLFW](https://github.com/treeform/quickcairo/blob/master/examples/realtime_glfw.nim)

"""
