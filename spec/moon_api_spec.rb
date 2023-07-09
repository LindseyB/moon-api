require "spec_helper"

describe "MoonApi" do
  def app
    MoonApi
  end

  describe "/" do
    it "returns the current moon phase" do
      get "/"
      expect(last_response).to be_ok
    end
  end
end