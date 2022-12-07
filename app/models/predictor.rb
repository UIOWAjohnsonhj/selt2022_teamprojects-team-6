require 'decisiontree'
require 'rubygems'

class Predictor < ActiveRecord::Base
  def self.predict(data)
    # Create a new Decision Tree classifier
    attributes = ['GPA', 'Undergraduate School', 'Applied School', 'Applied Major']
    training = [
      ['3.0', 'UC Berkeley', 'UC Berkeley', 'Computer Science', 1],
      ['4.0', 'University of Iowa', 'Harvard', 'Mechanical Engineering', 1],
      ['3.5', 'University of Iowa', 'UC Berkeley', 'Computer Science', 1],
      ['3.0', 'University of Iowa', 'UC Berkeley', 'Mechanical Engineering', 0],
      ['3.25', 'Harvard', 'UC Berkeley', 'Computer Science', 1],
      ["3.7", "University of Arizona", "University of California - Berkeley", "Computer Science", 1],
      ["3.6", "University of California - Los Angeles", "University of Colorado - Boulder", "Biology", 0],
      ["3.9", "Stanford University", "University of Michigan", "Mechanical Engineering", 1],
      ["3.2", "University of Texas - Austin", "University of California - Santa Barbara", "Chemistry", 0],
      ["3.8", "University of Florida", "University of Washington", "Biomedical Engineering", 1],
      ["3.1", "University of Missouri", "University of Illinois - Urbana Champaign", "Aerospace Engineering", 0],
      ["3.5", "University of Wisconsin - Madison", "University of California - Davis", "Computer Engineering", 1],
      ["3.4", "University of Southern California", "University of California - San Diego", "Environmental Engineering", 0],
      ["3.7", "University of Minnesota", "University of Massachusetts - Amherst", "Electrical Engineering", 1],
      ["3.3", "University of Kansas", "University of Oregon", "Civil Engineering", 0],
      ["3.6", "University of California - Berkeley", "University of California - Berkeley", "Computer Science", 1],
      ["3.9", "University of New Mexico", "University of Pennsylvania", "Biochemistry", 1],
      ["3.2", "University of Iowa", "Northwestern University", "Interdisciplinary Studies", 0],
      ["3.8", "University of Georgia", "Yale University", "Data Science", 1],
      ["3.5", "University of Vermont", "University of Virginia", "Psychology", 0],
      ["3.6", "University of Delaware", "Cornell University", "Biotechnology", 1],
      ["3.1", "University of Arkansas", "University of Pittsburgh", "Mathematics", 0],
      ["3.7", "University of Nebraska", "Rice University", "Philosophy", 1],
      ["3.4", "University of Oklahoma", "Princeton University", "Sociology", 0],
      ["3.9", "University of Montana", "Georgetown University", "Economics", 1],
      ["3.3", "University of South Dakota", "Emory University", "Anthropology", 0],
      ["3.8", "University of North Dakota", "Duke University", "Political Science", 1],
      ["3.5", "University of Wyoming", "University of Chicago", "History", 0],
      ["3.6", "University of Idaho", "University of Notre Dame", "English", 1],
      ["3.1", "University of Mississippi", "University of California - Los Angeles", "Business", 0],
      ["3.7", "University of Alabama", "University of California - San Diego", "Finance", 1],
      ["3.4", "University of Tennessee", "University of California - Santa Barbara", "Marketing", 0],
      ["3.9", "University of Louisiana", "University of California - Irvine", "Accounting", 1],
      ["3.2", "University of South Carolina", "University of California - Santa Cruz", "Management", 0],
      ["3.3", "University of Iowa", "Harvard", "Computer Science", 0],
    # ... more training examples
    ]

    # Instantiate the tree, and train it based on the data (set default to '1')
    dec_tree = DecisionTree::ID3Tree.new(attributes, training, 1, :discrete)
    dec_tree.train

    test = [['4.0', 'University of Iowa', 'Harvard', 'Computer Science'],
            ['3.0', 'University of Iowa', 'UC Berkeley', 'Computer Science'],
            ['3.5', 'University of Iowa', 'UC Berkeley', 'Computer Science'],
            ['3.3', 'Harvard', 'UC Berkeley', 'Computer Science'],
            ['3.7', 'University of Arizona', 'University of California - Berkeley', 'Computer Science'],
            ['3.6', 'University of California - Los Angeles', 'University of Colorado - Boulder', 'Biology'],
            ['3.9', 'Stanford University', 'University of Michigan', 'Mechanical Engineering']]

    # new_test = [data[:gpa], data[:undergrad_school], data[:applied_school], data[:applied_major]]
    predicted_results = []
    actual_results = [1, 0, 1, 0, 1, 1, 1]
    test.each do |t|
      decision = dec_tree.predict(t)
      if decision == 1
        final_decision = "Accepted"
      else
        final_decision = "Rejected"
      end
      puts "Predicted: #{final_decision}"
      puts "Predicted: #{final_decision} ... True decision: #{t.last}"
      predicted_results.append(decision)
    end





    # decision_new = dec_tree.predict(test)
    # if decision_new == 1
    #   final_decision = "Accepted"
    # else
    #   final_decision = "Rejected"
    # end
    # puts "Predicted: #{final_decision}"
    # puts "Predicted: #{final_decision} ... True decision: #{new_test.last}"

    # Return the accuracy of the model

    # @predicted_probability = predicted_probability
    # puts @predicted_probability
    # Define the actual results

    # Calculate the accuracy of the model
    correct = 0

    actual_results.each_with_index do |result, index|
      if result == predicted_results[index]
        correct += 1
      end
    end

    accuracy = (correct.to_f / actual_results.length) * 100

    puts "The accuracy of the model is #{accuracy}%"
  end
end
