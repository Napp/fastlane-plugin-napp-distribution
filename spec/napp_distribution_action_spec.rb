describe Fastlane::Actions::NappDistributionAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The napp_distribution plugin is working!")

      Fastlane::Actions::NappDistributionAction.run(nil)
    end
  end
end
