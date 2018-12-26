import Foundation
import Logger
import SourceKittenFramework

public func generateInterface(module: String, logger: Logger) throws -> String {
    logger.logInfo("Generating interface for: \(module)")

    // Make sure there's an up-to-date Xcode project file
    logger.logInfo("1. Updating the Swift PM Xcode Project")
    try execProcess("swift", ["package", "generate-xcodeproj"], logger)

    // Grab values from Xcode
    logger.logInfo("2. Grabbing your Xcode settings")
    let ma = try getSourceKitModuleInterface(module: module, logger: logger)

    logger.logInfo("3. Printing module interface:\n")
    return ma["key.sourcetext"] as! String
}

public func getSourceKitModuleInterface(module: String, logger: Logger) throws -> [String: Any] {
    let config = try execProcess("xcodebuild", ["-project", "*.xcodeproj", "-target", module, "-showBuildSettings", "-configuration", "Debug"], logger)

    let debugDir = config.components(separatedBy: "CONFIGURATION_BUILD_DIR = ")[1].components(separatedBy: "\n")[0]
    let SDKDir = config.components(separatedBy: "SDKROOT = ")[1].components(separatedBy: "\n")[0]
    let tmpDir = config.components(separatedBy: "PROJECT_TEMP_ROOT = ")[1].components(separatedBy: "\n")[0]
    let frameworkSearchDir = config.components(separatedBy: "FRAMEWORK_SEARCH_PATHS = ")[1].components(separatedBy: "\n")[0]
    let derivedDir = config.components(separatedBy: "DERIVED_FILES_DIR = ")[1].components(separatedBy: "\n")[0]
    let arch = config.components(separatedBy: "arch = ")[1].components(separatedBy: "\n")[0]

    let templateConfig = TemplateSettings(
        moduleName: module,
        debugDir: debugDir,
        SDKDir: SDKDir,
        tmpDir: tmpDir,
        frameworkSearchDir: frameworkSearchDir,
        derivedDir: derivedDir,
        arch: arch,
        cwd: FileManager.default.currentDirectoryPath
    )
    let requestYML = yamlTemplate(config: templateConfig)

    logger.debug("Making sourcekit request:\n")
    logger.debug(requestYML)
    let req = Request.yamlRequest(yaml: requestYML)
    
    return try req.send()
}
