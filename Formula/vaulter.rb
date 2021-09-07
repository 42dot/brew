class Vaulter < Formula
  desc "A CLI tool for 42dot"
  homepage "https://gitlab.42dot.ai/vaulter.git"
  url "https://gitlab.42dot.ai/sysadmin/vaulter.git",
       tag:      "v1.1.0-beta.1",
       revision: "2c6e2d05718b1e7f447790332e634e3c25784fb3"

  version "v1.1.0-beta.1"
  license "42dot proprietary"

  bottle do
    root_url "https://binplate.42dot.systems/brew/vaulter/v1.1.0-beta.1"
    sha256 cellar: :any_skip_relocation, big_sur: "c9e2f298c0029e581181bd85cabf1b672eb4716acefca55ea9296d12cd4b7a1b"
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
