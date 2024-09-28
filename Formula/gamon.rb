class Gamon < Formula
  desc "GitHub Account Manager"
  homepage "https://github.com/peter-bread/gamon"
  url "https://github.com/peter-bread/gamon/archive/v2.0.4.tar.gz"
  sha256 "83393442328288fb509a5b26fccbccf636f33a65bd413cf1c124aced37d964ee"
  license "MIT"
  head "https://github.com/peter-bread/gamon.git", branch: "main"

  depends_on "go" => :build
  depends_on "gh"

  def install
    system "go", "build", "-o", "#{bin}/gam", "."

    # Bash completions
    output = Utils.safe_popen_read("#{bin}/gam", "completion", "bash")
    (bash_completion / "gam").write output

    # Zsh completions
    output = Utils.safe_popen_read("#{bin}/gam", "completion", "zsh")
    (zsh_completion / "_gam").write output
  end

  def caveats
    <<~EOS
      To use this software, you must set the GAM_REPO_ROOT_DIR environment variable.
      You can do this in your shell configuration file (e.g., ~/.bashrc, ~/.zshrc) like so:

        export GAM_REPO_ROOT_DIR=/path/to/value

      Replace /path/to/value with the actual value for GAM_REPO_ROOT_DIR.

      It is important to note that this tool is run with the command `gam` and not `gamon`.

      To hook into your shell, add the following to your shell rc file:

        source <(gam hook)

          OR

        eval "$(gam hook)"

      WARNING: This only works properly for bash and zsh.
    EOS
  end

  test do
    system "#{bin}/gam"
  end
end
