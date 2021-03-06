module UsersHelper
  include Users::AvatarHelper

  def build_user(username, email, password)
    user = User.new username: username, email: email,
                    password: password, password_confirmation: password
  end

  def capitalize_name(user)
    return "" if user.blank?
    user.username.capitalize
  end

  ## github链接
  def github_tag(user)
    return if user.blank? || user.github.blank?
    link = "https://github.com/" + user.github
    link_to content_tag(:i, '', class: 'fa fa-github icon'), link
  end

  ## weibo链接
  def weibo_tag(user)
    return if user.blank? || user.weibo.blank?
    link = "https://weibo.com/" + user.weibo
    link_to content_tag(:i, '', class: 'fa fa-weibo icon'), link
  end

  ## email链接
  def email_tag(user)
    return if user.blank? || user.email_public.blank? || user.email.blank?
    link = "mailto: " + user.email
    link_to content_tag(:i, '', class: 'fa fa-envelope icon'), link     
  end

  ## 个人网站
  def personal_website_tag(user)
    return if user.blank? || user.website.blank?
    link = user.website !~ /^http/ ? "http://" : ""
    link += user.website
    link_to content_tag(:i, '', class: 'fa fa-globe icon'), link 
  end


end
