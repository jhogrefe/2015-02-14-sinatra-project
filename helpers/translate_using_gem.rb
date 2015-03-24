# Creates new BingTranslator object and uses Microsoft Translator API to return 
# translation.
module TranslatorService

  def translate_using_gem
    cs1 = BingTranslator.new('free-software-translation',
    ENV['BING_TRANSLATE_KEY'], params)
    if (params[:translate]) == ''
      redirect to("/")
    else
      @es = cs1.translate((params[:translate]), :from => 'en', :to => 'es')
      @fr = cs1.translate((params[:translate]), :from => 'en', :to => 'fr')
      @de = cs1.translate((params[:translate]), :from => 'en', :to => 'de')
      @it = cs1.translate((params[:translate]), :from => 'en', :to => 'it')
      @cs1 = (params[:translate])
    end
  end
    
end