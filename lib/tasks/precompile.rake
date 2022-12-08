require 'json'
require 'fileutils'

namespace :assets do
  task :precompile do
    puts '####### Task assets:precompile extended in lib/tasks/precompile.rake !'
    puts '####### Add native files to public/assets if requested outside from asset pipeline'

    Dir.glob("public/assets/.sprockets-manifest*.json").each do |fname|
      manifest = IO.read(fname)
      mhash = JSON.parse(manifest)
      mhash['files'].each do |key, value|
        source = "public/assets/#{key}"
        target = "public/assets/#{value['logical_path']}"

        puts "# create #{target}"
        FileUtils.cp(source, target)
      end
    end
  end
end
