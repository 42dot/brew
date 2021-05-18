class Vaulter < Formula
  desc "A CLI tool for 42dot"
  homepage "https://gitlab.42dot.ai/vaulter.git"
  url "https://gitlab.42dot.ai/sysadmin/vaulter.git",
       tag:      "v1.0.0-beta.2",
       revision: "7996aedac32a9806a6985f1f6b5c88fcee3e9ae9"

  version "v1.0.0-beta.2"
  license "42dot proprietary"

  bottle do
    root_url "https://binplate.42dot.systems/brew/vaulter/v1.0.0-beta.2"
    sha256 cellar: :any_skip_relocation, big_sur: "15cc317a20ddadc93138389f3e25a80e3702ad83082a292d89bbb8278cb53348"
  end

  depends_on "go" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    system "go", "build", "-ldflags",
             "-s -w -X gitlab.42dot.ai/sysadmin/vaulter/cmd.version=#{version}",
             *std_go_args
  end

  test do
    assert_match "Vaulter: #{version}",
                 shell_output("#{bin}/vaulter version")
  end
end
