<!-- markdownlint-configure-file
{
  "required-headings": {
    "headings": [
      "# Universal Mach-O Proof-of-Concept Repo",
      "## Disclaimer",
      "*",
      "## Related Issues",
      "*"
    ]
  }
}
-->

# Universal Mach-O Proof-of-Concept Repo

VSCode [debug is currently broken][1] on macOS M1 machines (`aarch64` / `arm64`).
(As of 2021-01-25)

This repo is a simple proof-of-concept for how to get
VSCode to build & debug a simple Hello World program written in C.

## Disclaimer

This **should not** be seen as "Best Practices" in any way...
This is merely one example of how to work around the issues with using [`ms-vscode.cpptools`][2]
in its current state.

Please see the [macOS Developer Documentation][3] for Apple's recommended method(s).

## Related Issues

- [microsoft/vscode-cpptools#7035][1]
- [microsoft/vscode-cpptools#6779][4]
- [microsoft/vscode-cpptools#2376][5]
- [microsoft/vscode-cpptools#5079][6]
- [microsoft/vscode-cpptools#2438][7]

[1]: https://github.com/microsoft/vscode-cpptools/issues/7035
[2]: https://github.com/microsoft/vscode-cpptools
[3]: https://developer.apple.com/documentation/apple-silicon/building-a-universal-macos-binary
[4]: https://github.com/microsoft/vscode-cpptools/issues/6779
[5]: https://github.com/microsoft/vscode-cpptools/issues/2376
[6]: https://github.com/microsoft/vscode-cpptools/issues/5079
[7]: https://github.com/microsoft/vscode-cpptools/issues/2438
