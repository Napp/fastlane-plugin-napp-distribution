module Fastlane
  module Helper
    class NappDistributionHelper
      # class methods that you define here become available in your action
      # as `Helper::NappDistributionHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the napp_distribution plugin helper!")
      end
    end
  end
end
