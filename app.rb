require "sinatra"
require "dinosaurus"

Dinosaurus.configure do |config|
  config.api_key = '87cf119299df8d59521c6aa31c2a1e5e'
end

#results = Dinosaurus.lookup('word')

get '/lorem' do
  redirect 'lorem.html'
end

post '/process' do
@topic = params['word']
@nsentences = params['nsentences']
@nparagraphs = params['nparagraphs']

results = []
results = Dinosaurus.lookup(@topic)

results2 = []
results2 = Dinosaurus.lookup(results['noun']['syn'].sample)

a = @nsentences.to_i
b = @nparagraphs.to_i

@nwords = []
@sentences = []
@content = []

results['noun']['syn'].each do |word|
  @nwords << word
end

results2['noun']['syn'].each do |word|
  @nwords << word
end

b.times do
  @sentences = (1..a).map{(1..15).map{@nwords.sample}.join(" ")}.join(". ").to_s + "."
  @content << @sentences
end

  erb :ERB



end


