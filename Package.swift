import PackageDescription

#if os(OSX)
    let gtkUrl = "https://bitbucket.org/clanat/cgtk-osx"
#elseif os(Linux)
    let gtkUrl = "https://bitbucket.org/clanat/cgtk-linux"
#else
    fatalError("Unsupported platform.")
#endif

let package = Package(
    name: "Smart",
    dependencies: [
        .Package(url: gtkUrl, majorVersion: 1)
    ]
)
