require 'bundler'
Bundler::GemHelper.install_tasks

# Check if versions are correct between VERSION constants and .js files
#
task :release => [:guard_version]

task :guard_version do
  def check_version(file, pattern, constant)
    body = File.read("vendor/assets/javascripts/#{file}")
    match = body.match(pattern) or abort "Version check failed: no pattern matched in #{file}"
    file_version = body.match(pattern)[1]
    constant_version = Durl::Rails.const_get(constant)

    unless constant_version == file_version
      abort "Durl::Rails::#{constant} was #{constant_version} but it should be #{file_version}"
    end
  end

  check_version('durl.js', /Version: ([\S]+)/, 'DURL_VERSION')
end

task :update_durl do
  puts "Downloading durl.js"
  puts `curl -o vendor/assets/javascripts/durl.js https://raw.githubusercontent.com/tkasten/durl/master/src/durl.js`

  puts "Updating version.rb"
  version = false
  File.foreach('vendor/assets/javascripts/durl.js') do |line|
    version = line.match(/Version: ([\S]+)/)
    version = version && version[1]
    break if version
  end

  version_path = 'lib/durl/rails/version.rb'
  lines = IO.readlines(version_path).map do |line|
    line.gsub(/DURL_VERSION = "([\d\.]+)"/, "DURL_VERSION = \"#{version}\"")
  end
  File.open(version_path, 'w') do |file|
    file.puts lines
  end

  puts "\e[32mDone!\e[0m"
end
