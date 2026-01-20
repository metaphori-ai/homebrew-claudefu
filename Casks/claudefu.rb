cask "claudefu" do
  version "0.3.11"
  sha256 "e47d58a1ea348f96a294345cc81588c22736d384172f8a71f4f10f3b1ee71fea"

  url "https://github.com/metaphori-ai/claudefu/releases/download/v#{version}/ClaudeFu-v#{version}-darwin-universal.zip"
  name "ClaudeFu"
  desc "Multi-Claude Code orchestration desktop app"
  homepage "https://github.com/metaphori-ai/claudefu"

  # Requires macOS 11.0 or later (Big Sur+)
  depends_on macos: ">= :big_sur"

  app "ClaudeFu.app"

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

    For unsigned builds, you may need to allow the app in:
      System Preferences > Security & Privacy > General

    Or remove the quarantine attribute:
      xattr -cr /Applications/ClaudeFu.app
  EOS
end
