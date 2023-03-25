class Admin::ContentItemEditorController < Admin::BaseController
  include UsesRemoteContentEditor
  include ReverseProxy::Controller

  skip_forgery_protection

  def new
    @editor = fetch_editor
    render :new
  end

  def do_proxy_editor_actions
    document_id = params[:document_id]

    logger.info('request: ' + request.path)
    logger.info('params: ' + params.to_s)

    response = proxy_post(request)

    redirect_path = if response.code == '302'
      redirect_location = URI(response['location'])
      logger.info 'redirect location ' + redirect_location.to_s
      redirect_location.path
    end.to_s

    render html: 'document id ' + document_id.to_s + ' full path ' + request.fullpath.to_s \
      + ' response ' + response.code.to_s \
      + ' location ' + response['location'] \
      + ' redirect_path ' + redirect_path
  end

  def attributes
    {}
  end

end
