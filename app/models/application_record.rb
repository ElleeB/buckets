class ApplicationRecord < ActiveRecord::Base
  # This is the place to put code that should be available in all your application's models.
  self.abstract_class = true

  def define_error_messages
    self.errors.each do |msg|
      msg
    end
  end
end
