import Foundation
import Logger
import SwiftModuleRef

do {
  let isVerbose = CommandLine.arguments.contains("--verbose") || (ProcessInfo.processInfo.environment["DEBUG"] != nil)
  let isSilent = CommandLine.arguments.contains("--silent")
  let module = CommandLine.arguments.last!

  let logger = Logger(isVerbose: isVerbose, isSilent: isSilent)
  let interface = try generateInterface(module: module, logger: logger)
  print(interface)
} catch {
  print("Unexpected error: \(error).")
}
