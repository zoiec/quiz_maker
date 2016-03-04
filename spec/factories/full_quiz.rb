def setup_full_quiz
  quiz = FactoryGirl.create(:quiz, 
                            title: "Naughty or Nice?",
                            intro_content: "What will YOU be getting for christmas?") 
  outcomes = [FactoryGirl.create(:outcome, 
                                 quiz: quiz,
                                 name: "Naughty", 
                                 body: "You're getting coal!"),
              FactoryGirl.create(:outcome,
                                 quiz: quiz,
                                 name: "Nice",
                                 body: "You're getting presents!")]
  questions = [FactoryGirl.create(:question,
                                 quiz: quiz,
                                 body: "How often did you floss this year?"),
               FactoryGirl.create(:question,
                                  quiz: quiz,
                                  body: "Have you given to charity this year?")]
  choices = [FactoryGirl.create(:choice,
                                question: questions[0],
                                body: "Always"),
             FactoryGirl.create(:choice,
                               question: questions[0],
                               body: "Never"),
             FactoryGirl.create(:choice,
                                question: questions[1],
                                body: "Yes"),
             FactoryGirl.create(:choice,
                                question: questions[1],
                                body: "No")]
  weights = [FactoryGirl.create(:weight,
                                choice: choices[0],
                                outcome: outcomes[1],
                                strength: 1),
             FactoryGirl.create(:weight,
                                choice: choices[1],
                                outcome: outcomes[0],
                                strength: 1),
             FactoryGirl.create(:weight,
                                choice: choices[2],
                                outcome: outcomes[1],
                                strength: 1),
             FactoryGirl.create(:weight,
                                choice: choices[3],
                                outcome: outcomes[0],
                                strength: 1)]
  quiz
end
