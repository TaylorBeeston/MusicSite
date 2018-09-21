module SongsHelper
  include ActsAsTaggableOn::TagsHelper

  def stopSongText
    "Any music playing will stop. Are you sure?"
  end

  def merge_params(param)
    request.query_parameters.merge(param)
  end

  def remove_search_tag(old_tags, tag)
    merge_params(tags: old_tags - [tag])
  end

  def tags_params(old_tags, tag)
    if old_tags.nil?
      tag_string = [tag]
    else
      tag_string = old_tags + [tag]
    end
    merge_params(tags: tag_string)
  end
end
