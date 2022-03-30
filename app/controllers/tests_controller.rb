class TestsController < Simpler::Controller

  def index
    @time = Time.now

    # Examples of methods for status, headers and plain text

    #set_status(404)
    #set_custom_headers({ 'Content-Type' => 'text/plain',
    #'X-Custom-Token' => 'Xz2313YuJ' })
    #render plain: "Plain text response"
  end

  def create

  end

  def show
    @test_id = @request.params[:id]
  end

end
