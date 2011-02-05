
module Bones::Plugins::Rspec
  include ::Bones::Helpers
  extend self

  def initialize_rspec
    gemspec = Gem.loaded_specs['rspec']

    if gemspec
      version = gemspec.version.segments.first
      path = File.expand_path("../../rspec/rspec_version#{version}", __FILE__)
      require path

      @delegate = Bones::Rspec.const_get "RspecVersion#{version}"
      have?(:rspec) { @delegate.initialize_rspec }
    else
      version = 2
      while (version > 0)
        path = File.expand_path("../../rspec/rspec_version#{version}", __FILE__)
        require path

        @delegate = Bones::Rspec.const_get "RspecVersion#{version}"
        have?(:rspec) { @delegate.initialize_rspec }
        break if have? :rspec
        version -= 1
      end
    end
  end

  def post_load
    return unless have? :rspec
    @delegate.post_load
  end

  def define_tasks
    return unless have? :rspec
    @delegate.define_tasks
  end

end  # Bones::Plugins::Rspec

