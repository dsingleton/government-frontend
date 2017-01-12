class WorkingGroupPresenter < EditionPresenter
  include ExtractsHeadings
  include ActionView::Helpers::UrlHelper

  def email
    content_item["details"]["email"]
  end

  def contents
    body_headings = extract_headings_with_ids(body)
    (body_headings + extra_headings).map do |heading|
      link_to(heading[:text], "##{heading[:id]}")
    end
  end

  def policies
    # When we upgrade to Ruby 2.3.0, this could be simplified with `dig`:
    # http://ruby-doc.org/core-2.3.0/Hash.html#method-i-dig
    return [] unless content_item["links"] && content_item["links"]["policies"]
    content_item["links"]["policies"]
  end

  def title_and_context
    super.tap do |t|
      t.delete(:average_title_length)
      t.delete(:context)
    end
  end

private

  def extra_headings
    extra_headings = []
    extra_headings << { id: "policies", text: "Policies" } if policies.any?
    extra_headings << { id: "contact-details", text: "Contact details" } if email.present?
    extra_headings
  end
end
