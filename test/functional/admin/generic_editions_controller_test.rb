require "test_helper"

class Admin::GenericEditionsControllerTest < ActionController::TestCase
  should_be_an_admin_controller

  setup do
    login_as :writer
  end

  test "POST :create redirects to edit page when 'Save and continue editing' button clicked" do
    params = attributes_for(:edition)
    assert_difference "GenericEdition.count" do
      post :create, params: { edition: params, save_and_continue: "Save and continue editing" }
    end
    assert_redirected_to edit_admin_edition_tags_path(GenericEdition.last.id)
  end

  test "PUT :update redirects to edit page when 'Save and continue' button clicked" do
    edition = create(:edition)
    put :update, params: { id: edition, edition: { title: "New title" }, save_and_continue: "Save and continue editing" }
    assert_redirected_to edit_admin_edition_tags_path(GenericEdition.last.id)
  end

  view_test "GET :edit shows the similar slug warning as an error which links to the input when user has 'Preview design system' permission" do
    current_user.permissions << "Preview design system"
    create(:edition, title: "title")
    edition_with_same_title = create(:edition, title: "title")

    get :edit, params: { id: edition_with_same_title }

    assert_select ".govuk-error-summary a", text: "Title is already used on GOV.UK. Please create a unique title", href: "#edition_title"
  end
end
