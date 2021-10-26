class TestLogJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts 'I run when someone goes to index'
  end
end
