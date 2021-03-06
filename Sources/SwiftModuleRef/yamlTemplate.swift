// This file is a template for a command sent to SourceKitten which is used in the
// generation of a module interface

struct TemplateSettings {
  let moduleName: String
  let debugDir: String
  let SDKDir: String
  let tmpDir: String
  let frameworkSearchDir: String
  let derivedDir: String
  let arch: String
  let cwd: String
}

func yamlTemplate(config: TemplateSettings) -> String {
  return """
  {
   key.request: source.request.editor.open.interface,
    key.name: "7567C1AB-48F1-4497-AECC-7E0F9C6AC187",
    key.compilerargs: [
      "-target",
      "x86_64-apple-macosx10.10",
      "-module-name",
      "\(config.moduleName)",
      "-sdk",
      "\(config.SDKDir)",
      "-I",
      "-Xcc",
      "\(config.SDKDir)/usr/local/include",
      "-F",
      "-Xcc",
      "-F",
      "\(config.debugDir)",
      "-F",
      "-Xcc",
      "-F",
      "\(config.frameworkSearchDir)",
      "-F",
      "\(config.SDKDir)/System/Library/PrivateFrameworks",
      "-D",
      "SWIFT_PACKAGE",
      "-D",
      "DEBUG",
      "-D",
      "Xcode",
      "-D",
      "DEBUG=1",
      "-Xcc",
      "-I",
      "-Xcc",
      "\(config.debugDir)",
      "-Xcc",
      "-I",
      "-Xcc",
      "\(config.debugDir)/include",
      "-Xcc",
      "-I",
      "-Xcc",
      "\(config.derivedDir)/\(config.arch)",
      "-Xcc",
      "-I",
      "-Xcc",
      "\(config.derivedDir)",
      "-Xcc",
      "-F",
      "-Xcc",
      "\(config.debugDir)",
      "-Xcc",
      "-F",
      "-Xcc",
      "\(config.frameworkSearchDir)",
      "-Xcc",
      "-D",
      "-Xcc",
      "DEBUG=1",
      "-Xcc",
      "-working-directory",
      "-Xcc",
      "\(config.cwd)",
      ""
    ],
    key.modulename: "\(config.moduleName)",
    key.toolchains: [
      "com.apple.dt.toolchain.XcodeDefault"
    ],
    key.synthesizedextensions: 1

  }
  """
}


/**
2018-12-25 21:05:52.008 Xcode[21819:5017462] SourceKit-client: [2:request:28935:36.3305] [12] {
  key.request: source.request.editor.open.interface,
  key.name: "A1DCA762-F9B0-4894-8D9C-AAA12980DC24",
  key.compilerargs: [
    "-target",
    "x86_64-apple-macosx10.10",
    "-module-name",
    "ModuleRefRunner",
    "-sdk",
    "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.14.sdk",
    "-I",
    "-Xcc",
    "-I",
    "/Users/ortatherox/Library/Developer/Xcode/DerivedData/SwiftModuleRef-gjiskxwsljpitfhewoctqkpkmddt/Build/Products/Debug",
    "-I",
    "/Users/ortatherox/Library/Developer/Xcode/DerivedData/SwiftModuleRef-gjiskxwsljpitfhewoctqkpkmddt/Build/Intermediates.noindex/SwiftModuleRef.build/Debug/ModuleRefRunner.build/swift-overrides.hmap",
    "-I",
    "/Users/ortatherox/Library/Developer/Xcode/DerivedData/SwiftModuleRef-gjiskxwsljpitfhewoctqkpkmddt/Build/Products/Debug/include",
    "-I",
    "/Users/ortatherox/dev/projects/oss/swift/libs/SwiftModuleRef/.build/checkouts/Yams.git--6591155889090299276/Sources/CYaml/include",
    "-I",
    "/Users/ortatherox/dev/projects/oss/swift/libs/SwiftModuleRef/.build/checkouts/SourceKitten-7995033943706744902/Source/SourceKit/include",
    "-I",
    "/Users/ortatherox/dev/projects/oss/swift/libs/SwiftModuleRef/.build/checkouts/SourceKitten-7995033943706744902/Source/Clang_C/include",
    "-I",
    "/Users/ortatherox/Library/Developer/Xcode/DerivedData/SwiftModuleRef-gjiskxwsljpitfhewoctqkpkmddt/Build/Intermediates.noindex/SwiftModuleRef.build/Debug/ModuleRefRunner.build/DerivedSources/x86_64",
    "-I",
    "/Users/ortatherox/Library/Developer/Xcode/DerivedData/SwiftModuleRef-gjiskxwsljpitfhewoctqkpkmddt/Build/Intermediates.noindex/SwiftModuleRef.build/Debug/ModuleRefRunner.build/DerivedSources",
    "-I",
    "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.14.sdk/usr/local/include",
    "-F",
    "-Xcc",
    "-F",
    "/Users/ortatherox/Library/Developer/Xcode/DerivedData/SwiftModuleRef-gjiskxwsljpitfhewoctqkpkmddt/Build/Products/Debug",
    "-F",
    "-Xcc",
    "-F",
    "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/Library/Frameworks",
    "-F",
    "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.14.sdk/System/Library/PrivateFrameworks",
    "-D",
    "SWIFT_PACKAGE",
    "-D",
    "DEBUG",
    "-D",
    "Xcode",
    "-D",
    "DEBUG=1",
    "-Xcc",
    "-I",
    "-Xcc",
    "/Users/ortatherox/Library/Developer/Xcode/DerivedData/SwiftModuleRef-gjiskxwsljpitfhewoctqkpkmddt/Build/Products/Debug",
    "-Xcc",
    "-I",
    "-Xcc",
    "/Users/ortatherox/Library/Developer/Xcode/DerivedData/SwiftModuleRef-gjiskxwsljpitfhewoctqkpkmddt/Build/Intermediates.noindex/SwiftModuleRef.build/Debug/ModuleRefRunner.build/swift-overrides.hmap",
    "-Xcc",
    "-I",
    "-Xcc",
    "/Users/ortatherox/Library/Developer/Xcode/DerivedData/SwiftModuleRef-gjiskxwsljpitfhewoctqkpkmddt/Build/Products/Debug/include",
    "-Xcc",
    "-I",
    "-Xcc",
    "/Users/ortatherox/dev/projects/oss/swift/libs/SwiftModuleRef/.build/checkouts/Yams.git--6591155889090299276/Sources/CYaml/include",
    "-Xcc",
    "-I",
    "-Xcc",
    "/Users/ortatherox/dev/projects/oss/swift/libs/SwiftModuleRef/.build/checkouts/SourceKitten-7995033943706744902/Source/SourceKit/include",
    "-Xcc",
    "-I",
    "-Xcc",
    "/Users/ortatherox/dev/projects/oss/swift/libs/SwiftModuleRef/.build/checkouts/SourceKitten-7995033943706744902/Source/Clang_C/include",
    "-Xcc",
    "-I",
    "-Xcc",
    "/Users/ortatherox/Library/Developer/Xcode/DerivedData/SwiftModuleRef-gjiskxwsljpitfhewoctqkpkmddt/Build/Intermediates.noindex/SwiftModuleRef.build/Debug/ModuleRefRunner.build/DerivedSources/x86_64",
    "-Xcc",
    "-I",
    "-Xcc",
    "/Users/ortatherox/Library/Developer/Xcode/DerivedData/SwiftModuleRef-gjiskxwsljpitfhewoctqkpkmddt/Build/Intermediates.noindex/SwiftModuleRef.build/Debug/ModuleRefRunner.build/DerivedSources",
    "-Xcc",
    "-F",
    "-Xcc",
    "/Users/ortatherox/Library/Developer/Xcode/DerivedData/SwiftModuleRef-gjiskxwsljpitfhewoctqkpkmddt/Build/Products/Debug",
    "-Xcc",
    "-F",
    "-Xcc",
    "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/Library/Frameworks",
    "-Xcc",
    "-D",
    "-Xcc",
    "DEBUG=1",
    "-Xcc",
    "-working-directory",
    "-Xcc",
    "/Users/ortatherox/dev/projects/oss/swift/libs/SwiftModuleRef",
    ""
  ],
  key.modulename: "SwiftModuleRef",
  key.toolchains: [
    "com.apple.dt.toolchain.XcodeDefault"
  ],
  key.synthesizedextensions: 1
}

**/
