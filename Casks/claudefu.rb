cask "claudefu" do
  version "0.5.14"
  sha256 "bc442e7e8439f27ea261cb4caae39ab2c9e9ecc2be7c697dfe7190ce1d13745f"

  url "https://github.com/metaphori-ai/claudefu/releases/download/v#{version}/ClaudeFu-v#{version}-darwin-universal.zip"
  name "ClaudeFu"
  desc "Multi-Claude Code orchestration desktop app"
  homepage "https://github.com/metaphori-ai/claudefu"

  # Requires macOS 11.0 or later (Big Sur+)
  depends_on macos: ">= :big_sur"

  app "ClaudeFu.app"
  binary "#{appdir}/ClaudeFu.app/Contents/MacOS/ClaudeFu", target: "claudefu"

  # Ensure clean upgrade by explicitly removing old version
  uninstall quit: "com.wails.claudefu",
            delete: "/Applications/ClaudeFu.app"

  zap trash: [
    "~/.claudefu",
    "~/Library/Application Support/ClaudeFu",
    "~/Library/Caches/ClaudeFu",
    "~/Library/Preferences/com.claudefu.app.plist",
  ]

  caveats <<~EOS
    ClaudeFu requires Claude Code CLI to be installed:
      npm install -g @anthropic-ai/claude-code

    Launch from terminal:
      claudefu

    For unsigned builds, you may need to allow the app in:
      System Preferences > Security & Privacy > General

    Or remove the quarantine attribute:
      xattr -cr /Applications/ClaudeFu.app
  EOS
end
