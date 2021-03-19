defmodule RandomWords do
  # Module for generating random social network node names 
  # (for use in urls). Ideally, this would be running as 
  # a supervised GenServer process in the Application
  # and called to yield a new unique random id of form
  # `adjective-noun`. Uniqueness can be enforced by the 
  # process itself with rules and reset when needed.
  # Will need to populate my adjective and noun list to 
  # accommodate more possibilities. The file could be
  # read only once on start up and words loaded into 
  # memory like so.

  def get_words do
    adjs = String.split(File.read!("adjectives.txt"), ~r{\s}, trim: true)
    nouns = String.split(File.read!("nouns.txt"), ~r{\s}, trim: true)
    %{adjs: adjs, nouns: nouns}
  end
end

words = RandomWords.get_words()
randAdj = Enum.random(words.adjs)
randNoun = Enum.random(words.nouns)

IO.puts("#{randAdj}-#{randNoun}")

# TODO in Prod, would need to check if `id` (combination) is 
#   not currently in use in DB
