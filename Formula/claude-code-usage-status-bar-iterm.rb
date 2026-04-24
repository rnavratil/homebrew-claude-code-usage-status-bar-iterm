class ClaudeCodeUsageStatusBarIterm < Formula
  desc "iTerm2 status bar component showing Claude Code usage limits in real time"
  homepage "https://github.com/rnavratil/claude-code-usage-status-bar-iterm"
  url "https://github.com/rnavratil/claude-code-usage-status-bar-iterm/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "b1278b9f6ea949d8db8709a9a3533d1a665f7b500b62c421ac86e852a7139b2a"
  license "MIT"

  depends_on "jq"
  depends_on "bc"

  def install
    bin.install "claude-code-usage-status-bar-iterm.sh"
    prefix.install "claude-code-usage-status-bar-iterm.py"
  end

  def caveats
    <<~EOS
      ⚠️  One manual step required to finish setup:

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
