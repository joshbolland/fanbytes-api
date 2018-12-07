module Campaign::Contract
  class Create < Reform::Form
    property :title
    property :start_date
    property :budget
    property :brief

    validates :title, presence: true
    validates :start_date, presence: true, in_future: true
    validates :budget, presence: true
    validates :brief, presence: true
  end
end
