require 'uri'
require 'net/http'
require 'json'

module UsesRemoteContentEditor
  extend ActiveSupport::Concern

  def fetch_editor
    uri = URI('http://content-publisher.dev.gov.uk/content-editor-api/new')
    res = Net::HTTP.get_response(uri)
    editor_data = if res.is_a?(Net::HTTPSuccess)
                  JSON.parse(res.body, symbolize_names: true)
                else
                  { item: ContentItem.new(type_name: 'type name'), form_html: 'n/a' }
                end
    ContentItemEditor.new(editor_data)
  end

  def fetch_summary
    uri = URI('http://content-publisher.dev.gov.uk/content-editor-api/new')
    res = Net::HTTP.get_response(uri)
    editor_data = if res.is_a?(Net::HTTPSuccess)
                  JSON.parse(res.body, symbolize_names: true)
                else
                  { item: ContentItem.new(type_name: 'type name'), form_html: 'n/a' }
                end
    ContentItemEditor.new(editor_data)
  end

  def proxy_post(req)
    uri = URI('http://content-publisher.dev.gov.uk' + req.path)



    res = Net::HTTP.post(uri, req.body.string)
    res
  end
end