class SubmissionDecorator < ApplicationDecorator
  decorates :submission

  def added_date
    h.content_tag(:div, h.l(submission.created_at, :format => :short) )
  end

  def content
    submission.content
  end

  def title
    h.content_tag :h2, "#{submission.title}", class: 'submission_title', id: dom_id
  end

  def title_link
    h.link_to title, h.submission_path(submission)
  end

  def dom_id
    "submission_#{submission.id}"
  end

  def type
    submission.content_type.to_s.downcase
  end

  def types
    %w(link discussion)
  end

  def url
    type == "link" ? content.url : nil
  end

  def text
    type == "discussion" ? content.text : nil
  end

  def link
    h.link_to url, url
  end

  def short_text(length=140)
    h.content_tag(:div, h.truncate(text, :length => length))
  end

  def full_text
    h.content_tag(:div, text)
  end

  def short_body(length=140)
    h.content_tag(:div, h.truncate(text, :length => length))
  end

  def body
    if type == 'link'
      link
    elsif type == 'discussion'
      full_text
    end
  end

  # Accessing Helpers
  #   You can access any helper via a proxy
  #
  #   Normal Usage: helpers.number_to_currency(2)
  #   Abbreviated : h.number_to_currency(2)
  #   
  #   Or, optionally enable "lazy helpers" by calling this method:
  #     lazy_helpers
  #   Then use the helpers with no proxy:
  #     number_to_currency(2)

  # Defining an Interface
  #   Control access to the wrapped subject's methods using one of the following:
  #
  #   To allow only the listed methods (whitelist):
  #     allows :method1, :method2
  #
  #   To allow everything except the listed methods (blacklist):
  #     denies :method1, :method2

  # Presentation Methods
  #   Define your own instance methods, even overriding accessors
  #   generated by ActiveRecord:
  #   
  #   def created_at
  #     h.content_tag :span, time.strftime("%a %m/%d/%y"), 
  #                   :class => 'timestamp'
  #   end
end
