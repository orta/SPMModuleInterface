import Foundation
import Logger

enum SpawnError: Error {
    case commandFailed(exitCode: Int32, stdout: String, stderr: String, task: Process)
}

@discardableResult
func execProcess(_ command: String, _ arguments: [String] = [], _ logger: Logger) throws -> String {
    let script = "\(command) \(arguments.joined(separator: " "))"
    logger.debug("> \(script)")

    var env = ProcessInfo.processInfo.environment
    let task = Process()
    task.launchPath = env["SHELL"]
    task.arguments = ["-l", "-c", script]
    task.currentDirectoryPath = FileManager.default.currentDirectoryPath

    let stdout = Pipe()
    task.standardOutput = stdout
    let stderr = Pipe()
    task.standardError = stderr
    task.launch()
    task.waitUntilExit()

    // Pull out the STDOUT as a string because we'll need that regardless
    let stdoutData = stdout.fileHandleForReading.readDataToEndOfFile()
    let stdoutString = String(data: stdoutData, encoding: String.Encoding.utf8)!

    // 0 is no problems in unix land
    if task.terminationStatus == 0 {
        return stdoutString
    }

    // OK, so it failed, raise a new error with all the useful metadata
    let stderrData = stdout.fileHandleForReading.readDataToEndOfFile()
    let stderrString = String(data: stderrData, encoding: String.Encoding.utf8)!

    throw SpawnError.commandFailed(exitCode: task.terminationStatus, stdout: stdoutString, stderr: stderrString, task: task)
}
