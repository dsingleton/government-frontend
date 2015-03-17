require 'test_helper'
require 'slimmer/test_helpers/shared_templates'

class ContentItemsControllerTest < ActionController::TestCase
  include GdsApi::TestHelpers::ContentStore
  include Slimmer::TestHelpers::SharedTemplates

  test "routing handles translated content paths" do
    translated_path = 'government/case-studies/allez.fr'

    assert_routing({ path: translated_path, method: :get },
      { controller: 'content_items', action: 'show', path: translated_path })
  end

  test "gets item from content store" do
    content_item = content_store_has_schema_example('case_study', 'case_study')

    get :show, path: path_for(content_item)
    assert_response :success
    assert_equal content_item['title'], assigns[:content_item].title
  end

  test "sets the expiry as sent by content-store" do
    content_item = content_store_has_schema_example('coming_soon', 'coming_soon')

    expires_in = 20
    content_store_has_item(content_item['base_path'], content_item, expires_in)

    get :show, path: path_for(content_item)
    assert_response :success
    assert_equal "max-age=20, public", @response.headers['Cache-Control']
  end

  test "renders translated content items in their locale" do
    content_item = content_store_has_schema_example('case_study', 'translated')
    translated_format_name = I18n.t("content_item.format.case_study", count: 10, locale: 'es')

    get :show, path: path_for(content_item)

    assert_response :success
    assert_select "title", %r(#{translated_format_name})
  end

  test "gets item from content store even when url contains multi-byte UTF8 character" do
    content_item = content_store_has_schema_example('case_study', 'case_study')
    utf8_path    = "government/case-studies/caf\u00e9-culture"
    content_item['base_path'] = "/#{utf8_path}"

    content_store_has_item(content_item['base_path'], content_item)

    get :show, path: utf8_path
    assert_response :success
  end

  test "includes government navigation and sets the correct active item" do
    content_item = content_store_has_schema_example('case_study', 'case_study')

    get :show, path: path_for(content_item)

    assert_response :success
    assert_select shared_component_selector('government_navigation'), match: "case-studies"
  end

  test "returns 404 for item not in content store" do
    path = 'government/case-studies/boost-chocolate-production'

    content_store_does_not_have_item('/' + path)

    get :show, path: path
    assert_response :not_found
  end

private

  def path_for(content_item)
    content_item['base_path'].sub(/^\//, '')
  end
end