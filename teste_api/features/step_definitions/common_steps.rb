Given('I have my url as {string}') do |url|
    @request = RequestHandler.new(url)
  end
  
  Then('I expect to receive a status {string}') do |status|
    expect(@response[:status].to_i).to eq(status.to_i)
  end
  
  Given('I save my headers as:') do |header_json|
    @request.options[:headers] = JSON.parse(header_json)
  end
  
  Given('I use the payload:') do |payload|
    @request.options[:body] = payload
  end
  
  Then('I execute my request as a {string}') do |method|
    @request.options[:method] = method.downcase
    @response = @request.execute_request
  end
  
  Then('I expect to my response matches the {string} schema') do |schema_name|
     expect(@response[:response]).to match_json_schema(schema_name)
  end