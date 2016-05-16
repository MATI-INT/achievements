module ApplicationHelper
  def gravatar_for(user, opts = {})
    opts[:alt] = user.email
    image_tag "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}?s=#{opts.delete(:size) { 40 }}",
              opts
  end

  def header(title)
    content_tag(:h1, class: 'display-4') do
      title
    end + content_tag(:hr)
  end
end
