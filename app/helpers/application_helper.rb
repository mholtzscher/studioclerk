# Helpers for shared application level
module ApplicationHelper
  def local_time(date_time)
    date_time.to_formatted_s(:custom_long_ordinal)
  end
end
