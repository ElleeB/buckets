class ApplicationRecord < ActiveRecord::Base
  # This is the place to put code that should be available in all your application's models.
  self.abstract_class = true

  # is this supposed to be here?
  def define_error_messages
    self.errors.each do |msg|
      msg
    end
  end
end
