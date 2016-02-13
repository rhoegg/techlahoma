module OauthCookieHelper

  def env_domain
    domain = ENV['COOKIE_DOMAIN'] || 'localhost'
    domain == "localhost" ? :all : domain
  end

  def set_user_cookie(user)
    Rails.logger.error("trying to set cookie for #{env_domain}")
    cookies[:techlahoma_auth] = { :value => user.id, :domain => env_domain }
    Rails.logger.error("cookie = #{cookies[:techlahoma_auth]}")
  end

  def remove_user_cookie
    cookies.delete(:techlahoma_auth, :domain => env_domain)
  end

end

