module PhotosHelper
  def is_current_user_photo(photo)
    current_user.id == photo.user_id
  end
end
