module Fastlane
  module Actions
    class NappDistributionAction < Action
      def self.run(params)
        UI.message("The napp_distribution plugin is working!")

        # set the base url
        base_url = "https://i.napp.dk"
        if params[:base_url]
          base_url = params[:base_url]
        end

        file_path = params[:file_path]
        client_id = params[:client_id]
        api_key = params[:api_key]

        connection = self.connection(base_url)

        if !File.exist?(file_path)
          UI.user_error("App build file not found 🚫")
          abort
        end

        # setting the payload
        payload = {}
        payload[:file] = Faraday::UploadIO.new(file_path, 'application/octet-stream')
        payload[:client] = client_id

        response = connection.post do |req|
          req.url("/api/clients/upload")
          req.headers['X-NAPP-API-KEY'] = api_key
          req.body = payload
        end

        case response.status
        when 200...300
          app_version_id = response.body['version']
          platform = response.body['platform']
          UI.message("Successfully created new app build version: #{app_version_id} for #{platform}")
        else
          UI.error("Error trying to upload new app build: #{response.status} - #{response.body}")
        end

      end

      #
      def self.connection(base_url)
        require 'faraday'
        require 'faraday_middleware'

        foptions = {
          url: base_url
        }
        Faraday.new(foptions) do |builder|
          builder.request :multipart
          builder.request :url_encoded
          builder.response :json, content_type: /\bjson$/
          builder.use FaradayMiddleware::FollowRedirects
          builder.adapter :net_http
        end
      end

      def self.description
        "Upload builds to Napp Distribution Center"
      end

      def self.authors
        ["Mads Møller"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "Upload builds to Napp Distribution Center"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :api_key,
                                       env_name: "NAPP_DISTRIBUTION_API_KEY",
                                       description: "API Key",
                                       optional: false,
                                       type: String),
          FastlaneCore::ConfigItem.new(key: :client_id,
                                        env_name: "NAPP_DISTRIBUTION_CLIENT_ID",
                                        optional: false,
                                        description: "Client name",
                                        type: String),
          FastlaneCore::ConfigItem.new(key: :file_path,
                                        env_name: "NAPP_DISTRIBUTION_FILE_PATH",
                                        optional: false,
                                        description: "File path of the app build",
                                        type: String),
          FastlaneCore::ConfigItem.new(key: :base_url,
                                       env_name: "NAPP_DISTRIBUTION_BASE_URL",
                                       optional: true,
                                       type: String,
                                       description: "Private cloud option")
        ]
      end

      def self.is_supported?(platform)
        [:ios, :android].include?(platform)
      end
    end
  end
end
