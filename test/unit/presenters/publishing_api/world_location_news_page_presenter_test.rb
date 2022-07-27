require "test_helper"

class PublishingApi::WorldLocationNewsPagePresenterTest < ActiveSupport::TestCase
  def present(...)
    PublishingApi::WorldLocationNewsPagePresenter.new(...)
  end

  def world_location
    @world_location ||= create(:world_location, name: "Aardistan", "title": "Aardistan and the Uk")
  end

  test "presents an item for publishing api" do
    newer_link = create(:featured_link, linkable: world_location, title: "2 days ago", created_at: 2.days.ago)
    older_link = create(:featured_link, linkable: world_location, title: "12 days ago", created_at: 12.days.ago)

    expected = {
      title: "Aardistan and the Uk",
      locale: "en",
      publishing_app: "whitehall",
      redirects: [],
      description: "Updates, news and events from the UK government in Aardistan",
      details: {
        ordered_featured_links: [
          {
            title: older_link.title,
            href: older_link.url,
          },
          {
            title: newer_link.title,
            href: newer_link.url,
          },
        ],
      },
      document_type: "placeholder_world_location_news_page",
      public_updated_at: world_location.updated_at,
      rendering_app: "whitehall-frontend",
      schema_name: "world_location_news",
      base_path: "/world/aardistan/news",
      routes: [{ path: "/world/aardistan/news", type: "exact" }],
      analytics_identifier: "WL#{world_location.id}",
      update_type: "major",
    }

    presented_content = present(world_location).content

    assert_equal expected, presented_content

    assert_valid_against_publisher_schema(presented_content, "world_location_news")
  end

  test "presents an item for rummager" do
    expected = {
      content_id: "id-123",
      link: "/world/aardistan/news",
      format: "world_location_news_page",
      title: "Aardistan and the Uk",
      description: "Updates, news and events from the UK government in Aardistan",
      indexable_content: "Updates, news and events from the UK government in Aardistan",
    }

    assert_equal expected, present(world_location).content_for_rummager("id-123")
  end

  test "it builds localised base paths correctly" do
    I18n.with_locale(:fr) do
      presented_item = present(world_location)
      base_path = presented_item.content[:base_path]

      assert_equal "/world/aardistan/news.fr", base_path
    end
  end

  test "it doesn't localise the rummager payload" do
    I18n.with_locale(:fr) do
      presented_item = present(world_location)
      base_path = presented_item.content_for_rummager("id-123")[:link]

      assert_equal "/world/aardistan/news", base_path
    end
  end
end
