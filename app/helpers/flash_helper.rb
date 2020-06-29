# Helper methods for displaying flash messages
module FlashHelper
  FLASH_CLASSES = {
    'success' => 'alert-success',
    'error' => 'alert-danger',
    'alert' => 'alert-warning',
    'notice' => 'alert-info'
  }.freeze

  def flash_messages
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "mt-3 alert #{FLASH_CLASSES.fetch(msg_type)}", role: 'alert'))
    end
    nil
  end
end
