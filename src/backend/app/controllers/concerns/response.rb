# frozen_string_literal: true

module Response
  def render_ok(data: {}, total_count: 0)
    render json: {
      status: 'ok',
      data: data,
      total_count: total_count
    }, status: :ok
  end

  def render_errors(errors: {}, code: 400)
    render json: {
      status: false,
      data: errors,
      code: code
    }, status:  :ok
  end
end
