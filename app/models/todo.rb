class Todo < ApplicationRecord
  validates :title, presence:true
  validates :done, inclusion: { in: [true, false]}

  after_initialize :set_done

  def set_done
    self.done = false;
  end

end
