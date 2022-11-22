module MatchesHelper
  def current_match
    @current_match ||= Match.find_by(id: params[:id])
  end

  def is_owner?
    current_match.user_id == current_user.id
  end
end
