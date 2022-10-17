Before do |scn|
    @step_index = 0

    @scenario_name             = scn.name.gsub(/[^\w]/, "_")
    @execution_start_timestamp = Time.now.strftime("%Y/%b/%d/%H_%M_%S")
    @execution_start_seconds   = Time.now.strftime("%s")
    @screenshots_path          = "#{Dir.pwd}/data/screenshots/#{@scenario_name}/#{@execution_start_timestamp}/#{@execution_start_seconds}"
end

After do |scn|
    scn_status = scn.failed? ? "FAILURE" : "SUCCESS"
    screenshot = "#{@screenshots_path}/#{scn_status}.png"

    if scn.failed? && ENV['DEBUG'] == 'true'
        binding.irb
    end

    save_screenshot(screenshot)
    attach(screenshot)
end

AfterStep do |scenario|
    if ENV['STEPS_DEBUG']
        @step_index += 1
        screenshot = "#{@screenshots_path}/#{@step_index}.png"
    
        save_screenshot(screenshot)
        attach("image/png", screenshot)
    end
end