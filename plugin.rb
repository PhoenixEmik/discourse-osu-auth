# frozen_string_literal: true

# name: discourse-osu-auth
# about: Enable login via osu OAuth
# version: 1.0
# authors: PhoenixEmik
# url: https://github.com/PhoenixEmik/discourse-osu-auth

require_relative "lib/omniauth-osu"
require_relative "lib/osu_authenticator"

enabled_site_setting :osu_auth_enabled

register_svg_icon "osu"

register_asset "stylesheets/osu-auth.scss"

auth_provider authenticator: OsuAuthenticator.new, icon: "osu"
