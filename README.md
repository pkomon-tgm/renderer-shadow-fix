# alpine-renderer
A developer version is available at [alpinemaps.org](https://alpinemaps.org), and an apk for android under https://alpinemaps.org/apk. Be aware that it can break at any time!

We are in discord, talk to us!
https://discord.gg/p8T9XzVwRa

# cloning and building
`git clone --recurse-submodules git@github.com:AlpineMapsOrg/renderer.git`

or a normal clone and

`git submodule init && git submodule update`

After that it should be a normal cmake project. that is, you run cmake to generate a project or build file and then run your favourite tool.
We use Qt Creator (with mingw on Windows), which is the only tested setup atm and makes setup of Android and WebAssembly builds reasonably easy. If you have questions, please open a new [discussion](https://github.com/AlpineMapsOrg/renderer/discussions).

# dependencies for the native and android build
* Qt 6.5.0 (!), or greater
* OpenGL
* Qt Positioning and qt5 compatibility modules
* some other dependencies will be pulled during building

# for building the WebAssembly version:
* Qt 6.5.1 (!), or greater (there is an important bug fix in the unreleased 6.5.1, without it, you can't search. so either use 6.6 from the installer or use 6.5 and live without search)
* [WebAssembly version compatible with the Qt version](https://doc-snapshots.qt.io/qt6-dev/wasm.html#installing-emscripten)
* The threaded version doesn't seem to work atm, so use the non-threaded!

# code style
* class names are CamelCase, method and variable names are snake_case.
* class attributes have an m_ prefix and are usually private, struct attributes don't and are usually public.
* structs are usually small, simple, and have no or only few methods. they never have inheritance.
* files are CamelCase if the content is a CamelCase class. otherwise they are snake_case, and have a snake_case namespace with stuff.
* the folder/structure.h is reflected in namespace folder::structure{ .. }
* indent with space only, indent 4 spaces
* ideally, use clang-format with the WebKit style  
  (in case you use Qt Creator, go to Preferences -> C++ -> Code Style: Formatting mode: Full, Format while typing, Format edited code on file save, Clang-Format Style -> BasedOnStyle=WebKit)

