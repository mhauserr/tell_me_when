require 'tell_me_when'
require 'rspec'

describe TellMeWhen, "#score" do
  let(:support) {'spec/support/example.html'}
  let(:tell) {TellMeWhen::TellMeWhen}
  it "it should output help with no input" do
    expect{ tell.new([], []) }.to output(/Usage/).to_stdout
  end

  it "should output the version number with -v" do
    expect{ tell.new("--version", []) }.to output(/#{TellMeWhen::VERSION}/).to_stdout
  end

  it "should default to css and appear" do
    expect{tell.new([ "--match=Hello", support, "h1",
                      "--no-gui" ], [])}.to output("woohoo\n").to_stdout
  end

  it "should work with --css --appear --match" do
    expect{tell.new([ "--css", "--appears", "--match=Hello",
                      support, "h1", "--no-gui" ], [])}.to output("woohoo\n").to_stdout
  end

  it "should do the opposite with --css --disappear --match" do
    expect{tell.new([ "--css", "--disappears", "--match=Hello",
                      support, "h1", "--no-gui" ], [])}.to output("nope\n").to_stdout
  end

  it "should not work for css with an incorrect match" do
    expect{tell.new([ "--css", "--appears", "--match=Nope",
                      support, "h1", "--no-gui" ], [])}.to output("nope\n").to_stdout
  end

  it "should work with --xpath --appear --match" do
    expect{tell.new([ "--xpath", "--appears", "--match=Hello",
                      support, "//h1", "--no-gui" ], [])}.to output("woohoo\n").to_stdout
  end

  it "should do the opposite with --xpath --disappear --match" do
    expect{tell.new([ "--xpath", "--disappears", "--match=Hello",
                      support, "//h1", "--no-gui" ], [])}.to output("nope\n").to_stdout
  end

  it "should not work for xpath with an incorrect match" do
    expect{tell.new([ "--xpath", "--appears", "--match=nope",
                      support, "//h1", "--no-gui" ], [])}.to output("nope\n").to_stdout
  end

  it "should work with more complicated xpath expressions" do
    expect{tell.new([ "--xpath", "--appears", support,
                      '//ul[@id="example" and @class="other-example"]',
                      "--no-gui" ], [])}.to output("woohoo\n").to_stdout
  end

end
