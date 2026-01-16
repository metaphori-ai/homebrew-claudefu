# Homebrew Tap for ClaudeFu

This is the official Homebrew tap for [ClaudeFu](https://github.com/metaphori-ai/claudefu), a multi-Claude Code orchestration desktop app.

## Installation

```bash
brew tap metaphori-ai/claudefu
brew install --cask claudefu
```

## Upgrade

```bash
brew upgrade --cask claudefu
```

## Uninstall

```bash
brew uninstall --cask claudefu
```

## Requirements

- macOS 11.0 (Big Sur) or later
- [Claude Code CLI](https://github.com/anthropics/claude-code) installed:
  ```bash
  npm install -g @anthropic-ai/claude-code
  ```

## Troubleshooting

### "App is damaged" or "unidentified developer" warning

For unsigned builds, macOS Gatekeeper may block the app. You can either:

1. **Right-click → Open** the app (one-time bypass)
2. **System Preferences → Security & Privacy → General** → Click "Open Anyway"
3. Remove the quarantine attribute:
   ```bash
   xattr -cr /Applications/ClaudeFu.app
   ```

## Links

- [ClaudeFu Repository](https://github.com/metaphori-ai/claudefu)
- [Report Issues](https://github.com/metaphori-ai/claudefu/issues)
