module StudentsHelper
    def date_time_format(time)
        time.present? ? time.strftime("%d %B %Y at %l:%p") : nil
    end
end
