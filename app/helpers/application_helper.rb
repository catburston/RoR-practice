module ApplicationHelper
  def flash_message
    flash_message_format(:notice) ||flash_message_format(:error)
  end

  def flash_message_format(type)
    if flash[type]
      content_tag :div, class: "#{type} message" do
        content_tag :p do
          flash[type]
        end
      end
    end
  end

  def delete_button

  end
end
