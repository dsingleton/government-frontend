class GonePresenter < ContentItemPresenter
  attr_reader :alternative_path, :explanation

  def initialize(content_item)
    super
    @explanation = content_item['details']['explanation']
    @alternative_path = content_item['details']['alternative_path']
  end

  def title
    "No longer available"
  end
end
