import Foundation
import ArgumentParser

@main
struct CoilCode: ParsableCommand {
    static let configuration = CommandConfiguration(
      subcommands: [],
      helpNames: [.long, .customShort("?")])

    mutating func run() throws {
    }
}
