require "test_helper"

class Admin::LegacyStatisticalDataSetsControllerTest < ActionController::TestCase
  tests Admin::StatisticalDataSetsController

  setup do
    StatisticalDataSet.stubs(access_limited_by_default?: false)
    login_as :writer
  end

  legacy_should_be_an_admin_controller

  legacy_should_allow_creating_of :statistical_data_set
  legacy_should_allow_editing_of :statistical_data_set

  legacy_should_allow_organisations_for :statistical_data_set
  legacy_should_prevent_modification_of_unmodifiable :statistical_data_set
  legacy_should_allow_alternative_format_provider_for :statistical_data_set
  legacy_should_allow_overriding_of_first_published_at_for :statistical_data_set
  legacy_should_allow_scheduled_publication_of :statistical_data_set
  legacy_should_allow_access_limiting_of :statistical_data_set

  def controller_attributes_for(edition_type, attributes = {})
    super.except(:alternative_format_provider).reverse_merge(
      alternative_format_provider_id: create(:alternative_format_provider).id,
    )
  end
end
