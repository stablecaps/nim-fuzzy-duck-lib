import std/osproc
import std/strutils
import std/strformat
import std/json
import std/terminal
import std/httpclient

proc stripSpacesandLowerStr*(myStr: string): string =
    result = myStr.toLowerAscii(
        ).replace(" ", "")
