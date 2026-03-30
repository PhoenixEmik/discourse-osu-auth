# frozen_string_literal: true

require "omniauth/strategies/oauth2"

module OmniAuth
  module Strategies
    class Osu < OmniAuth::Strategies::OAuth2
      option :name, :osu

      option :client_options,
             site: "https://osu.ppy.sh",
             authorize_url: "/oauth/authorize",
             token_url: "/oauth/token",
             auth_scheme: :request_body

      option :authorize_options, [:scope]

      DEFAULT_SCOPE = "identify"

      uid { raw_info["id"].to_s }

      info do
        {
          name: raw_info["username"],
          email: raw_info["email"],
          image: raw_info["avatar_url"],
          nickname: raw_info["username"],
        }
      end

      extra { { "raw_info" => raw_info } }

      def raw_info
        @raw_info ||= access_token.get("https://osu.ppy.sh/api/v2/me").parsed
      end

      def authorize_params
        super.tap { |params| params[:scope] ||= DEFAULT_SCOPE }
      end

      def callback_url
        full_host + script_name + callback_path
      end
    end
  end
end
