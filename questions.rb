class Questions
  attr_accessor :answer
  attr_accessor :question
  def initialize()
    first_number = rand(1...100)
    second_number = rand(1...100)
    @question = "What is #{first_number} + #{second_number}"
    @answer = first_number + second_number
  end
end