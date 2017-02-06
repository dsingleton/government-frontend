require 'gds_api/content_store'

class ContentItemsController < ApplicationController
  rescue_from GdsApi::HTTPForbidden, with: :error_403
  rescue_from GdsApi::HTTPNotFound, with: :error_notfound

  def show
    load_content_item
    set_expiry
    with_locale do
      render content_item_template
    end
  end

private

  def load_content_item
    content_item = content_store.content_item(content_item_path)
    @content_item = present(content_item)
  end

  def present(content_item)
    presenter_name = content_item['schema_name'].classify + 'Presenter'
    presenter_name = "GuidesPresenter" if guides_hack
    presenter_name = "FieldsOfOperationPresenter" if fields_of_operation_hack
    presenter_class = Object.const_get(presenter_name)
    presenter_class.new(content_item, params)
  # rescue NameError
  #   raise "No support for schema \"#{content_item['schema_name']}\""
  end

  def content_item_template
    return "guides" if guides_hack
    return "fields-of-operation" if fields_of_operation_hack
    @content_item.format
  end

  def set_expiry
    max_age = @content_item.content_item.cache_control.max_age
    cache_private = @content_item.content_item.cache_control.private?
    expires_in(max_age, public: !cache_private)
  end

  def with_locale
    I18n.with_locale(@content_item.locale || I18n.default_locale) { yield }
  end

  def content_item_path
    path = URI.encode(params[:path])
    if params[:content_item_prepend]
      path = URI.encode(params[:content_item_prepend])  + path
    end
    '/' + path
  end

  def content_store
    @content_store ||= GdsApi::ContentStore.new(Plek.current.find("content-store"))
  end

  def error_403(exception)
    render plain: exception.message, status: 403
  end

  def error_notfound
    render plain: 'Not found', status: :not_found
  end

  def guides_hack
    params["path"] == 'become-lorry-bus-driver'
  end

  def fields_of_operation_hack
    params["path"] == 'government/fields-of-operation/afghanistan'
  end
end
