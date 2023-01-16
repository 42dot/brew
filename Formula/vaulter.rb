class Vaulter < Formula
  desc "A CLI tool for 42dot"
  homepage "https://gitlab.42dot.ai/vaulter.git"
  url "https://gitlab.42dot.ai/sysadmin/vaulter.git",
       tag:      "v1.2.1",
       revision: "f38e2fd2d8b606e387195eb100ecd0889bf425eb"

  version "v1.2.1"
  license "42dot proprietary"

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
