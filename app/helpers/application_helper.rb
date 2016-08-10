module ApplicationHelper
    def local_time date_time
        date_time.localtime.to_formatted_s(:custom_long_ordinal)
    end
end
