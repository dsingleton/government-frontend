class ContentItemPresenter
  include Withdrawable

  attr_reader :content_item, :title, :description, :format, :locale, :phase, :document_type

  delegate :breadcrumbs, to: :@nav_helper

  def initialize(content_item, params)
    @content_item = content_item
    @title = content_item["title"]
    @description = content_item["description"]
    @format = content_item["schema_name"]
    @locale = content_item["locale"] || "en"
    @phase = content_item["phase"]
    @document_type = content_item["document_type"]
    @nav_helper = GovukNavigationHelpers::NavigationHelper.new(content_item)
    @params = params
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

  def display_date(timestamp, format = "%-d %B %Y")
    I18n.l(Time.parse(timestamp), format: format) if timestamp
  end

  def sorted_locales(translations)
    translations.sort_by { |t| t["locale"] == I18n.default_locale.to_s ? '' : t["locale"] }
  end

  def text_direction
    I18n.t("i18n.direction", locale: I18n.locale, default: "ltr")
  end
end
