import Foundation

class ZipExtractor {

    func extract(zip: URL, to destination: URL) throws {

        let process = Process()
        process.executableURL = URL(fileURLWithPath: "/usr/bin/unzip")
        process.arguments = [
            zip.path,
            "-d",
            destination.path
        ]

        try process.run()
        process.waitUntilExit()
    }
}
