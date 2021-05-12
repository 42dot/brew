class Vaulter < Formula
  desc "A CLI tool for 42dot"
  homepage "https://gitlab.42dot.ai/vaulter.git"
  url "https://gitlab.42dot.ai/sysadmin/vaulter.git",
       tag:      "v0.1.3",
       revision: "64eb3ac7b51c5c3ec039f31f10cd9ceb67de123d"

  version "v0.1.3"
  license "42dot proprietary"

  bottle do
    root_url "https://binplate.42dot.io/brew/vaulter/v0.1.3"
    sha256 cellar: :any_skip_relocation, big_sur: "16b5e98e3830964d3c5db3e785137ef9623cb91e179910bfca2c7824f09bcf82"
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
