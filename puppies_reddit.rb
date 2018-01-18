require 'unirest'

  system "clear"
  puts "Welcome to a Wolrd of Pupperinos. For you. By Me."
  puts
  puts "Choose a pup subreddit."

  input_pup = gets.chomp


    pups_response = Unirest.get("https://www.reddit.com/r/#{input_pup}/.json=false&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5")

    puppies = pups_response.body
    puts puppies["data"]
