import Foundation
import ArgumentParser
import CoilCodeLang

@main
struct CoilCode: ParsableCommand {
    static let configuration = CommandConfiguration(
      subcommands: [],
      helpNames: [.long, .customShort("?")])

    mutating func run() throws {
    }
}
