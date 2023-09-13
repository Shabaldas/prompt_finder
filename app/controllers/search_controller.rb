# frozen_string_literal: true

class SearchController < ApplicationController
  def search
    @results = Prompt.search(sanitize_string_for_elasticsearch_string_query(params[:query]), highlight: { tag: '<strong>' })

    # collection = Prompt.pagy_search(params[:query], highlight: { tag: '<strong>' })

    # @pagy, @results = pagy_searchkick(collection, items: 10)

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.update('results', partial: 'home/search_results',
                                                            locals: { results: @results })
      end
    end
  end

  def sanitize_string_for_elasticsearch_string_query(str)
    # Escape special characters
    # http://lucene.apache.org/core/old_versioned_docs/versions/2_9_1/queryparsersyntax.html#Escaping Special Characters
    escaped_characters = Regexp.escape('\\/+-&|!(){}[]^~*?:')
    str = str.gsub(/([#{escaped_characters}])/, '\\\\\1')
  
    # AND, OR and NOT are used by lucene as logical operators. We need
    # to escape them
    ['AND', 'OR', 'NOT'].each do |word|
      escaped_word = word.split('').map {|char| "\\#{char}" }.join('')
      str = str.gsub(/\s*\b(#{word.upcase})\b\s*/, " #{escaped_word} ")
    end
  
    # Escape odd quotes
    quote_count = str.count '"'
    str = str.gsub(/(.*)"(.*)/, '\1\"\3') if quote_count % 2 == 1
  
    str
  end
end
