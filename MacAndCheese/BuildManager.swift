import Foundation

class BuildManager {

    func build(zip: URL) {

        let temp = FileManager.default.temporaryDirectory
            .appendingPathComponent("project")

        try? FileManager.default.removeItem(at: temp)

        let unzip = Process()
        unzip.executableURL = URL(fileURLWithPath: "/usr/bin/unzip")
        unzip.arguments = [zip.path, "-d", temp.path]

        try? unzip.run()
        unzip.waitUntilExit()

        run("/usr/bin/make", directory: temp.path)

        run("/opt/devkitpro/tools/bin/bannertool", directory: temp.path)

        run("/opt/devkitpro/tools/bin/makerom", directory: temp.path)

        print("CIA gerado!")
    }

    private func run(_ cmd: String, directory: String) {
        let p = Process()
        p.currentDirectoryURL = URL(fileURLWithPath: directory)
        p.executableURL = URL(fileURLWithPath: cmd)

        try? p.run()
        p.waitUntilExit()
    }
}
