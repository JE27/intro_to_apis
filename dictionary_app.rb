  require 'unirest'

  looking_up_words = true

  while true
  system "clear"
  puts "Word, Words, and More Words"
  puts
  puts "Enter a word! "


  input_word = gets.chomp

  

    definitions_response = Unirest.get("http://api.wordnik.com/v4/word.json/#{input_word}/definitions?limit=10&includeRelated=true&useCanonical=false&includeTags=false&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5")

    definitions = definitions_response.body


    definitions.each.with_index do |definition, index|
    puts "#{index + 1} - #{definition["text"]}"
    puts
    end

    puts
    puts

    top_example_response = Unirest.get("http://api.wordnik.com:80/v4/word.json/#{input_word}/topExample?useCanonical=false&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5")

    top_example = top_example_response.body
    puts top_example["text"]

    pronunciations_response = Unirest.get("http://api.wordnik.com:80/v4/word.json/#{input_word}/pronunciations?useCanonical=false&limit=50&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5")

    pronunciations = pronunciations_response.body
    p pronunciations[0]["raw"]

  puts "Press enter to look up another word or press 'q' to exit."
  user_input = gets.chomp
  if input_word == "q"
    break
  end

  end
 puts "Thanks for lookin'"

