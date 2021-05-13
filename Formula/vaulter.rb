class Vaulter < Formula
  desc "A CLI tool for 42dot"
  homepage "https://gitlab.42dot.ai/vaulter.git"
  url "https://gitlab.42dot.ai/sysadmin/vaulter.git",
       tag:      "v0.1.4",
       revision: "4c261f433029382c30cbc5a0735a3f2e66d20429"

  version "v0.1.4"
  license "42dot proprietary"

  bottle do
    root_url "https://binplate.42dot.systems/brew/vaulter/v0.1.4"
    sha256 cellar: :any_skip_relocation, big_sur: "600006a21b11a1f4bc2385ba6b686ede69fd6141d9307f303710f574076ee45a"
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
