require 'logger'

class HttpLogger
  def initialize(app)
    @logger = Logger.new('log/app.log')
    @app = app
  end

  def call(env)
    status, headers, response = @app.call(env)

    @logger.info(create_log(env, status, headers))

    [status, headers, response]
  end

  private

  def create_log(env, status, headers)
    action = env['simpler.action']

    "\n
    Request: #{env['REQUEST_METHOD']} #{env['REQUEST_PATH']}
    Handler: #{env['simpler.controller'].class}##{action}
    Params: #{env['simpler.params']}
    Response: #{status} #{Rack::Utils::HTTP_STATUS_CODES[status]} [#{headers['Content-Type']}] #{env['simpler.controller']&.name}/#{action}.html.erb"
  end

end