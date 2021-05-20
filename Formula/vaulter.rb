class Vaulter < Formula
  desc "A CLI tool for 42dot"
  homepage "https://gitlab.42dot.ai/vaulter.git"
  url "https://gitlab.42dot.ai/sysadmin/vaulter.git",
       tag:      "v1.0.0-beta.3",
       revision: "b1d0c87f5e763637007c63dbe67273dc2ef3cf4c"

  version "v1.0.0-beta.3"
  license "42dot proprietary"

  depends_on "go" => :build

  bottle do
    root_url "https://binplate.42dot.systems/brew/vaulter/v1.0.0-beta.3"
    sha256 cellar: :any_skip_relocation, big_sur: "d1df91cd38ab2b1a91732f49cc2d98483a599ddc0f626088711701c946f15841"
  end

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
