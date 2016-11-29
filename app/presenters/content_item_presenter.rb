class ContentItemPresenter
  include Withdrawable

  attr_reader :content_item, :title, :description, :schema_name, :locale, :phase, :document_type

  delegate :breadcrumbs, to: :@nav_helper

  def initialize(content_item)
    @content_item = content_item
    @title = content_item["title"]
    @description = content_item["description"]
    @schema_name = content_item["schema_name"]
    @locale = content_item["locale"] || "en"
    @phase = content_item["phase"]
    @document_type = content_item["document_type"]
    @nav_helper = GovukNavigationHelpers::NavigationHelper.new(content_item)
  end

  def available_translations
    return [] if @content_item["links"]["available_translations"].nil?
    sorted_locales(@content_item["links"]["available_translations"])
  end

  def parent
    if content_item["links"].include?("parent")
      content_item["links"]["parent"][0]
    end
  end

  def content_id
    content_item.parsed_content["content_id"]
  end

private

  def display_time(timestamp)
    I18n.l(Date.parse(timestamp), format: "%-d %B %Y") if timestamp
  end

  def sorted_locales(translations)
    translations.sort_by { |t| t["locale"] == I18n.default_locale.to_s ? '' : t["locale"] }
  end
end
