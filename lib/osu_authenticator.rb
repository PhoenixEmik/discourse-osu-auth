# frozen_string_literal: true

class OsuAuthenticator < ::Auth::ManagedAuthenticator
  def name
    "osu"
  end

  def enabled?
    SiteSetting.osu_auth_enabled
  end

  def register_middleware(omniauth)
    omniauth.provider :osu,
                      setup:
                        lambda { |env|
                          strategy = env["omniauth.strategy"]
                          strategy.options[:client_id] = SiteSetting.osu_auth_client_id
                          strategy.options[:client_secret] = SiteSetting.osu_auth_client_secret
                        }
  end

  # osu requires a verified email address to register an account
  def primary_email_verified?(_auth_token)
    true
  end
end
