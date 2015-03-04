require "omniauth/strategies/oauth2"

module OmniAuth
  module Strategies
    class Miil < OmniAuth::Strategies::OAuth2
      option :name, "miil"
      option :client_options, {
        authorize_url: "https://miil.me/oauth/authorize",
        token_url: "https://miil.me/oauth/token",
        site: "https://miil.me"
      }

      def request_phase
        super
      end

      def authorize_params
        super.tap do |params|
          %w(scope client_options).each do |v|
            if request.params[v]
              params[v.to_sym] = request.params[v]
            end
          end
        end
      end

      def callback_url
        options[:redirect_uri] || super
      end

      uid { raw_info["user"]["user_id"].to_s }

      info do
        {
          id: raw_info["user"]["user_id"],
          name: raw_info["user"]["username"],
        }
      end

      extra do
        { raw_info: raw_info }
      end

      def raw_info
        @raw_info ||= access_token.get("/api/users/info").parsed
      end
    end
  end
end

OmniAuth.config.add_camelization "miil", "Miil"
