require 'decisiontree'
require 'rubygems'
class Predictor < ActiveRecord::Base

  def self.predict(profile, searched_school)
    # Create a new Decision Tree classifier
    attributes = ['GPA', 'Undergraduate School', 'Applied School', 'Applied Major']
    training = [
      ['3.0', 'UC Berkeley', 'UC Berkeley', 'Computer Science', 1],
      ['4.0', 'University of Iowa', 'Harvard', 'Mechanical Engineering', 1],
      ['3.7', 'University of Iowa', 'Harvard', 'Computer Science', 1],
      ['3.5', 'University of Iowa', 'Harvard', 'Computer Science', 0],
      ['3.4', 'University of Iowa', 'Harvard', 'Computer Science', 0],
      ['3.6', 'University of Iowa', 'Harvard', 'Computer Science', 0],
      ['3.2', 'University of Iowa', 'University of Iowa', 'Mechanical Engineering', 0],
      ['3.5', 'University of Iowa', 'University of Iowa', 'Mechanical Engineering', 1],
      ['3.5', 'University of Iowa', 'University of Iowa', 'Computer Science', 1],
      ['3.7', 'University of Iowa', 'University of Iowa', 'Computer Science', 1],
      ['3.2', 'University of Iowa', 'University of Iowa', 'Computer Science', 0],
      ['3.6', 'University of Iowa', 'University of Iowa', 'Electrical Engineering', 1],
      ['3.0', 'University of Iowa', 'University of Iowa', 'Electrical Engineering', 0],
      ['3.4', 'University of Iowa', 'University of Iowa', 'Computer Science and Engineering', 1],
      ['3.0', 'University of Iowa', 'University of Iowa', 'Computer Science and Engineering', 0],
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
      ["3.2", "University of South Carolina", "University of California - Santa Cruz", "Management", 1],
      ["3.3", "University of Iowa", "Harvard", "Computer Science", 0],
      ["3.6", "University of California - Los Angeles", "University of Colorado - Boulder", "Computer Science", 1],
      ["3.9", "Stanford University", "University of Michigan", "Computer Science", 1],
      ["3.2", "University of Texas - Austin", "University of California - Santa Barbara", "Computer Science", 0],
      ["3.8", "University of Florida", "University of Washington", "Computer Science", 1],
      ["3.1", "University of Missouri", "University of Illinois - Urbana Champaign", "Computer Science", 0],
      ["3.5", "University of Wisconsin - Madison", "University of California - Davis", "Computer Science", 1],
      ["3.4", "University of Southern California", "University of California - San Diego", "Computer Science", 1],
      ["3.7", "University of Minnesota", "University of Massachusetts - Amherst", "Computer Science", 1],
      ["3.3", "University of Kansas", "University of Oregon", "Computer Science", 0],
      ["3.6", "University of California - Berkeley", "University of California - Berkeley", "Computer Science", 1],
      ["3.9", "University of New Mexico", "University of Pennsylvania", "Computer Science", 1],
      ["3.2", "University of Iowa", "Northwestern University", "Computer Science", 0],
      ["3.8", "University of Georgia", "Yale University", "Computer Science", 1],
      ["3.5", "University of Vermont", "University of Virginia", "Computer Science", 1],
      ["3.6", "University of Delaware", "Cornell University", "Computer Science", 1],
      ["3.1", "University of Arkansas", "University of Pittsburgh", "Computer Science", 0],
      ["3.7", "University of Nebraska", "Rice University", "Computer Science", 1],
      ["3.4", "University of Oklahoma", "Princeton University", "Computer Science", 1],
      ["3.9", "University of Montana", "Georgetown University", "Computer Science", 1],
      ["3.3", "University of South Dakota", "Emory University", "Computer Science", 0],
      ["3.8", "University of North Dakota", "Duke University", "Computer Science", 1],
      ["3.5", "University of Wyoming", "University of Chicago", "Computer Science", 1],
      ["3.6", "University of Idaho", "University of Notre Dame", "Computer Science", 0],
      ["3.1", "University of Mississippi", "University of California - Los Angeles", "Computer Science", 0],
      ["3.7", "University of Alabama", "University of California - San Diego", "Computer Science", 1],
      ["3.4", "University of Tennessee", "University of California - Santa Barbara", "Computer Science", 1],
      ["3.9", "University of Louisiana", "University of California - Irvine", "Computer Science", 1],
      ["3.2", "University of South Carolina", "University of California - Santa Cruz", "Computer Science", 1],
      ["3.3", "University of Iowa", "Harvard", "Computer Science", 0],
      ["3.6", "University of California - Los Angeles", "University of Colorado - Boulder", "Computer Science", 1],
      ["3.9", "Stanford University", "University of Michigan", "Computer Science", 1],
      ["3.2", "University of Texas - Austin", "University of California - Santa Barbara", "Computer Science", 0],
      ["3.8", "University of Florida", "University of Washington", "Computer Science", 1],
      ["3.1", "University of Missouri", "University of Illinois - Urbana Champaign", "Computer Science", 0],
      ["3.5", "University of Wisconsin - Madison", "University of California - Davis", "Computer Science", 0],
      ["3.4", "University of Southern California", "University of California - San Diego", "Computer Science", 1],
      ["3.7", "University of Minnesota", "University of Massachusetts - Amherst", "Computer Science", 1],
      ["3.3", "University of Kansas", "University of Oregon", "Computer Science", 0],
      ["3.6", "University of California - Berkeley", "University of California - Berkeley", "Computer Science", 1],
      ["3.9", "University of New Mexico", "University of Pennsylvania", "Computer Science", 1],
      ["3.2", "University of Iowa", "Northwestern University", "Computer Science", 0],
      ["3.8", "University of Georgia", "Yale University", "Computer Science", 1],
      ["3.5", "University of Vermont", "University of Virginia", "Computer Science", 1],
      ["3.6", "University of Delaware", "Cornell University", "Computer Science", 1],
      ["3.1", "University of Arkansas", "University of Pittsburgh", "Computer Science", 0],
      ["3.7", "University of Nebraska", "Rice University", "Computer Science", 1],
      ["3.4", "University of Oklahoma", "Princeton University", "Computer Science", 1],
      ["3.9", "University of Montana", "Georgetown University", "Computer Science", 1],
      ["3.3", "University of South Dakota", "Emory University", "Computer Science", 0],
      ["3.8", "University of North Dakota", "Duke University", "Computer Science", 1],
      ["3.5", "University of Wyoming", "University of Chicago", "Computer Science", 1],
      ["3.6", "University of Idaho", "University of Notre Dame", "Computer Science", 0],
      ["3.1", "University of Mississippi", "University of California - Los Angeles", "Computer Science", 0],
      ["3.7", "University of Alabama", "University of California - San Diego", "Computer Science", 1],
      ["3.4", "University of Tennessee", "University of California - Santa Barbara", "Computer Science", 1],
      ["3.9", "University of Louisiana", "University of California - Irvine", "Computer Science", 1],
      ["3.2", "University of South Carolina", "University of California - Santa Cruz", "Computer Science", 0]
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

    predicted_results = []
    actual_results = [1, 0, 1, 0, 1, 1, 1]
    test.each do |t|
      decision = dec_tree.predict(t)
      if decision == 1
        final_decision = "Accepted"
      else
        final_decision = "Rejected"
      end
      # puts "Predicted: #{final_decision}"
      # puts "Predicted: #{final_decision} ... True decision: #{t.last}"
      predicted_results.append(decision)
    end

    new_test = [(profile.gpa).to_s, profile.college_name, searched_school, profile.interested_major]
    puts new_test
    decision_new = dec_tree.predict(new_test)
    if decision_new == 1
      final_decision = "Accepted"
    else
      final_decision = "Rejected"
    end
    puts "Predicted: #{final_decision}"


    correct = 0

    actual_results.each_with_index do |result, index|
      if result == predicted_results[index]
        correct += 1
      end
    end

    accuracy = (correct.to_f / actual_results.length) * 100
    accuracy = accuracy.round(2)
    puts "The accuracy of the model is #{accuracy}%"
    return {"decision" =>final_decision,"accuracy" => accuracy}
  end
end
