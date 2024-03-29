class Gamon < Formula
  desc "GitHub Account Manager"
  homepage "https://github.com/peter-bread/gamon"
  url "https://github.com/peter-bread/gamon/archive/v1.0.5.tar.gz"
  sha256 "3f4f71c647a5bdf84d32e0c2c9f398eeffbb52014fd56d99eb715157f24559db"
  license "MIT"
  head "https://github.com/peter-bread/gamon.git", branch: "main"

  depends_on "go" => :build
  depends_on "gh"
  depends_on "yq"

  conflicts_with "python-yq", because: "both `yq` and `python-yq` install `yq` executables"

  def install
    system "go", "build", "-o", "#{bin}/gam", "."

    # Bash completions
    output = Utils.safe_popen_read("#{bin}/gam", "completion", "bash")
    (bash_completion/"gam").write output

    # Zsh completions
    output = Utils.safe_popen_read("#{bin}/gam", "completion", "zsh")
    (zsh_completion/"_gam").write output

  end

  def caveats
    <<~EOS
      To use this software, you must set the GAM_REPO_ROOT_DIR environment variable.
      You can do this in your shell configuration file (e.g., ~/.bashrc, ~/.zshrc) like so:

        export GAM_REPO_ROOT_DIR=/path/to/value

      Replace /path/to/value with the actual value for GAM_REPO_ROOT_DIR.

      It is important to note that this tool is run with the command `gam` and not `gamon`.
    EOS
  end

  test do
    system "#{bin}/gam"
  end
end
