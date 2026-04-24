class ClaudeCodeUsageStatusBarIterm < Formula
  desc "iTerm2 status bar component showing Claude Code usage limits in real time"
  homepage "https://github.com/rnavratil/claude-code-usage-status-bar-iterm"
  url "https://github.com/rnavratil/claude-code-usage-status-bar-iterm/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "82017c847ee10385771a2c0221197467c7a5fb6af180c7bb8e8062b776d49dfa"
  license "MIT"

  depends_on "jq"
  depends_on "bc"

  def install
    bin.install "claude-code-usage-status-bar-iterm.sh"
    prefix.install "claude-code-usage-status-bar-iterm.py"
  end

  def caveats
    <<~EOS
      Run this command to finish setup (macOS blocks Homebrew from writing to ~/Library directly):

        ln -sf "#{prefix}/claude-code-usage-status-bar-iterm.py" \
          "$HOME/Library/Application Support/iTerm2/Scripts/AutoLaunch/claude-code-usage-status-bar-iterm.py"

      Then in iTerm2:
        1. Scripts → Manage → Install Python Runtime (if not done yet)
        2. Scripts → AutoLaunch → claude-code-usage-status-bar-iterm.py
        3. Preferences → Profiles → Session → Configure Status Bar
           Drag "Claude Usage" into the active components.

      To uninstall the symlink:
        rm "$HOME/Library/Application Support/iTerm2/Scripts/AutoLaunch/claude-code-usage-status-bar-iterm.py"
    EOS
  end

  test do
    assert_predicate bin/"claude-code-usage-status-bar-iterm.sh", :exist?
    assert_predicate prefix/"claude-code-usage-status-bar-iterm.py", :exist?
  end
end
