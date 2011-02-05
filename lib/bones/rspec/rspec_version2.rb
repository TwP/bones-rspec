
module Bones::Rspec

  module RspecVersion2
    include ::Bones::Helpers
    extend self

    def initialize_rspec
      require 'rspec/core/rake_task'

      ::Bones.config {
        desc 'Configuration settings for the RSpec test framework.'
        spec {
          files  'spec/**/*_spec.rb', :desc => <<-__
            Glob pattern used to match spec files to run. This defaults to all
            the ruby fines in the 'spec' directory that end with '_spec.rb' as
            their filename.
          __

          opts [], :desc => <<-__
            An array of command line options that will be passed to the rspec
            command when running your tests. See the RSpec help documentation
            either online or from the command line by running 'spec --help'.

            Options can also be defined in the "spec/spec.opts" file. Please
            leave this opts array empty if you prefer to use the spec.opts file
            instead. However, both can be used in conjunction; watch out for
            options colliions.
          __
        }
      }
      return true

    rescue LoadError
      return false
    end

    def post_load
      config = ::Bones.config
      have?(:rspec) { !FileList[config.spec.files].to_a.empty?  }
    end

    def define_tasks
      config = ::Bones.config

      namespace :spec do
        desc 'Run all specs with basic output'
        ::RSpec::Core::RakeTask.new(:run) do |t|
          t.ruby_opts = config.ruby_opts
          t.rspec_opts = config.spec.opts unless config.spec.opts.empty?
          t.pattern = config.spec.files
        end

        if have? :rcov
          desc 'Run all specs with Rcov'
          ::RSpec::Core::RakeTask.new(:rcov) do |t|
            t.ruby_opts = config.ruby_opts
            t.rspec_opts = config.spec.opts unless config.spec.opts.empty?
            t.pattern = config.spec.files

            t.rcov = true
            t.rcov_path = config.rcov.path

            rcov_opts = []
            rcov_opts.concat config.rcov.opts
            rcov_opts << '--output' << config.rcov.dir if config.rcov.dir

            t.rcov_opts = rcov_opts
          end

          task :clobber_rcov do
            rm_r config.rcov.dir rescue nil
          end
        end
      end  # namespace :spec

      desc 'Alias to spec:run'
      task :spec => 'spec:run'

      task :clobber => 'spec:clobber_rcov' if have? :rcov
    end

  end  # RspecVersion2
end  # Bones::Rspec

