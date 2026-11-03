# frozen_string_literal: true

require 'rubygems'
require 'bundler/setup'
require 'rspec/core/rake_task'

task default: %w[server]

task :server do
  sh 'rackup --host 0.0.0.0'
end

# Rebuild data/moon_ephemeris.bsp from NASA JPL's DE440s, keeping only the
# Sun (10), Earth-Moon barycenter (3), Moon (301) and Earth (399) segments
task :ephemeris do
  require 'astronoby'
  require 'tmpdir'

  Dir.mktmpdir do |dir|
    full = File.join(dir, 'de440s.bsp')
    Astronoby::Ephem.download(name: 'de440s.bsp', target: full)
    sh "ruby-ephem excerpt --targets 3,10,301,399 1970-01-01 2100-01-01 #{full} data/moon_ephemeris.bsp"
  end
end

task :test do
  RSpec::Core::RakeTask.new(:spec)
  Rake::Task['spec'].execute
end
