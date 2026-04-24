class ClaudeCodeUsageStatusBarIterm < Formula
  desc "iTerm2 status bar component showing Claude Code usage limits in real time"
  homepage "https://github.com/rnavratil/claude-code-usage-status-bar-iterm"
  url "https://github.com/rnavratil/claude-code-usage-status-bar-iterm/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "86691b7fdb33f88e454b04da19ea09caf90347dc1ad06005d030d24e62fcd8e4"
  license "MIT"

  depends_on "jq"
  depends_on "bc"

  def install
    bin.install "claude-code-usage-status-bar-iterm.sh"
    prefix.install "claude-code-usage-status-bar-iterm.py"
  end

  def post_install
    autolaunch = "#{Dir.home}/Library/Application Support/iTerm2/Scripts/AutoLaunch"
    FileUtils.mkdir_p(autolaunch)
    FileUtils.ln_sf(
      "#{prefix}/claude-code-usage-status-bar-iterm.py",
      "#{autolaunch}/claude-code-usage-status-bar-iterm.py"
    )
  end

  def uninstall
    autolaunch = "#{Dir.home}/Library/Application Support/iTerm2/Scripts/AutoLaunch"
    FileUtils.rm_f("#{autolaunch}/claude-code-usage-status-bar-iterm.py")
  end

  def caveats
    <<~EOS
      The Python script has been symlinked to iTerm2's AutoLaunch folder.

      Remaining manual steps:
        1. In iTerm2: Scripts → Manage → Install Python Runtime (if not done yet)
        2. In iTerm2: Scripts → AutoLaunch → claude-code-usage-status-bar-iterm.py
        3. In iTerm2: Preferences → Profiles → Session → Configure Status Bar
           Drag "Claude Usage" into the active components.
    EOS
  end

  test do
    assert_predicate bin/"claude-code-usage-status-bar-iterm.sh", :exist?
    assert_predicate prefix/"claude-code-usage-status-bar-iterm.py", :exist?
  end
end
